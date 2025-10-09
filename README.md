#docker-python-app

https://hub.docker.com/r/justudin/my-python-app


###🧩 Step 1: Create a simple Python app



1. Create a new folder, e.g. `docker-python-app`

2. Inside it, create a file named **`app.py`** with this code:



```python

#app.py

from flask import Flask



app = Flask(__name__)



@app.route('/')

def hello():

&nbsp;   return "Hello from Dockerized Python App!"



if __name__ == '__main__':

&nbsp;   app.run(host='0.0.0.0', port=5000)

```



This uses **Flask**, a lightweight Python web framework.



---



###⚙️ Step 2: Create a `requirements.txt` file



In the same folder, create a file called **`requirements.txt`**:



```

flask

```



---



###🐳 Step 3: Create a Dockerfile



Create a file named **`Dockerfile`** (no extension) in the same folder:



```dockerfile

#Use official Python image

FROM python:3.10-slim



#Set working directory

WORKDIR /app



#Copy files into the container

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt



COPY . .



#Expose port 5000

EXPOSE 5000



#Run the app

CMD ["python", "app.py"]

```



---



###🏗️ Step 4: Build the Docker image



Open a terminal in your project folder and run:



```bash

docker build -t my-python-app .

```



This tells Docker to build an image named `my-python-app` using the `Dockerfile`.



---



###▶️ Step 5: Run the container



Now run your app in a container:



```bash

docker run -d -p 5000:5000 my-python-app

```



This maps **port 5000** on your computer to **port 5000** inside the container.



---



###🌐 Step 6: Test your app



Open your browser and visit:

👉 http://localhost:5000



You should see:

**“Hello from Dockerized Python App!”**



---



###🧹 Step 7: Stop and clean up (optional)



To stop the container:



```bash

docker ps        #find your container ID

docker stop <container_id>

```



To remove it:



```bash

docker rm <container_id>

```



##🐋 Step-by-step: Push Docker Image to Docker Hub



###**Step 1: Create a Docker Hub account**



If you don’t have one yet, go to 👉 https://hub.docker.com

Create an account and note your **username**.



---



###**Step 2: Log in from your terminal**



Run:



```bash

docker login

```



Then enter your Docker Hub **username** and **password** (or access token).



You should see:



```

Login Succeeded

```



---



###**Step 3: Tag your image**



You need to tag your local image so it matches your Docker Hub repo name.



Format:



```

docker tag local-image-name username/repository-name:tag

```



Example:



```bash

docker tag my-python-app johndoe/my-python-app:latest

```



---



###**Step 4: Push your image**



Now push it to Docker Hub:



```bash

docker push johndoe/my-python-app:latest

```



Docker will upload the layers, and once complete, you can see it at:

👉 `https://hub.docker.com/r/johndoe/my-python-app`



---



###**Step 5: Pull and run it anywhere**



Now, on *any* machine with Docker, you can run:



```bash

docker pull johndoe/my-python-app:latest

docker run -d -p 5000:5000 johndoe/my-python-app

```



Then visit:

http://localhost:5000

🎉 Your app will run exactly as before — no setup required.





