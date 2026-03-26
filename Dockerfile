FROM python:3.12-slim

WORKDIR /app

# Install dependencies from pyproject.toml
# Copy just the project files needed for installation
COPY pyproject.toml uv.lock* ./

# Install Python dependencies
RUN pip install --no-cache-dir asyncua>=1.1.8 msgspec>=0.20.0

# Copy source code and config
COPY src/ ./src/
COPY config.json ./

# Run the Mock OPC UA Server
CMD ["python", "src/main.py"]
