from fastapi import FastAPI
import ollama

app = FastAPI()

@app.get("/chat")
async def chat(prompt: str):
    # Send prompt to Ollama model
    response = ollama.chat(model='deepseek-r1', messages=[{'role': 'user', 'content': prompt}])
    return {"response": response['message']['content']}
