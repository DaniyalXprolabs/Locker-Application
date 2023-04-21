#!/bin/sh

set -e

echo "ENVIRONMENT: $RAILS_ENV"

# Check bundle
bundle check || bundle install

bundle exec ${@}