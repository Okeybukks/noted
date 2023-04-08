FROM python:3.10

WORKDIR /noted

COPY . .

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1 

RUN pip install -r requirements/production.txt \
    && apt-get update \
    && apt-get -y install wkhtmltopdf \
    && apt-get -y autoclean

EXPOSE 8000

WORKDIR /noted/noted

RUN python3 manage.py makemigrations --settings=core.settings.production

RUN python3 manage.py collectstatic --noinput --settings=core.settings.production

# Set the entry point command for gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "core.wsgi"]


