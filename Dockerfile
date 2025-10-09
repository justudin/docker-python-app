# Use official Python image
FROM python:3

# Set working directory
WORKDIR /app

# Copy files into the container
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose port 5000
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]