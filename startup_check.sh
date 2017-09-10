VM_STATUS=`vagrant status --machine-readable | grep ",state," | egrep -o '([a-z]*)$'`
case "${VM_STATUS}" in
  running)
    vagrant ssh
;;
  poweroff)
    vagrant up
    vagrant ssh
;;
  *)
    echo "Unhandled: ${VM_STATUS}"
  ;;
esac
