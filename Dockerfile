
# Use a newer Python version with Debian Bookworm
FROM python:3.11-slim-bookworm

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install required system dependencies and AWS CLI
RUN apt-get update && apt-get install -y --no-install-recommends \
    awscli \
    ffmpeg \
    libsm6 \
    libxext6 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN python -m pip install --no-cache-dir --upgrade pip && \
    python -m pip install --no-cache-dir -r requirements.txt

# Run the application
CMD ["python", "app.py"]

