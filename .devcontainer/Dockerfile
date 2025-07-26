# syntax=docker/dockerfile:1
FROM node:20-slim

# Install minimal dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    bash \
    sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace
