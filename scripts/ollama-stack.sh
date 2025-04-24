#!/bin/bash

docker run -d -p 3000:8080 -e WEBUI_AUTH=False -v ollama:/root/.ollama -v open-webui:/app/backend/data --replace --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
