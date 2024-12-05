create table comm_picture(
comm_picture_no number(5) primary key,
comm_picture_name varchar2(300 char) not null,
comm_picture_write_name varchar2(200 char) not null,
comm_picture_writer varchar2(300 char) not null,
comm_picture_txt varchar2(300 char) not null,
comm_picture_good number(5) not null,
comm_picture_view number(5) not null,
comm_picture_date date not null
);



insert into COMM_PICTURE values(comm_picture_seq.nextval,'a.jpg','일본-오사카','진지밥','더미데이터',0,0,sysdate)
insert into COMM_PICTURE values(comm_picture_seq.nextval,'a.jpg','대구에서~','준모','더미데이터',0,0,sysdate)
insert into COMM_PICTURE values(comm_picture_seq.nextval,'a.jpg','별헤는밤','장빡','더미데이터',0,0,sysdate)
insert into COMM_PICTURE values(comm_picture_seq.nextval,'a.jpg','그림같은 그리스','마당을나온암탉','더미데이터',0,0,sysdate)
insert into COMM_PICTURE values(comm_picture_seq.nextval,'a.jpg','몽글몽글','맨발의동수','더미데이터',0,0,sysdate)
insert into COMM_PICTURE values(comm_picture_seq.nextval,'a.jpg','레전드 성당','캉문진','더미데이터',0,0,sysdate)
insert into COMM_PICTURE values(comm_picture_seq.nextval,'a.jpg','가을이네요','킹스윙스','더미데이터',0,0,sysdate)
insert into COMM_PICTURE values(comm_picture_seq.nextval,'a.jpg','에펠탑명당','유럽쟁이','더미데이터',0,0,sysdate)
insert into COMM_PICTURE values(comm_picture_seq.nextval,'a.jpg','도톤보리','유희왕','더미데이터',0,0,sysdate)
insert into COMM_PICTURE values(comm_picture_seq.nextval,'a.jpg','그림같은 사진','우왁굳','더미데이터',0,0,sysdate)

delete comm_picture where comm_picture_no = 317

select * from COMM_PICTURE

SELECT * FROM comm_picture WHERE ROWNUM <= 6 order by comm_picture_good 
SELECT * FROM comm_picture WHERE comm_picture_write_name = 'xcvzxcv';

create sequence comm_picture_seq;

/*사진댓글*/
create table comm_picture_reply(
cpr_no number(3) primary key,
cpr_cp_no number(3) not null,
cpr_owner varchar(30 char) not null,
cpr_owner_id varchar(30 char) not null,
cpr_txt varchar(300 char) not null,
cpr_when date not null,

constraint cp_no 
foreign key(cpr_cp_no)
		references comm_picture(comm_picture_no)
		on delete cascade
);


/*영상댓글*/
create table comm_video_reply(
cvr_no number(3) primary key,
cvr_cv_no number(3) not null,
cvr_owner varchar(30 char) not null,
cvr_owner_id varchar(30 char) not null,
cvr_txt varchar(300 char) not null,
cvr_when date not null,

constraint cvpr_no 
foreign key(cvr_cv_no)
		references comm_video(cv_no)
		on delete cascade
);


