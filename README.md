### Twitter clone used for educational pairing
To run:
```
docker compose up
# or depending on your docker compose version
docker-compose up
```

Created with:
```
docker run -it -v /Users/me/development:/development -w /development ruby:latest bash
gem install rails
rails new hooter --database=postgresql --css=tailwind
git add .
git commit -m "Initial commit"
```
