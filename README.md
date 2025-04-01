# chat-ollama

My own chat gpt using Ollama open source model

## How to run

1. Clone the repository and cd into it
2. Make sure you have docker and docker compose installed
3. Run the app
```bash
docker compose build && docker compose up
```
4. Open your browser and go to `http://0.0.0.0:9999/chat?prompt=how%20is%20the%20weather%20today`


Alternatively, install ollama and the model locally, to use the GPU, using the instructions present in the dockerfile, 
and run the command line utility:

```bash
time pipenv run chat  "Qual o nome do cavalo branco de napoleao?"
```