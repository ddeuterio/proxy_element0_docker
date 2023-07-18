FROM nginx:stable
RUN apt update
RUN apt install python3 python3-venv libaugeas0 snapd cron -y
RUN python3 -m venv /opt/certbot/
RUN /opt/certbot/bin/pip install --upgrade pip
RUN /opt/certbot/bin/pip install certbot certbot-nginx certbot-dns-google-domains
RUN ln -s /opt/certbot/bin/certbot /usr/bin/certbot
RUN echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | tee -a /etc/crontab > /dev/null
RUN echo "0 0 1 * * root /opt/certbot/bin/pip install --upgrade certbot certbot-nginx certbot-dns-google-domains" | tee -a /etc/crontab > /dev/null