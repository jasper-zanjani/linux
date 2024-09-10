# Check that Elasticsearch is running by conducting an API call
curl -X GET http://localhost:9200

# Access various Elasticsearch API endpoints
curl -X GET localhost:9200/_cluster/health

# Sending a POST method to a FastAPI app (https://app.pluralsight.com/guides/explore-python-libraries:-fastapi)
curl -X POST "http://127.0.0.1:8000/purchase/item/" -H "accept: application/json" -H "Content-Type: application/json" -d "{\"name\":\"sample item\",\"info\":\"This is info for the item\",\"price\":40,\"qty\":2}"

# Check that a local geth host is running with JSON-RPC endpoint enabled
curl -X POST -H "Content-Type: application/json" \
    --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":1}' \
    http://localhost:8545