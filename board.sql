create table tbl_board(
   idx int not null auto_increment,   -- 자동증가컬럼(1,2,3.....)
   title varchar(100) not null,
   contents varchar(4000) not null,
   writer varchar(50) not null,
   count int default 0,
   indate datetime not null default now(),
   primary key(idx)
);

select * from Member;
select * from Board;
show tables;
create table tbl_user(
	user_id varchar(30) not null,
	user_name varchar(30) not null,
	password varchar(30) not null,
	birth_date varchar(30) not null,
	address varchar(30) not null,
	primary key(user_id)
);

alter table tbl_user add  birth_date date not null;
alter table tbl_user add  address varchar(30) not null;

show tables;
select * from Book; 



select * from tbl_user1;
select * from tbl_user;
select * from tbl_board;
select * from tbl_librarian;

update tbl_user set password='admin', address='admin' where user_id='admin';

insert into tbl_user values('admin','관리자','admin', '1997-03-02', '광주광역시');
insert into tbl_user values('bitcocom','홍길동','12345', '1987-02-03','전라남도');
insert into tbl_user values('guest','사용자','12345','1922-03-03','광주광역시');
insert into tbl_user values('ldk1212','이대교','0000','1997-02-02','경기도 용인시');
insert into tbl_user values('kokoko','김남진','0000','1999-03-03','광주광역시');


DROP TABLE tbl_user

select * from Member;
create table tbl_librarian(
	user_id varchar(30) not null,
	user_name varchar(30) not null,
	password varchar(30) not null,
	birth_date date not null,
	address varchar(30) not null,
	library_name varchar(30) not null,
	primary key(user_id)
);

insert into Book values('1','123123','11','11','11','11','11');
insert into tbl_librarian values('ggg','김영주','12345', '1987-02-03','전라남도','서구도서관');
insert into tbl_librarian values('sss','주익정','12345','1922-03-03','광주광역시','광산구 도서관');


select * from Book;

insert into Book values('tht','안은식','12345', '1997-03-02', '광주광역시');

select * from Member;

select * from Member where member_id like '%a%';
show tables;



-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema koko
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema koko
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Table `koko`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `koko`.`Book` (
  `book_idx` INT NOT NULL AUTO_INCREMENT,
  `ISBN` VARCHAR(30) NOT NULL,
  `book_name` VARCHAR(50) NOT NULL,
  `book_author` VARCHAR(30) NOT NULL,
  `book_pub` VARCHAR(45) NOT NULL,
  `book_age` INT NULL,
  `book_rent` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`book_idx`))
ENGINE = InnoDB;

show tables;
-- -----------------------------------------------------
-- Table `koko`.`Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `koko`.`Member` (
  `member_id` VARCHAR(30) NOT NULL,
  `member_pw` VARCHAR(30) NOT NULL,
  `member_name` VARCHAR(20) NOT NULL,
  `member_birth` VARCHAR(20) NOT NULL,
  `member_class` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`member_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `koko`.`Library`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `koko`.`Library` (
  `library_idx` INT NOT NULL AUTO_INCREMENT,
  `library_name` VARCHAR(20) NOT NULL,
  `library_loc` VARCHAR(45) NULL,
  PRIMARY KEY (`library_idx`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `koko`.`Board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `koko`.`Board` (
  `board_idx` INT NOT NULL AUTO_INCREMENT,
  `board_title` VARCHAR(100) NOT NULL,
  `board_content` VARCHAR(4000) NOT NULL,
  `board_writer` VARCHAR(30) NOT NULL,
  `board_count` INT DEFAULT 0,
  `board_indate` DATETIME NOT NULL DEFAULT now(),
  `member_id` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`board_idx`),
  INDEX `fk_Board_Member1_idx` (`member_id` ASC),
  CONSTRAINT `fk_Board_Member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `koko`.`Member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `koko`.`Rentbook`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `koko`.`Rentbook` (
  `rent_idx` INT NOT NULL,
  `member_id` VARCHAR(30) NOT NULL,
  `book_idx` INT NOT NULL,
  PRIMARY KEY (`rent_idx`, `member_id`, `book_idx`),
  INDEX `fk_Member_has_Book_Book1_idx` (`book_idx` ASC),
  INDEX `fk_Member_has_Book_Member1_idx` (`member_id` ASC),
  CONSTRAINT `fk_Member_has_Book_Member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `koko`.`Member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Member_has_Book_Book1`
    FOREIGN KEY (`book_idx`)
    REFERENCES `koko`.`Book` (`book_idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `koko`.`Inbook`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `koko`.`Inbook` (
  `inbook_idx` INT NOT NULL,
  `Library_library_idx` INT NOT NULL,
  `Book_book_idx` INT NOT NULL,
  PRIMARY KEY (`inbook_idx`, `Library_library_idx`, `Book_book_idx`),
  INDEX `fk_Library_has_Book_Book1_idx` (`Book_book_idx` ASC),
  INDEX `fk_Library_has_Book_Library1_idx` (`Library_library_idx` ASC),
  CONSTRAINT `fk_Library_has_Book_Library1`
    FOREIGN KEY (`Library_library_idx`)
    REFERENCES `koko`.`Library` (`library_idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Library_has_Book_Book1`
    FOREIGN KEY (`Book_book_idx`)
    REFERENCES `koko`.`Book` (`book_idx`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

show databases;
show tables;

drop table Member;
drop table Rentbook;
drop table Board;
drop table Inbook;
drop table Library;
drop table Book;


select * from Member;
select * from Rentbook;
select * from Board;
select * from Inbook;
select * from Library;
