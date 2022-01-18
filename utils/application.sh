#!/bin/bash

if test -z "$COMMAND"
then
    wine explorer /desktop=application,${DISPLAY_WIDTH}x${DISPLAY_HEIGHT} ${APPLICATION}
else
    eval $COMMAND
fi
