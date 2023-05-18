#!/bin/bash

LOCAL_HOST=$1
LOCAL_PORT=$2
REMOTE_PORT=80
TO_EMAIL="keijijin@gmail.com"
SUBJECT="Serveo URL Changed"
FROM_EMAIL="kjin@redhat.com"

LAST_IP=""

while true; do
  # Get the current IP address
  IP=$(curl -s http://ifconfig.me)

  # Compare with the last IP address
  if [ "$IP" != "$LAST_IP" ]; then
    # Send an email notification
    BODY="The Serveo URL has changed. The new URL is http://${IP}.serveo.net."
    echo "$BODY" | sendmail -f "${FROM_EMAIL}" "${TO_EMAIL}"}
    
    # Update the last IP address
    LAST_IP="$IP"
  fi

  # Forward the local port to the remote port
  ssh -o ServerAliveInterval=60 -o ExitOnForwardFailure=yes -R ${REMOTE_PORT}:${LOCAL_HOST}:${LOCAL_PORT} serveo.net
  
  # Sleep for 10 seconds
  echo "Serveo connection lost. Reconnecting in 10 seconds..."
  sleep 10
done
