# syntax=docker/dockerfile:1
FROM ubuntu:22.04
RUN apt update
RUN apt install -y python3-pip
RUN python3 -m pip install --upgrade pip
# One "fix" is to install "uvicorn" instead of "uvicorn[standard]"
RUN pip3 install uvicorn[standard]
COPY main.py /app/
WORKDIR /app/
# But this next line I think is what *really* causes the problem...
RUN ln -s / /app/root
CMD ["python3", "main.py"]
