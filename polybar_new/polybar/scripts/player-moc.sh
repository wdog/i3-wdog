#!/bin/bash

STATUS=$(mocp -Q %state)

if [ "$STATUS" == "PLAY" ]; then
    SONG=$(mocp -Q %song)
        
    if [ -n "$SONG" ]; then
      echo "$(mocp -Q %artist): $SONG [ $(mocp -Q %album) ]"
    else
        basename "$(mocp -Q %file)"
    fi
else
    echo $STATUS
fi
