from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "ScaleOps Platform is Running by AKSHAY"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
