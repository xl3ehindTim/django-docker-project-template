# django-docker-template

Standard django docker-compose setup.

First clone the project:
```commandline
git clone https://github.com/xl3ehindTim/django-docker-template.git
```

Then change the database and web variables in the docker-compose.yml file
```
db:
    # ...
    environment:
      - POSTGRES_DB=database < Change to your database name
      - POSTGRES_USER=username < Change to your username
      - POSTGRES_PASSWORD=password < Change to your password

```
```
web:
    # ...
    environment:
        POSTGRES_DB: database < Change to your database name
        POSTGRES_USER: username < Change to your username
        POSTGRES_PASSWORD: password < Change to your password
```

At last, you can start by running: 
```commandline
docker-compose up
```

## Important note
For use in production you should change the **secret_key** variable in app-data/project/settings.py
```python
SECRET_KEY = 'sample_key'
```