from flask import Flask, jsonify
import mysql.connector

app = Flask(__name__)

# MySQL configurations
mysql_config = {
    'host': 'localhost',
    'user': 'admin',
    'password': 'password',
    'database': 'IPL'
}

@app.route('/')
def index():
    try:
        # Connect to the MySQL database
        conn = mysql.connector.connect(**mysql_config)
        cursor = conn.cursor(dictionary=True)

        # Example query
        print("Connected")
        cursor.execute("SELECT * FROM Players")
        results = cursor.fetchall   ()
        print(results)

        # Close the cursor and connection
        cursor.close()
        conn.close()

        return jsonify(results)
    except mysql.connector.Error as err:
        return f"Error: {err}"

if __name__ == '__main__':
    app.run(debug=True)

