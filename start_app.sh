#!/bin/sh

# Start Ollama service
echo "Starting Ollama service..."
ollama serve &

# Wait for Ollama to be ready
until ollama --version; do
  echo "Waiting for Ollama to be ready..."
  sleep 2
done

# Run the FastAPI application
pipenv run uvicorn chat_ollama.chat_ollama:app --host 0.0.0.0 --port 9999