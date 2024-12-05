create table account(
d_id varchar2(20 char) primary key,
d_pw varchar2(30 char) not null,
d_name varchar2(20 char) not null,
d_nickname varchar2(20 char) not null,

d_addr varchar2(200 char) not null
);

select * from account;

insert into account values ('admin', 'admin', 'admin', 'admin', 'admin');


