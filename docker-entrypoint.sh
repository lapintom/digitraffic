#!/bin/bash

# Signal handler to clean up and exit properly when terminating
trap "echo Exiting...; kill -TERM -1; exit" SIGINT SIGTERM

echo
echo "Installing required Ruby gems. Please wait..."
echo
gem install bundler
bundle install
bundle update
echo
echo "Installing required node packages. Please wait..."
echo
npm install
npm update --save
npm audit fix

#bundle exec jekyll serve --config _config_dev.yml --host=0.0.0.0 &
npm run dev &

while true
do
 sleep 1
done