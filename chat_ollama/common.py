from pathlib import Path


def load_model_name() -> str:
    model_cfg_file_path = Path(__file__).parent / 'model.txt'
    with open(model_cfg_file_path, 'r') as f:
        return f.read().strip()