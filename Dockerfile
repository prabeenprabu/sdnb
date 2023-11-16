ARG PORT=443
# FROM cypress/brower:latest
FROM selenium/standalone-chrome:latest
RUN apt-get install -y python3
RUN echo $(python3 -m site --user-base)
COPY requirements.txt .
ENV PATH /home/root/.local/bin:${PATH}
RUN apt-get update && apt-get install -y
COPY . .
CMD uvicorn main:app --host 0.0.0.0 --port $PORT