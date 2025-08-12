FROM debian:bullseye-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg python3 python3-pip git && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy the Python script
COPY lib/flac2pod.py /app/

# Install Python dependencies
RUN pip3 install mutagen

# Set default entrypoint
ENTRYPOINT ["python3", "flac2pod.py"]
