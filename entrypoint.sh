#!/bin/bash
set -e
rm -rf /ZeeDog/tmp/pids/server.pid

exec "$@"