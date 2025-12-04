import os
import sqlite3
from flask import Flask, render_template, request

app = Flask(__name__)
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_PATH = os.path.join(BASE_DIR, "bookstore.db")

def get_db_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn


def get_categories():
    conn = get_db_connection()
    categories = conn.execute("SELECT * FROM categories").fetchall()
    conn.close()
    return categories

@app.route("/")
def home():
    return render_template("index.html", categories=get_categories())

@app.route("/category")
def category():
    category_id = request.args.get("categoryId", type=int)

    if category_id is None:
        return render_template("error.html", error="No categoryId was provided.")

    conn = get_db_connection()
    books = conn.execute(
        "SELECT * FROM books WHERE categoryId = ?",
        (category_id,),
    ).fetchall()
    conn.close()

    return render_template(
        "category.html",
        selectedCategory=category_id,   
        categories=get_categories(),   
        books=books,                  
    )


@app.route("/search", methods=["POST"])
def search():
    term = request.form.get("search", "").strip()

    books = []
    if term:
        conn = get_db_connection()
        books = conn.execute(
            "SELECT * FROM books WHERE lower(title) LIKE lower(?)",
            (f"%{term.lower()}%",),
        ).fetchall()
        conn.close()

    return render_template(
        "index.html",
        categories=get_categories(),
        books=books,
        term=term,
    )
@app.route("/book/<int:book_id>")
def book_detail(book_id):
    conn = get_db_connection()
    book = conn.execute(
        """
        SELECT books.*, categories.name AS categoryName
        FROM books
        JOIN categories ON categories.id = books.categoryId
        WHERE books.id = ?
        """,
        (book_id,),
    ).fetchone()
    conn.close()

    if book is None:
        return render_template("error.html", error=f"No book found with id {book_id}.")

    return render_template(
        "book_detail.html",
        book=book,
        categories=get_categories(), 
    )

@app.errorhandler(Exception)
def handle_error(e):
    return render_template("error.html", error=e)

if __name__ == "__main__":
    app.run(debug=True)
