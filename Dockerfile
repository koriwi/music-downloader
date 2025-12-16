FROM debian:12
WORKDIR /usr/src/app

RUN apt -y update
RUN apt -y install ffmpeg python3 python3-pip python3-venv wget unzip

RUN wget "https://github.com/soggy8/music-downloader/archive/refs/heads/main.zip"
RUN unzip main.zip

WORKDIR /usr/src/app/music-downloader-main/backend

RUN python3 -m venv venv && . venv/bin/activate && pip install -r requirements.txt

ENTRYPOINT ["sh","-c"]
CMD [". venv/bin/activate && python app.py"]