insert into comm_picture_reply values(comm_picture_reply_seq.nextval,#{cpr_cp_no},'김진현',#{cpr_txt},sysdate);
insert into comm_picture_reply values(comm_picture_reply_seq.nextval,,'김진현',#{cpr_txt},sysdate);



select * from comm_picture_reply

SELECT * FROM comm_picture WHERE ROWNUM < 6 order by comm_picture_good

select * 
from (	
select rownum as rn, comm_picture_no, comm_picture_name, comm_picture_write_name,comm_picture_writer, 
				comm_picture_txt, comm_picture_good,comm_picture_view,comm_picture_date
				from (
					select * from comm_picture order by comm_picture_good desc
				)
			)
			where rn <= 6



/*좋아요 관리테이블*/
create table comm_picture_good(
cpg_id varchar2(30 char) not null,
cpg_good number(3) not null,
cpg_no number(3) not null,


constraint cpg_cp_no 
foreign key(cpg_no)
		references comm_picture(comm_picture_no)
		on delete cascade
)

/*영상 추천 관리테이블*/
create table comm_video_good(
cvg_id varchar2(30 char) not null,
cvg_good number(3) not null,
cvg_no number(3) not null,

constraint cvg_cv_no 
foreign key(cvg_no)
		references comm_video(comm_video_no)
		on delete cascade
)

select count(*) from comm_picture

select * from comm_picture_good where cpg_id = 'jh' and cpg_no= 57

/*영상게시판*/
create table comm_video(
cv_no number(3) primary key,
cv_name varchar2(20 char) not null,
cv_write_name varchar2(20 char) not null,
cv_writer varchar2(30 char) not null,
cv_txt varchar2(300 char) not null,
cv_good number(3) not null,
cv_view number(3) not null,
cv_date date not null
);

insert into COMM_video values(cv_seq.nextval,'a.jpg','일본-오사카','진지밥','더미데이터',0,0,sysdate);
insert into COMM_video values(cv_seq.nextval,'a.jpg','대구에서~','준모','더미데이터',0,0,sysdate);
insert into COMM_video values(cv_seq.nextval,'a.jpg','별헤는밤','장빡','더미데이터',0,0,sysdate);
insert into COMM_video values(cv_seq.nextval,'a.jpg','그림같은 그리스','마당을나온암탉','더미데이터',0,0,sysdate);
insert into COMM_video values(cv_seq.nextval,'a.jpg','몽글몽글','맨발의동수','더미데이터',0,0,sysdate);
insert into COMM_video values(cv_seq.nextval,'a.jpg','레전드 성당','캉문진','더미데이터',0,0,sysdate);
insert into COMM_video values(cv_seq.nextval,'a.jpg','가을이네요','킹스윙스','더미데이터',0,0,sysdate);
insert into COMM_video values(cv_seq.nextval,'a.jpg','너무 좋아요~','킹스윙스','더미데이터',0,0,sysdate);
insert into COMM_video values(cv_seq.nextval,'a.jpg','도톤보리','유희왕','더미데이터',0,0,sysdate);
insert into COMM_video values(cv_seq.nextval,'a.jpg','그림같은 사진','우왁굳','더미데이터',0,0,sysdate);



select * 
from (	
select rownum as rn, cv_no, cv_name, cv_write_name,cv_writer, 
				cv_txt, cv_good,cv_view,cv_date
				from (
					select * from comm_video order by cv_date desc
				)
			)
			where rn <= 6 and rn > 0

			 select count(*) from comm_video
			
create sequence cv_seq;

insert into COMM_VIDEO values(cv_seq.nextval,'테스트2.mp4','테스트','김진현','내용','0','0',sysdate);


select * from comm_video 


select * 
from (	
select rownum as rn, comm_picture_no, comm_picture_name, comm_picture_write_name,comm_picture_writer, 
				comm_picture_txt, comm_picture_good,comm_picture_view,comm_picture_date
				from (
					select * from comm_picture order by comm_picture_date desc
				)
			)
			where rn <= 6 and rn >= 1

/*자유게시판*/
			
create table comm_free(
cf_no number(3) primary key,
cf_file_name varchar2(20 char),
cf_write_name varchar2(20 char) not null,
cf_writer varchar2(30 char) not null,
cf_txt varchar2(300 char) not null,
cf_good number(3) not null,
cf_view number(3) not null,
cf_date date not null
)	




select * from comm_free

drop table comm_free

create sequence cf_seq

select * from comm_free

sinsert into comm_free values(cf_seq.nextval,'a.jpg','제목','글쓴이','내용',0,0,sysdate)

insert into comm_free values(cf_seq.nextval,#{cf_file_name},#{cf_write_name},#{cf_writer},#{cf_txt},0,0,sysdate)

/*자유게시판 리플*/
create table comm_free_reply(
cfr_no number(3) primary key,
cfr_cf_no number(3) not null,
cfr_owner varchar(30 char) not null,
cfr_owner_id varchar(30 char) not null,
cfr_txt varchar(300 char) not null,
cfr_when date not null,

constraint cfpr_no 
foreign key(cfr_cf_no)
		references comm_free(cf_no)
		on delete cascade
);

create sequence comm_free_reply_seq

select * from COMM_FREE_REPLY
/*자유게시판 추천 확인테이블*/
create table comm_free_good(
cfg_id varchar2(30 char) not null,
cfg_good number(3) not null,
cfg_no number(3) not null,


constraint cfg_cf_no 
foreign key(cfg_no)
		references comm_free(cf_no)
		on delete cascade
)

/*공지글*/
create table comm_import(
ci_no number(3) primary key,
ci_file_name varchar2(200 char),
ci_write_name varchar2(200 char) not null,
ci_writer varchar2(300 char) not null,
ci_txt varchar2(300 char) not null,
ci_view number(3) not null,
ci_date date not null
)	



select * from comm_import

create sequence ci_seq

create table comm_import_reply(
cir_no number(3) primary key,
cir_ci_no number(3) not null,
cir_owner varchar(30 char) not null,
cir_owner_id varchar(30 char) not null,
cir_txt varchar(300 char) not null,
cir_when date not null,

constraint cipr_no 
foreign key(cir_ci_no)
		references comm_import(ci_no)
		on delete cascade
);


create sequence comm_import_reply_seq


select * from comm_import

delete from COMM_FREE

insert into COMM_FREE values(cf_seq.nextval,'a.jpg','낼 혼자 속초 여행가는데','진지밥','더미데이터',0,0,sysdate);
insert into COMM_FREE values(cf_seq.nextval,'a.jpg','혼자,뚜벅이로 제주도 간다면','준모','더미데이터',0,0,sysdate);
insert into COMM_FREE values(cf_seq.nextval,'a.jpg','돈파스팔레(DONPAS PALAIS)','장빡','더미데이터',0,0,sysdate);
insert into COMM_FREE values(cf_seq.nextval,'a.jpg','제주도 사람적은데가 경치더이쁜듯?','마당을나온암탉','더미데이터',0,0,sysdate);
insert into COMM_FREE values(cf_seq.nextval,'a.jpg','제주도 예매 언제까지 기다리는게?','맨발의동수','더미데이터',0,0,sysdate);
insert into COMM_FREE values(cf_seq.nextval,'a.jpg','입대전 부산여행 간다 맛집 추천좀','캉문진','더미데이터',0,0,sysdate);
insert into COMM_FREE values(cf_seq.nextval,'a.jpg','대검찰청 - 서울 여행','킹스윙스','더미데이터',0,0,sysdate);
insert into COMM_FREE values(cf_seq.nextval,'a.jpg','가을이네요','유럽쟁이','더미데이터',0,0,sysdate);
insert into COMM_FREE values(cf_seq.nextval,'a.jpg','속리산 법주사','유희왕','더미데이터',0,0,sysdate);
insert into COMM_FREE values(cf_seq.nextval,'a.jpg','일 끝나고 한 일주일 요양차','우왁굳','더미데이터',0,0,sysdate);