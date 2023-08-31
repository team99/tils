#!/bin/bash
# Simple script to run a bunch of workers in tmux windows

NO_OF_WORKERS=$1

tmux new -d -s "parent"

echo "Starting $NO_OF_WORKERS processes... "
for ((i=0; i<NO_OF_WORKERS; ++i));
do
    echo "Staring a worker id $i"
    tmux new-window
    tmux rename-window "worker-$i"
    # tmux send-keys "source venv/bin/activate" Enter;
    # tmux send-keys "python ..." Enter;
done