FROM python:3.9

ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# add and run as non-root user
RUN useradd -m sergio
USER sergio

WORKDIR /app

# Adding the scrip virtualenv directory to PATH
ENV PATH="/home/sergio/.local/bin:${PATH}"

COPY . /app

RUN pip install -r requirements.txt

# Copy project
COPY . .

#RUN python manage.py collectstatic --noinput
#CMD uwsgi --http=0.0.0.0:80 --module=backend.wsgi
