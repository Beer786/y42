FROM python:3.8-alpine
ARG BUILD_AT
EXPOSE 80
COPY ./src/ ./
COPY ./requirement.txt ./
ENV BUILD_AT=$BUILD_AT
RUN pip3 install --no-cache-dir -r requirement.txt
ENTRYPOINT [ "python3", "main.py" ]