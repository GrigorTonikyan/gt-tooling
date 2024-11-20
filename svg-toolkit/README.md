# SVG Toolkit

A Python library for working with SVG paths and related utilities.

## Features

- Parse SVG path commands into structured data
- Validate SVG path commands and parameters
- Convert SVG path commands to dictionary format

## Installation

```bash
poetry install
```

## Usage

```python
from svg_toolkit.path import parse_svg_path

# Example SVG path
path = "M47 13a24 24 0 1 0-34 34 24 24 0 0 0 34-34Z"

# Parse the path
result = parse_svg_path(path)
print(result)
```

## Development

This project uses Poetry for dependency management. To set up the development environment:

1. Install Poetry if you haven't already
2. Run `poetry install` to install dependencies
3. Run `poetry shell` to activate the virtual environment

### Code Quality Tools

- `black`: Code formatting
- `isort`: Import sorting
- `mypy`: Static type checking
- `pytest`: Testing

Run the quality checks:
```bash
poetry run black .
poetry run isort .
poetry run mypy .
poetry run pytest
```
