# Flask
Test environment for applications that use the flask framework.
In this image is installed:

- [Python 3.7.3](https://docs.python.org/3.7/tutorial/index.html)
- [Flask 1.1.2](https://flask.palletsprojects.com/en/1.1.x/)
- [Gunicorn 20.0.4](https://docs.gunicorn.org/en/stable/run.html)
- SSH

By default, the image is configured with an example project running on port 80. The project is located in the /home/flask/app.

For your project to be executed by default by the container, just place the contents of your project inside /home/flask/app.

### Users
By default the image has two users:
- root: Root_flask!@#
- flask: flask!@#

### Variables
- PASS_ROOT: change the password for the root user
- PASS_USER: change the password for the flask user
- PORT: change the web server port
- NUM_PROCESS: defines the number of web server processes

### Command example  
```sh
$ docker run -tid -e PASS_ROOT="Pass1209" -p 2222:22 -p 80:80 hernanesalmeida/flask:1.0
```
