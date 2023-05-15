# Use the official Python image as the base image
FROM python:3.9-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Copy the requirements file into the container and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Mount the local directory as a volume in the container
VOLUME [ "/app" ]

# Expose port 8000 for the FastAPI application
EXPOSE 8000

# Start the FastAPI application using uvicorn with hot-reloading
CMD ["uvicorn", "main:api", "--host", "0.0.0.0", "--port", "8000", "--reload"]