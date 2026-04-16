FROM python:3.9-slim

RUN useradd -m secureuser

WORKDIR /app

COPY requirement.txt .
RUN pip install --no-cache-dir -r requirement.txt

COPY . .

RUN chown -R secureuser:secureuser /app

USER secureuser

EXPOSE 8080

CMD ["python", "app.py"]