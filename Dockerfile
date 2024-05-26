FROM alpine:latest

# add mono repo and mono
RUN apk add --no-cache mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing

# install requirements
RUN  apk add --no-cache --upgrade ffmpeg mediainfo python3 git py3-pip python3-dev g++ cargo mktorrent rust
RUN venv/bin/python -m install wheel

WORKDIR Upload-Assistant

# install reqs
COPY requirements.txt .
RUN venv/bin/python -m install -r requirements.txt

# copy everything
COPY . .

ENTRYPOINT ["python3", "/Upload-Assistant/upload.py"]
