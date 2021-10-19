CREATE TABLE users (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(70) NOT NULL,
    last_name VARCHAR(70),
    date_of_birth DATE
);

CREATE TABLE groups (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    group_name VARCHAR(70) NOT NULL,
    primary_user_id INT REFERENCES users(id)	  
);

CREATE TABLE categories (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(70) NOT NULL,
    description VARCHAR(250)
);

CREATE TABLE users_in_groups (
    group_id INT NOT NULL REFERENCES groups(id),
    user_id INT NOT NULL REFERENCES users(id)	  
);


CREATE TABLE bills (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    bill_name VARCHAR(70) NOT NULL,
    bill_description VARCHAR(250),
    amount money NOT NULL,
    category_id INT REFERENCES categories(id),
    group_id INT REFERENCES groups(id),
    created_by_user INT REFERENCES users(id),
    creation_date DATE NOT NULL,
    paid_by_date DATE,
    pay_user_id INT REFERENCES users(id),
    paid_date DATE,
    paid_status BOOLEAN,
    confirmed_status BOOLEAN 
);


-- Users test list:
insert into users (first_name, last_name, date_of_birth) values ('Felipe', 'Riteley', null);
insert into users (first_name, last_name, date_of_birth) values ('Willy', 'Pina', null);
insert into users (first_name, last_name, date_of_birth) values ('Allan', 'Ference', null);
insert into users (first_name, last_name, date_of_birth) values ('Anna', null, null);
insert into users (first_name, last_name, date_of_birth) values ('Alfons', 'Lanceter', null);
insert into users (first_name, last_name, date_of_birth) values ('Natty', 'Tillman', null);
insert into users (first_name, last_name, date_of_birth) values ('Melodee', 'Glover', null);
insert into users (first_name, last_name, date_of_birth) values ('Elisha', null, null);
insert into users (first_name, last_name, date_of_birth) values ('Fawne', null, '12/5/2004');
insert into users (first_name, last_name, date_of_birth) values ( 'Tedie', 'Gulleford', '11/6/2006');

-- Groups test list
insert into groups (group_name, primary_user_id) values ('Alconauts', 1);
insert into groups (group_name, primary_user_id) values ('Velma', 1);
insert into groups (group_name, primary_user_id) values ('Random', 3);
insert into groups (group_name, primary_user_id) values ('Nastolki', 5);

-- Categories test list
insert into categories (name, description) values ('Food', 'Everything you can eat');
insert into categories (name) values ('Alcohol');
insert into categories (name, description) values ('Travel', null);
insert into categories (name, description) values ('Bills', 'Power Water and Internet');
insert into categories (name) values ('Subscriptions');
insert into categories (name) values ('Renovation');
insert into categories (name, description) values ('Other', 'Random stuff');
insert into categories (name, description) values ('Clothes', 'Slippers and Pyjamas');
insert into categories (name) values ('Gaming');

-- allocating users test
insert into users_in_groups (group_id, user_id) values (1, 1);
insert into users_in_groups (group_id, user_id) values (1, 5);
insert into users_in_groups (group_id, user_id) values (1, 7);
insert into users_in_groups (group_id, user_id) values (2, 1);
insert into users_in_groups (group_id, user_id) values (2, 2);
insert into users_in_groups (group_id, user_id) values (2, 3);
insert into users_in_groups (group_id, user_id) values (3, 7);
insert into users_in_groups (group_id, user_id) values (3, 6);
insert into users_in_groups (group_id, user_id) values (4, 4);
insert into users_in_groups (group_id, user_id) values (4, 5);
insert into users_in_groups (group_id, user_id) values (4, 6);
insert into users_in_groups (group_id, user_id) values (4, 9);
insert into users_in_groups (group_id, user_id) values (4, 10);


-- creating bills test list
-- 1
insert into bills (bill_name, bill_description, amount, category_id, group_id, created_by_user, creation_date, paid_by_date, pay_user_id, paid_date, paid_status, confirmed_status)
values ('grocery', 'Milk and Eggs', '$4.36', 1, 2, 1, '05/10/2021', '12/10/2021', 3, '07/10/2021', true, true);
-- 2
insert into bills (bill_name, bill_description, amount, category_id, group_id, created_by_user, creation_date, pay_user_id, paid_status, confirmed_status)
values ('Beer', 'BBQ on Sat', '$15.10', 2, 1, 1, '02/10/2021', 5, false, false);
-- 3
insert into bills (bill_name, bill_description, amount, category_id, group_id, created_by_user, creation_date, pay_user_id, paid_status, confirmed_status)
values ('Beer', 'BBQ on Sat', '$15.10', 2, 1, 1, '02/10/2021', 7, false, false);
-- 4
insert into bills (bill_name,       bill_description,    amount,    category_id,    group_id, created_by_user, creation_date, paid_by_date, pay_user_id,  paid_date,   paid_status,   confirmed_status)
values            ('AirBnB stay', 'Trip to Wellington', '$56.00',       3,             2,         2,            '05/10/2021', '30/10/2021',      1,       '07/10/2021', true,             false);
-- 5
insert into bills (bill_name,       bill_description,    amount,    category_id,    group_id, created_by_user, creation_date, paid_by_date, pay_user_id,   paid_status,   confirmed_status)
values            ('AirBnB stay', 'Trip to Wellington', '$56.00',        3,          2,             2,           '05/10/2021', '30/10/2021',         3,     false,          false);
-- 6
insert into bills (bill_name, amount, category_id, group_id, created_by_user, creation_date, pay_user_id, paid_status, confirmed_status) 
values ('food', '$12.82', 1, 2, 1, '05/10/2021', 2, false, false);
-- 7
insert into bills (bill_name, amount, group_id, created_by_user, creation_date, pay_user_id, paid_status, confirmed_status)
values ('food', '$12.82', 2, 1, '05/10/2021',  3, false, false);
-- 8
insert into bills (bill_name, bill_description, amount, group_id, created_by_user, creation_date, paid_by_date, pay_user_id, paid_date, paid_status, confirmed_status)
values ('Power', 'STOP using the heater!', '$560.50', 3, 7,'01/10/2021', '10/10/2021', 6, '07/10/2021', true, false);
-- 9
insert into bills (bill_name, bill_description, amount, group_id, created_by_user, creation_date, pay_user_id, paid_status, confirmed_status)
values ('I bought us some junk food', 'noodles and mayo', '$4.36', 3, 7,  '05/10/2021', 6, false, false);
-- 10
insert into bills (bill_name, amount, group_id, created_by_user, creation_date, pay_user_id, paid_date, paid_status, confirmed_status)
values ('Party time - booze and chips', '$34.11', 3, 7, '15/10/2021', 6, '15/10/2021', true, true);

