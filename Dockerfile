FROM python:3.8
ENV PYTHONUNBUFFERED=1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt

ENV DEBUG 0
ENV ALLOWED_HOSTS localhost

ADD ./check-postgres.py /tmp/check-postgres.py
RUN chmod a+x /tmp/check-postgres.py

COPY ./app-data /code/

EXPOSE 8000

RUN python manage.py collectstatic --no-input --clear

CMD bash -c "python /tmp/check-postgres.py && gunicorn --worker-class=eventlet --forwarded-allow-ips='*' --workers=5 -b 0.0.0.0:8000 project.wsgi:application"

