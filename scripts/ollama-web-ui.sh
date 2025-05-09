#!/bin/bash

docker run -d --network=host -e WEBUI_AUTH=False -v open-webui:/app/backend/data --replace --name open-webui ghcr.io/open-webui/open-webui:main
