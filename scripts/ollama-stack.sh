#!/bin/bash

podman run -d -p 8080:8080 -e WEBUI_AUTH=False -v ollama:/root/.ollama -v open-webui:/app/backend/data --replace --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
