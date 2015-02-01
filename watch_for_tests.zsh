#!/bin/zsh

set -e

COFFEESCRIPT_PIPE=/tmp/watcher-coffeescript.fifo
ELIXIR_PIPE=/tmp/watcher-elixir.fifo
RUBY_PIPE=/tmp/watcher-ruby.fifo
PIPES=($COFFEESCRIPT_PIPE $ELIXIR_PIPE $RUBY_PIPE)
for PIPE in $PIPES
do
  echo "... $PIPE"
  if [[ -e $PIPE && ! -p $PIPE ]]
  then
    echo "*** $PIPE exists but is not a pipe"
    rm $PIPE
  fi
  if [[ ! -e $PIPE ]]
  then
    echo "--- doesn't exist: $PIPE"
    mkfifo $PIPE
  fi
done

#trap "for PIPE in $PIPES; do echo $PIPE; [[ -e $PIPE ]] && rm $PIPE; done" EXIT

echo "coffee..."
find ./coffeescript/ -name "*.coffee" | entr +$COFFEESCRIPT_PIPE &
while read COFFEESCRIPT_FILE; do
  echo "running: $(find $(dirname $COFFEESCRIPT_FILE) -name ".spec.coffee")"
  jasmine-node --coffee $(find $(dirname $COFFEESCRIPT_FILE) -name ".spec.coffee")
done < $COFFEESCRIPT_PIPE

echo "elixir..."
find ./elixir/ -name "*.exs" | entr +$ELIXIR_PIPE &
while read ELIXIR_FILE; do
  cd $(dirname $ELIXIR_FILE) # elixir doesn't have a require_relative
  elixir $(find . -name "*test.exs")
done < $ELIXIR_PIPE

echo "ruby..."
find ./ruby/ -name "*.rb" | entr +$RUBY_PIPE &
#coproc
while read RUBY_FILE; do
  ruby $(find $(dirname $RUBY_FILE) -name "*_test.rb")
done < $RUBY_PIPE

echo "...done"
