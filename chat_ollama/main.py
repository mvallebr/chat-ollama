import ollama
import argparse
from chat_ollama.common import load_model_name

def parse_args():
    parser = argparse.ArgumentParser(description="Chat with Ollama model")
    parser.add_argument('prompt', type=str, help='The prompt to send to the model')
    return parser.parse_args()

def main():
    args = parse_args()
    response = ollama.chat(model=load_model_name(), messages=[{'role': 'user', 'content': args.prompt}])
    print(response['message']['content'])

if __name__ == "__main__":
    main()
