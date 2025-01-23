#FROM ubuntu:latest
#MAINTAINER Tuan Thai "tuanthai@example.com"
#RUN apt update -y
#RUN apt install -y python3-pip python3-dev build-essential
#ADD . /flask_app
#WORKDIR /flask_app
#RUN pip3 install -r requirements.txt
#ENTRYPOINT ["python3"]
#CMD ["flask_docker.py"]

FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"
RUN apt update -y
RUN apt install -y python3-pip python3-dev build-essential python3-venv

# Tạo môi trường ảo cho Python
RUN python3 -m venv /env

# Cài đặt các phụ thuộc trong môi trường ảo
RUN /env/bin/pip install --upgrade pip
COPY requirements.txt /flask_app/
RUN /env/bin/pip install -r /flask_app/requirements.txt

ADD . /flask_app
WORKDIR /flask_app

# Chạy Flask từ môi trường ảo
ENTRYPOINT ["/env/bin/python3"]
CMD ["flask_docker.py"]
