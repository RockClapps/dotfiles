#!/bin/bash
running=$(ollama ps | grep ":" | awk '{print $1}')
if [[ $running != "" ]]; then
  ollama stop $running
fi
