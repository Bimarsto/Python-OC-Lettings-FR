FROM python:3.10-alpine

WORKDIR /oc_lettings

COPY requirements.txt /oc_lettings/requirements.txt

RUN pip install -r requirements.txt

COPY . /oc_lettings

EXPOSE 8000

CMD ["python", "manage.py"]
