FROM python:3.8-alpine

RUN apk update \
 && apk add python-dev build-base libffi-dev curl \
 && pip install pypiserver

RUN addgroup -S -g 9898 pypiserver \
    && adduser -S -u 9898 -G pypiserver pypiserver \
    && mkdir -p /data/packages \
    && chown -R pypiserver:pypiserver /data/packages \
    # Set the setgid bit so anything added here gets associated with the pypiserver group
    && chmod g+s /data/packages

USER pypiserver

WORKDIR /data

EXPOSE 8080

# Start pypi-server on port 8080, without any authentication since it's only used locally
ENTRYPOINT ["pypi-server", "-p", "8080", "-P", ".", "-a", "."]

CMD ["packages"]