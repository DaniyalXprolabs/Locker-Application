#!/bin/sh

set -e

echo "ENVIRONMENT: $RAILS_ENV"

# Check bundle
bundle check || bundle install

# remove pid from previous session (puma server)

rm -f $APP_PATH/tmp/pids/server.pid

bundle exec ${@}