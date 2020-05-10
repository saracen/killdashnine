#!/bin/bash

echo "Setting traps"

trap 'echo SIGINT; curl https://webhook.site/dcd3e599-8e35-437b-970d-2323e8380001' SIGINT
trap 'echo SIGTERM; curl https://webhook.site/dcd3e599-8e35-437b-970d-2323e8380001' SIGTERM

echo "Traps set"

for (( ; ; ))
do
   echo $(date)
   sleep 1
done
