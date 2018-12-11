FROM python:2.7-alpine

WORKDIR app

COPY requirements.txt /app

RUN apk update && pip install -r requirements.txt --no-cache-dir

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
