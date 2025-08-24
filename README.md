
# Flask App with Docker

This repository contains a simple **Flask web application** that can be containerized using **Docker**.  
The project also demonstrates the use of a **multi-stage Docker build** for creating efficient, production-ready images.

---

## 🚀 Clone the repository
```bash
git clone https://github.com/Pratikprajapati20/flask-app-ecs.git
cd flask-app-ecs

```

## 🚀 Run Locally with Python

```bash
# Install dependencies
pip install -r requirements.txt

# Run the app
python app.py
Access at 👉 http://localhost:80

```

## 🐳 Run with Docker (Single Stage)
```bash
#Base image (OS)
FROM python:3.9-slim

#Working Directory
WORKDIR /app

#Copy src code to container
COPY . .

#Run the build commands
RUN pip install -r requirements.txt

#Exposer port
EXPOSE 80

#Serve the app / Run the app (Keep it running)
CMD ["python","run.py"]	

App will be available at 👉 http://localhost:80

```

## 🐳 Run with Docker (Multi-Stage Build)
```bash
A multi-stage Dockerfile helps reduce image size by separating build and runtime environments.

#Stage : 1

#Base image (OS)

From python:3.9-slim AS  builder

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt --target=/app/deps

#Stage : 2

FROM gcr.io/distroless/python3-debian12

WORKDIR /app

COPY --from=builder /app/deps /app/deps
COPY --from=builder /app .

ENV PYTHONPATH="/app/deps"


EXPOSE 80

CMD ["run.py"]

App will be available at 👉 http://localhost:80

```

## ✅ Summary
docker build -t flask-app . → Single-stage build (With linux distribution)

docker build -t flask-app-multi -f Dockerfile.multi . → Multi-stage lightweight build (Without linux distribution)

Run locally → docker run -p 80:80 flask-app-multi

Happy Learning! 🚀
