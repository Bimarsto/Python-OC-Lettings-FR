FROM python:3.10-alpine

WORKDIR /app

COPY requirements.txt /app/requirements.txt

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PORT=8000
ENV ALLOWED_HOSTS=127.0.0.1,[::1],0.0.0.0,.herokuapp.com
ENV SECRET_KEY='fp$9^593hsriajg$_%=5trot9g!1qa@ew(o-1#@=&4%=hp46(s'
ENV SENTRY_DSN='https://4e55b1907f2748a48e32f3cb8d924370@o4504798040621056.ingest.sentry.io/4504950299230208'

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8000

CMD gunicorn --bind 0.0.0.0:$PORT oc_lettings_site.wsgi