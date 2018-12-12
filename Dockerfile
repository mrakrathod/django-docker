FROM python:2.7-alpine

WORKDIR app

COPY requirements.txt /app

RUN apk update && pip install -r requirements.txt --no-cache-dir

COPY . .


#CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]

FROM nginx
EXPOSE 80

COPY --from=django_docker /app /usr/share/nginx/html