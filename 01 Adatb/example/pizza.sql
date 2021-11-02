CREATE TABLE `Customer` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `address` varchar(255)
);

CREATE TABLE `Ingredient` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `stock_quantity` integer unsigned
);

CREATE TABLE `Pizza` (
  `id` integer PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `Pizza_Ingredient` (
  `pizza_id` integer,
  `ingredient_id` integer,
  PRIMARY KEY (`pizza_id`, `ingredient_id`)
);

CREATE TABLE `Order` (
  `id` integer PRIMARY KEY,
  `customer_id` integer,
  `date` date,
  `order_taken_by` integer,
  `cook` integer,
  `delivery_person` integer
);

CREATE TABLE `Order_Pizza` (
  `order_id` integer,
  `pizza_id` integer,
  PRIMARY KEY (`order_id`, `pizza_id`)
);

CREATE TABLE `Employee` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `started_date` date
);

ALTER TABLE `Pizza` ADD FOREIGN KEY (`id`) REFERENCES `Pizza_Ingredient` (`pizza_id`);

ALTER TABLE `Ingredient` ADD FOREIGN KEY (`id`) REFERENCES `Pizza_Ingredient` (`ingredient_id`);

ALTER TABLE `Pizza` ADD FOREIGN KEY (`id`) REFERENCES `Order_Pizza` (`pizza_id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`id`) REFERENCES `Order_Pizza` (`order_id`);

ALTER TABLE `Employee` ADD FOREIGN KEY (`id`) REFERENCES `Order` (`delivery_person`);

ALTER TABLE `Customer` ADD FOREIGN KEY (`id`) REFERENCES `Order` (`customer_id`);

