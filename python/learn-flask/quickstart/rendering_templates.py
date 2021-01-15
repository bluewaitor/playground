from flask import Flask
from flask.globals import request
from flask.templating import render_template

app = Flask(__name__)

@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name)

with app.test_request_context('/hello', method='POST'):
    print(request.path == '/hello')
    print(request.method == 'POST')