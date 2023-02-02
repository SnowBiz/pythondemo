from flask import Flask
import os

application = Flask(__name__)

@application.route("/")
def hello():
    return "Hello World!"

@application.route("/health")
def health():
    return "Super Healthy"

@application.route("/router")
def router():
    return print(os.environ['ROUTER'])

if __name__ == "__main__":
    application.run(debug=True, host='0.0.0.0', port=8080)
