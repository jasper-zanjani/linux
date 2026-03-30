t () {
  if [[ -z $1 ]]; then
    echo "Provide a valid subcommand: u[p], d[own]"
    return 1
  fi
  case $1 in
    d*)
      terraform destroy -auto-approve
      ;;
    u*)
      terraform apply -auto-approve
      ;;
    *)
      terraform $@
      ;;
  esac
}
