FROM alpine:edge
COPY entrypoint.sh /entrypoint.sh
RUN apk --no-cache add curl grep sed tar
EXPOSE 5244
CMD [ "/entrypoint.sh" ]
