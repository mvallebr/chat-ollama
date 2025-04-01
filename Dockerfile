# Start with a Python base image
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Pipenv
RUN pip install --no-cache-dir pipenv

# Install Ollama CLI
RUN curl -fsSL https://ollama.com/install.sh | sh

COPY ./chat_ollama/model.txt ./chat_ollama/model.txt

# Download the Llama model
RUN ollama serve & sleep 1 && ollama pull $(cat ./chat_ollama/model.txt)

# Copy Pipfile and Pipfile.lock
COPY Pipfile Pipfile.lock ./

# Install Python dependencies
RUN pipenv install --deploy --ignore-pipfile

# Copy the rest of the application
COPY . .

# Expose FastAPI port
EXPOSE 9999

# Run the application
CMD ["./start_app.sh"]