FROM python:3.6
WORKDIR /LoginProject
COPY . .
RUN "pip install virtualenv"
RUN "python3 -m venv venv"
RUN "source venv/bin/activate"
RUN "pip install -r requirements.txt"
# RUN "python3 manage.py makemigrations"
RUN "python3 manage.py migrate"
CMD ["python3","manage.py runserver"]