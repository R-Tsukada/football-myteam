#!/bin/bash
set -e
# Remove a potentially pre-existing server.pid for Rails.
rm -f /football/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

if [ $RAILS_ENV = 'production' ]; then
  bundle exec rails assets:clobber
  bundle exec rails assets:precompile
fi
