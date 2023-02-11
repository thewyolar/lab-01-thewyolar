--CREATE DATABASE "product_shop";

--Роли--
CREATE TABLE IF NOT EXISTS "Roles" (
    "role_id" serial PRIMARY KEY,
    "role" varchar(50) UNIQUE NOT NULL
);

INSERT INTO "Roles" (role_id, role) VALUES (DEFAULT, 'admin'), (DEFAULT, 'user');


--Пользователи--
CREATE TABLE IF NOT EXISTS "Users" (
    "user_id" serial PRIMARY KEY,
    "username" varchar(100) UNIQUE NOT NULL,
    "password" varchar(100) UNIQUE NOT NULL,
    "role_id" INTEGER NOT NULL,
    FOREIGN KEY (role_id) REFERENCES "Roles" (role_id)
);

INSERT INTO "Users" (user_id, username, password, role_id) VALUES (DEFAULT, 'user1', '123', 1), (DEFAULT, 'user2', '124', 2);


--Продукты--
CREATE TABLE IF NOT EXISTS "Products" (
    "product_id" SERIAL PRIMARY KEY,
    "name" varchar(100) UNIQUE NOT NULL,
    "price" DECIMAL NOT NULL
);

INSERT INTO "Products" (product_id, name, price) VALUES (DEFAULT, 'chocolate', 59.9), (DEFAULT, 'juice', 149.9);


--Заказы--
CREATE TABLE IF NOT EXISTS "Orders" (
    "order_id" SERIAL PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "count" INTEGER NOT NULL,
    "date" date NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "Users" (user_id),
    FOREIGN KEY (product_id) REFERENCES "Products" (product_id)
);

INSERT INTO "Orders" (order_id, user_id, product_id, count, date) VALUES (DEFAULT, 1, 1, 2, '2022-02-12'), (DEFAULT, 2, 2, 3, '2022-09-22');


--DROP DATABASE "product_shop";