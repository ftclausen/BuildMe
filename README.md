# What is this?

This is a demo project to evaluate how Docker builds go with ZScaler enabled. This Dockerfile does common operations
typically done by services building an image e.g. fetch OS level packages, fetch app dependencies (Java in this case but
could be Node, Python, etc.). This "app" is just a very over-engineered way to print the time every 10 seconds :D

# How to build

This is built like a typical Docker image. The main purpose of this repo is to test this on macOS with Docker for Mac.
Once that is installed you can build this as follows:

```
docker build -t buildme:latest .
```

Then it can be run as follows:

```
docker run -it buildme:latest
```

At which point it'll start printing the time in UTC:

```
$ docker run -it buildme:latest
Time now (ctrl+c to quit): 09:50:20.083733
Time now (ctrl+c to quit): 09:50:30.065162
```
