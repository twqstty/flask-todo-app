FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/
RUN pip install --no-cache-dir -e . || true

EXPOSE 7345

CMD ["python", "manage.py", "runserver", "-h", "0.0.0.0", "-p", "7345"]
