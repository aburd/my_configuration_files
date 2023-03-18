#!/bin/bash
# Caution: You may not need some of these services... (e.g. xremap)
for f in services/*;
do
  SERVICE=$(basename $f | sed -e "s/\..*//")
  echo "Starting service $SERVICE"
  systemctl start "$SERVICE"
  systemctl enable "$SERVICE"
done
