from flask import Flask
from flask.helpers import url_for

app = Flask(__name__)

# 直接访问localhost:5000/static/style.css可以直接访问文件

with app.test_request_context():
    # 这里会直接打印出css的路径
    print(url_for('static', filename='style.css'))