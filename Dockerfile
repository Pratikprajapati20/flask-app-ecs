#Base Image (os)

FROM python:3.9-slim

#Working Directory
WORKDIR /app

#Copy src code to container

COPY . .

#Run the build command

RUN pip install -r requirements.txt

#Expose port
EXPOSE 80

#Serve the app / run the app (Keep it running)

CMD [ "python","run.py" ]




 
