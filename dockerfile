FROM debian:10.0

COPY ./app/ /home/flask/app/
COPY ./start.sh /usr/local/start.sh
COPY ./issue.net /etc/issue.net
COPY ./motd /etc/motd

RUN chmod +x /usr/local/start.sh && \
    apt update && \
    apt upgrade -y && \
    apt install nano vim curl wget python python3 python3-distutils ssh htop -y && \
    cd /tmp && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip3.py && \
    curl https://bootstrap.pypa.io/2.7/get-pip.py -o get-pip2.py && \
    python3 get-pip3.py && \
    python get-pip2.py && \
    pip3 install Flask Flask-Login Flask-Migrate Flask-Script Flask-SQLAlchemy \
                 redis PyMySQL urllib3 requests psycopg2-binary gunicorn && \
    mkdir /run/sshd && \
    sed -i 's/#PermitRootLogin\ prohibit-password/PermitRootLogin\ yes/g' /etc/ssh/sshd_config && \ 
    sed -i 's/#Banner\ none/Banner\ \/etc\/issue.net/g' /etc/ssh/sshd_config && \
    useradd flask --home-dir /home/flask/ --shell /bin/bash && \
    chown flask:flask -R /home/flask/ && \
    echo 'flask:flask!@#' | chpasswd && \
    echo 'root:Root_flask!@#' | chpasswd

ENTRYPOINT /usr/local/start.sh 
