from flask import Flask, jsonify
import psycopg2
import time

app = Flask(__name__)

def get_db_connection(retries=5, delay=3):
    for i in range(retries):
        try:
            return psycopg2.connect(
                host="postgres",
                database="bank",
                user="postgres",
                password="postgres"
            )
        except psycopg2.OperationalError:
            print("Postgres not ready, retrying...")
            time.sleep(delay)
    raise Exception("Database connection failed")

@app.route("/balance")
def balance():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT balance FROM accounts WHERE id=1;")
    balance = cur.fetchone()[0]
    cur.close()
    conn.close()
    return jsonify({"balance": balance})

@app.route("/health")
def health():
    return "OK", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
