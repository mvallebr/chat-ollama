from pathlib import Path

from fastapi import FastAPI
import ollama

from chat_ollama.common import load_model_name

app = FastAPI()



@app.get("/chat")
async def chat(prompt: str):
    # Send prompt to Ollama model
    response = ollama.chat(model=load_model_name(), messages=[{'role': 'user', 'content': prompt}])
    return {"response": response['message']['content']}
