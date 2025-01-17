#!/bin/bash

# all env vars used in the client app need to be set here as well
export REACT_APP_API_HOST=${REACT_APP_API_HOST}
export REACT_APP_CLIENT_HOST=${REACT_APP_CLIENT_HOST}
export REACT_APP_ONE_ACCOUNT_EXTERNAL_ID=${REACT_APP_ONE_ACCOUNT_EXTERNAL_ID}

cd client
mkdir -p dist

# Build the UI in the background
nohup sh -c 'echo "The UI is rebuilding. Please wait..." && npm run build && echo "UI built successfully!" && cp -rf build/* dist/' &

# Serve the UI
npx serve -s -p 4018 dist
