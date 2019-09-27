#!/bin/bash
set -e

if [ "$1" = 'worker' ]; then
  # Use -u to force python to not buffer output
  python -u worker.py
elif [ "$1" = 'publish' ]; then
  # Use -u to force python to not buffer output
  python -u publisher.py
else
  echo "Nothing to do!"
fi
