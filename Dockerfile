# Use official Python image
FROM python:3.11-slim

# set workdir
WORKDIR /app

# copy only requirements first (leverages build cache)
COPY requirements.txt .

# install dependencies
RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# copy rest of the app
COPY . .

# expose and run (adjust as per your app entry)
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
