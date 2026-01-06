from flask import Flask, jsonify, request
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

@app.route("/transfer", methods=["POST"])
def transfer():
    data = request.json
    amount = data.get("amount", 0)

    conn = get_db_connection()
    cur = conn.cursor()

    cur.execute(
        "UPDATE accounts SET balance = balance - %s WHERE id=1;",
        (amount,)
    )
    cur.execute(
        "INSERT INTO transactions (from_account, to_account, amount) VALUES (1, 2, %s);",
        (amount,)
    )

    conn.commit()
    cur.close()
    conn.close()

    return jsonify({"status": "transfer successful"})

@app.route("/health")
def health():
    return "OK", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5002)
