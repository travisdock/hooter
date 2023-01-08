rm -f tmp/pids/server.pid

bundle exec foreman start -f Procfile.dev -p 3000
