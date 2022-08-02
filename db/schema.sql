DROP DATABASE IF EXISTS `employee_demo` ;


CREATE SCHEMA `employee_demo` ;

use `employee_demo` ;

CREATE TABLE `department` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `role` (
  `id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `salary` DECIMAL NOT NULL,
  `department_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`));


  ALTER TABLE `role` 
ADD INDEX `fk_role_1_idx` (`department_id` ASC) VISIBLE;
;
ALTER TABLE `role` 
ADD CONSTRAINT `fk_role_1`
  FOREIGN KEY (`department_id`)
  REFERENCES `department` (`id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;


CREATE TABLE `employee` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  `manager_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`));



ALTER TABLE `employee` 
ADD INDEX `fk_employee_1_idx` (`role_id` ASC) VISIBLE,
ADD INDEX `fk_employee_2_idx` (`manager_id` ASC) VISIBLE;
;
ALTER TABLE `employee` 
ADD CONSTRAINT `fk_employee_1`
  FOREIGN KEY (`role_id`)
  REFERENCES `role` (`id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_employee_2`
  FOREIGN KEY (`manager_id`)
  REFERENCES `employee` (`id`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION;
