
CREATE TABLE tbl_user(
id varchar(200) primary key,
usernm varchar(200),
gender varchar(10),
birthday varchar(200),
loginconf  varchar(20) 
);

create table tbl_maininfo(
mno int NOT NULL AUTO_INCREMENT,
title varchar(100) not null,
content varchar(1000) not null,
address varchar(80) not null,
xPoint float not null,
yPoint float not null,
imgPath varchar(200) not null,
imgname varchar(200) not null,
id varchar(300) not null,
regdate date,
updatedate date ,
hideCheck int,
PRIMARY KEY (mno)
);