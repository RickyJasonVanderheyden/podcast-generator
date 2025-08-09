FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  python3-venv \
  git

# Create a virtual environment
RUN python3 -m venv /venv

# Ensure pip from the virtualenv is used
ENV PATH="/venv/bin:$PATH"

# Install PyYAML in the virtual environment
RUN pip install PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]