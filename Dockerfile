FROM python:3.10-alpine

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8000

#CMD ["gunicorn", "--bind", ":8000", "core.wsgi:application"]
ENTRYPOINT ["python", "manage.py"]

#CMD gunicorn --bind 0.0.0.0:$PORT oc_lettings_site.wsgi