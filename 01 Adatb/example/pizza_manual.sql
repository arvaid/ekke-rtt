create table pizza (
    id integer primary key,
    name varchar2(30) not null,
    size integer not null
);

create table topping (
    id integer primary key,
    name varchar2(30) not null,
);

create table pizza_topping (
    pizza_id integer,
    topping_id integer,
    primary key(pizza_id, topping_id),
    foreign key (pizza_id) references pizza(id),
    foreign key (topping_id) references topping(id)
);

create table customer (
    id integer primary key,
    name varchar2(255) not null,
    phone_number varchar2(255),
    email varchar2(255),
    register_date date not null
)

create table employee (
    id integer primary key,
    name varchar2(255) not null
    date datetime not null
    e_type integer not null

    foreign key (e_type) references employee_type.id
);

create tablee employee_type (
    id integer primary key,
    name varchar2(255) not null
);

create table order (
    id integer primary key,
    pizza_id integer not null,
    customer_id integer not null,
    delivery_id integer not null
    date date not null,

    foreign key (pizza_id) references pizza(id)
    foreign key (customer_id) references customer(id)
    foreign key (delivery_id) references employee(id)
)

insert into pizza values(1, 'margherita', 32);
insert into pizza values(2, 'songoku', 32);
insert into pizza values(3, 'magyaros', 32);
insert into pizza values(4, 'hawaii', 32);
insert into pizza values(5, 'mini margherita', 28);

insert into topping values(1, 'paradicsom');
insert into topping values(2, 'sajt');
insert into topping values(3, 'sonka');
insert into topping values(4, 'gomba');
insert into topping values(5, 'kukorica');
insert into topping values(6, 'ananász');
insert into topping values(7, 'kolbász');
insert into topping values(8, 'bacon');
insert into topping values(9, 'hagyma');
insert into topping values(10, 'paprika');

insert into pizza_topping(1, 1);
insert into pizza_topping(1, 2);
insert into pizza_topping(2, 2);
insert into pizza_topping(2, 3);
insert into pizza_topping(2, 4);
insert into pizza_topping(2, 5);
insert into pizza_topping(3, 1);
insert into pizza_topping(3, 2);
insert into pizza_topping(3, 7);
insert into pizza_topping(3, 8);
insert into pizza_topping(3, 9);
insert into pizza_topping(3, 10);
insert into pizza_topping(4, 2);
insert into pizza_topping(4, 3);
insert into pizza_topping(4, 6);
insert into pizza_topping(5, 1);
insert into pizza_topping(5, 2);

insert into customer values(1, "Teszt Elek", "06301234567", "teszt@teszt.hu", "2021-09-29");
insert into customer values(2, "Gipsz Jakab", "06309876542", "gipsz@gipsz.hu", "2021-09-29");
insert into customer values(3, "Jó Áron", "06309876543", "aron.j@jmail.com", "2021-09-29");

insert into employee values(1, "Dolgozó 1", "06201234567", "dolg1@pizza.asd", "2020-05-22", 1);
insert into employee values(2, "Dolgozó 2", "06201234567", "dolg2@pizza.asd", "2020-05-23", 2);
insert into employee values(3, "Dolgozó 3", "06201234567", "dolg3@pizza.asd", "2020-05-23", 2);
insert into employee values(4, "Dolgozó 4", "06201234567", "dolg4@pizza.asd", "2020-05-23", 3);

insert into employee_type values(1, "cook");
insert into employee_type values(2, "delivery person");
insert into employee_type values(3, "dispatcher");

insert into order values(1, 1, 1, 4, "2021-10-03 16:23");
insert into order values(2, 1, 3, 3, "2021-10-03 17:06");
