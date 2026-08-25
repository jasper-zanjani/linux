#!/usr/bin/bash
transcript() {
  local MODEL="turbo"
  local ENDPOINT="runsync"
  if [[ -z $RUNPOD_API_KEY ]];
  then
    echo "Set Runpod API key to RUNPOD_API_KEY"
    return 1
  fi

  if [[ -z $1 ]]
  then
    echo "Provide URL for audio"
    return 1
  else
    local AUDIO_URL=$1
  fi

  local DATA
  printf -v DATA '{"input":{"audio":"%s","model":"%s","transcription":"plain text","translate":false,"temperature":0,"best_of":5,"beam_size":5,"suppress_tokens":"-1","condition_on_previous_text":false,"temperature_increment_on_fallback":0.2,"compression_ratio_threshold":2.4,"logprob_threshold":-1,"no_speech_threshold":0.6}}' "$AUDIO_URL" "$MODEL"
  local HEADER_CONTENT_TYPE="Content-Type: application/json"
  local HEADER_AUTH="Authorization: Bearer $RUNPOD_API_KEY"
  local URL="https://api.runpod.ai/v2/xc72ksdrlta4kr/$ENDPOINT"
  local RESPONSE=$(curl \
    --request "POST" "$URL" \
    --header "$HEADER_CONTENT_TYPE" \
    --header "$HEADER_AUTH" \
    --data "$DATA" \
    --silent # suppress progress bar
  )
  echo $RESPONSE
}
