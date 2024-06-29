FROM aeris1one/light-baseimage:v1.3.4

# add non-free repository to /etc/apt/sources.list.d/non-free.list
RUN echo "deb http://deb.debian.org/debian buster non-free" > /etc/apt/sources.list.d/non-free.list \
    && curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
    http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list \
    && apt-get update && \
    echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
    | sudo tee /etc/apt/preferences.d/99nginx

ADD service-available /container/service-available
