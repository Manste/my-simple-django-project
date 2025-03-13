# Use the official Python image
FROM python:3.10-slim

# Create the app directory
RUN mkdir /app

# Set working directory
WORKDIR /app

# Set environment variables 
# Prevents Python from writing pyc files to disk
ENV PYTHONDONTWRITEBYTECODE=1
#Prevents Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED=1 

# Upgrade pip
RUN pip install --upgrade pip 

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the backend Django app code into the container
COPY . .

# Expose port 8000 for Django
EXPOSE 8000

# Set working directory to the folder where your Django app resides 
WORKDIR /app/mysite

RUN chmod +x start.sh

# Run Django development server
CMD ["./start.sh"]
