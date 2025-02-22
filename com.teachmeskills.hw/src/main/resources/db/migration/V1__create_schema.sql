CREATE TABLE books
(
    id           SERIAL PRIMARY KEY,
    title        VARCHAR(255) NOT NULL,
    author       VARCHAR(255) NOT NULL,
    publish_year INT          NOT NULL
);

CREATE TABLE readers
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(255)        NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE reservations
(
    id               SERIAL PRIMARY KEY,
    book_id          INT  NOT NULL,
    reader_id        INT  NOT NULL,
    reservation_date DATE NOT NULL DEFAULT CURRENT_DATE,
    return_date      DATE,
    FOREIGN KEY (book_id) REFERENCES books (id),
    FOREIGN KEY (reader_id) REFERENCES readers (id)
);
