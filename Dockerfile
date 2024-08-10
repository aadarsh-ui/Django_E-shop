# STAGE 1: Build the application
FROM python:3.10-slim

# Install build dependencies for psycopg2
RUN apt-get update && \
    apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /django-app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

# Start Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
