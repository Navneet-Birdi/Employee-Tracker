DROP DATABASE IF EXISTS `employee_cms_demo` ;


CREATE SCHEMA `employee_cms_demo` ;


use `employee_cms_demo` ;

CREATE TABLE `departments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));



CREATE TABLE `roles` (
  `id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `salary` DECIMAL NOT NULL,
  `department_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`));



ALTER TABLE `roles` 
ADD INDEX `fk_roles_1_idx` (`department_id` ASC) VISIBLE;
;
ALTER TABLE `employee_cms_demo`.`roles` 
ADD CONSTRAINT `fk_roles_1`
  FOREIGN KEY (`department_id`)
  REFERENCES `employee_cms_demo`.`departments` (`id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;


CREATE TABLE `employee_cms_demo`.`employees` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  `manager_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`));



