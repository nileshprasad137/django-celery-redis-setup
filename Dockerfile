# Use Python 3.11 Alpine image
FROM python:3.11-alpine

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# Set work directory
WORKDIR /app

# Install system dependencies required for Poetry
# This might include build dependencies for packages that have C extensions
RUN apk add --no-cache curl build-base libffi-dev

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
ENV PATH="${PATH}:/root/.local/bin"

# Copy the project files into the working directory
COPY . /app

# Disable virtualenv creation by Poetry
# and install the dependencies in the system
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi


# Set work directory to django_celery_redis directory which contains manage.py file.
WORKDIR /app/django_celery_redis

# Command to run on container start
CMD ["python", "manage.py", "runserver", "0.0.0.0:8002"]
