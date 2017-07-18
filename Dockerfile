# the base image
FROM python:2.7-slim

# set the working directory to /app
WORKDIR /app

# copy the current directory into the container at /app
ADD . /app

# Install any packages needed
RUN pip install -r requirements.txt

# make port 80 avail. to the world outside the container
EXPOSE 80

# define an environment variable
ENV NAME World

# run app.py on container launch
CMD ["python", "app.py"]

