# app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Learning Hub is currently offline as this semester’s course has ended. See you in the next class—happy learning! 🎓✨"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5555)