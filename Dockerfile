# FROM python:3.6
# WORKDIR /LoginProject
# COPY . .
# RUN "pip install virtualenv"
# RUN "python3 -m venv venv"
# RUN "source venv/bin/activate"
# RUN "pip install -r requirements.txt"
# # RUN "python3 manage.py makemigrations"
# RUN "python3 manage.py migrate"
# CMD ["python3","manage.py runserver"]

# Use an official Python runtime as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the project code into the container
COPY . .

RUN apt-get update -y && apt-get install -y build-essential

# Install dependencies
RUN pip install -r requirements.txt


# Run the Django development server
CMD python manage.py runserver 0.0.0.0:8000
