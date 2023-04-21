FROM python:3.10-alpine

WORKDIR /app

COPY requirements.txt /app/requirements.txt

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PORT=8000

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8000

CMD gunicorn --bind 0.0.0.0:$PORT oc_lettings_site.wsgi