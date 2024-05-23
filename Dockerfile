FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu22.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y tzdata
ENV TZ Asia/Tokyo

RUN apt-get update && apt-get install -y \
    libopencv-dev \
    python3.9 \
    python3-pip \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

ENV CUDA_HOME /usr/local/cuda-11.7/

RUN pip install torch==2.0.1+cu117 torchvision==0.15.2+cu117 --index-url https://download.pytorch.org/whl/cu117
