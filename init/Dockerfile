FROM debian:stable-slim
RUN apt update
RUN apt install python3 python3-venv libaugeas0 snapd -y
RUN python3 -m venv /opt/certbot/
RUN /opt/certbot/bin/pip install --upgrade pip
RUN /opt/certbot/bin/pip install certbot certbot-nginx certbot-dns-google-domains
RUN ln -s /opt/certbot/bin/certbot /usr/bin/certbot