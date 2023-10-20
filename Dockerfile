# syntax=docker/dockerfile:1
FROM ubuntu:22.04
RUN apt update
RUN apt install -y python3-pip
RUN python3 -m pip install --upgrade pip
RUN pip3 install watchfiles==0.21.0
COPY main.py /app/
WORKDIR /app/
# This next line causes the problem...
# Previously main.py was in the linux root and being run from there,
# Leading watchfiles to watch the entire OS.
RUN ln -s / /app/root
CMD ["python3", "main.py"]
