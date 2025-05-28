#!/bin/bash
ollama stop $(ollama ps | grep ":" | awk '{print $1}')
