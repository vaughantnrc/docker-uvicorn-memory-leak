# syntax=docker/dockerfile:1
FROM ubuntu:22.04
RUN apt update
RUN apt install -y python3-pip
RUN python3 -m pip install --upgrade pip
RUN pip3 install uvicorn[standard]
COPY main.py /
CMD ["python3", "main.py"]
