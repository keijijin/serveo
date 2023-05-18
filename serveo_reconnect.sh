#!/bin/bash

LOCAL_PORT=5001
REMOTE_PORT=80

while true; do
  ssh -o ServerAliveInterval=60 -o ExitOnForwardFailure=yes -R ${REMOTE_PORT}:localhost:${LOCAL_PORT} serveo.net
  echo "Serveo connection lost. Reconnecting in 10 seconds..."
  sleep 10
done
