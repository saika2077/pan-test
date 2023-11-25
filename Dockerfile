FROM debian:stable-slim
WORKDIR /alist/
VOLUME /alist/data/
COPY entrypoint.sh /alist/entrypoint.sh
RUN apt-get update && apt-get install -y curl grep sed tar bash && \
    chmod 777 entrypoint.sh
EXPOSE 5244
CMD [ "bash" , "entrypoint.sh" ]
