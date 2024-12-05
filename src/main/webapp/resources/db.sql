/*
3월 7일_ 서병관
1) dm_name, dm_photo not null 삭제
2) dm_email, dm_isAdmin 추가 
*/

create table danim_member(
dm_id varchar2(10 char) primary key,
dm_pw varchar2(300 char) not null,
dm_nickname varchar2(20 char) not null,
dm_email varchar2(300 char) not null,
dm_addr varchar2(20 char),
dm_photo varchar2(40 char),
dm_isAdmin varchar2(2 char)
);

/*0322 서병관
 * 관리자 권한 부여하는 기능 넣으실 분들은
 * 아래행 insert 하시고 로그인 하시면 됩니다.
 * id: dm_admin
 * pw: 1234
 * jsp에서는 보안 측면에서 hidden 해도 취약하다고 판단해 삭제합니다.
 * 
 * */
insert into danim_member values ('dm_admin', 'ecd102bd4d2c50cb22cdae4ed7c7a395a22f0dd5b448db3b36224bbcd61a8320', '어드민', 'abc@abc.abc', '서울', 'dog4.jpg', 'Y');
insert into danim_member values ('admin', 'admin', '어드민', 'abc@abc.abc', '서울', 'admin', 'Y');


insert into danim_member
		values (#{dm_id}, #{dm_pw},
		#{dm_nickname}, #{dm_email}, #{dm_addr, jdbcType=VARCHAR}, #{dm_photo, jdbcType=VARCHAR}, #{dm_isAdmin, jdbcType=VARCHAR})

/*insert into danim_member values('jh','1004','김진현','김진지','대구','dog4.jpg')
insert into danim_member values('bg1','1004','서병관','병관띠','대구','dog.jpg')*/

select * from danim_member;

update danim_member set dm_isadmin = 'Y' where dm_id = 'admin1'

drop table danim_member cascade constraints;
insert into danim_member values('bg1','1004','서병관','병관띠','대구','dog.jpg')

select * from danim_member;

delete danim_member;