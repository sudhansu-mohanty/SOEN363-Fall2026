import sqlite3
import re
import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_PATH = os.path.join(BASE_DIR, "assignment1.db")
QUERIES_PATH = os.path.join(BASE_DIR, "queries.sql")

def parse_queries(sql_file):
    with open(sql_file, "r") as f:
        content = f.read()

    # Split on comment lines that label queries (-- query N / -- queryN)
    blocks = re.split(r"(--\s*query\s*\d+.*)", content, flags=re.IGNORECASE)

    queries = []
    i = 1
    while i < len(blocks):
        label = blocks[i].strip()
        sql = blocks[i + 1].strip() if i + 1 < len(blocks) else ""
        if sql:
            queries.append((label, sql))
        i += 2

    return queries

def run_queries():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()

    queries = parse_queries(QUERIES_PATH)
    if not queries:
        print("No queries found in queries.sql")
        return

    for label, sql in queries:
        print(f"\n{'='*50}")
        print(f"{label}")
        print(f"{'='*50}")
        print(f"SQL: {sql}\n")
        try:
            cur.execute(sql)
            rows = cur.fetchall()
            if rows:
                cols = rows[0].keys()
                col_widths = {c: max(len(c), max(len(str(row[c])) for row in rows)) for c in cols}
                header = " | ".join(c.ljust(col_widths[c]) for c in cols)
                print(header)
                print("-" * len(header))
                for row in rows:
                    print(" | ".join(str(row[c]).ljust(col_widths[c]) for c in cols))
                print(f"\n{len(rows)} row(s) returned.")
            else:
                print("No rows returned.")
        except sqlite3.Error as e:
            print(f"Error: {e}")

    conn.close()

if __name__ == "__main__":
    run_queries()
