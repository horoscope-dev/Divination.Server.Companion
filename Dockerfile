FROM python:3.11-alpine

RUN apk add --update --no-cache --virtual .build-deps \
        build-base \
        linux-headers \
    && pip install --no-cache-dir \
        discord.py \
        aiohttp \
    && apk del --purge .build-deps

COPY entrypoint.py /entrypoint.py

LABEL org.opencontainers.image.source https://github.com/SlashNephy/Divination.Server.Companion
ENTRYPOINT ["python", "-u", "/entrypoint.py"]
