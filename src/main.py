from flask import Flask, jsonify
import os
app = Flask(__name__)

@app.route('/')
def main():
       jsonOutput = {
          "hello": "world",
          "built_at": os.environ['BUILD_AT'],
          "deployed_at": os.environ['DEPLOY_AT']
         }
       return jsonify(jsonOutput)


if __name__ == '__main__':
   app.run(host="0.0.0.0", port=8080)
