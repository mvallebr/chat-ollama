#!/bin/sh

# Start Ollama service
echo "Starting Ollama service..."
ollama serve &

# Wait for Ollama to be ready
until curl -s http://localhost:11400/health; do
  echo "Waiting for Ollama to be ready..."
  sleep 2
done

# Run the FastAPI application
exec "$@"