

--사진,제목,좋아요,뷰수,댓글수,작성일자, 작성자프사, 작성자 아이디, 검색키워

create table review_board(
rb_no number(5)primary key,
rb_title varchar2(100 char)not null,
rb_likecount number(10) not null,
rb_viewcount number(10) not null,
rb_commentcount number(10) not null,
rb_date date not null,
rb_text varchar2(500 char) not null

);


drop table review_board cascade constraint purge;

drop sequence review_board_seq;

create sequence review_board_seq;

insert into REVIEW_BOARD values(review_board_seq.nextval, 'bbc', 0, 0, 0, sysdate, 'test','10','10000','1','서울','1.jpg');
insert into REVIEW_BOARD values(review_board_seq.nextval, '한글', 0, 0, 0, sysdate, 'test','5','100000','1','인천','1.jpg');

insert into REVIEW_BOARD values(review_board_seq.nextval, '예산1', 0, 0, 0, sysdate, 'test','1','1','1','1','1.jpg');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test1', 0, 0, 0, sysdate, 'test','1','500000','커플여행','서울','1.jpg','멋쟁이');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test2', 0, 0, 0, sysdate, 'test','1','500000','커플여행','서울','1.jpg','예쁜이');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test3', 0, 0, 0, sysdate, 'test','1','500000','커플여행','서울','1.jpg','잘생이');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test4', 0, 0, 0, sysdate, 'test','1','500000','커플여행','서울','1.jpg','깍쟁이');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test5', 0, 0, 0, sysdate, 'test','2','500','감성카페찾기','부산','2.jpg','ㅇㅇㅇ');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test6', 0, 0, 0, sysdate, 'test','3','700000','비즈니스여행','대구','2.jpg','ㅎㅎㅎ');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test7', 0, 0, 0, sysdate, 'test','8','80000','비즈니스여행','대구','2.jpg','ㅋㅋㅋ');

select * from REVIEW_BOARD where rb_headnum like '1'
select * from REVIEW_BOARD order by rb_date desc


select * from REVIEW_BOARD where  rb_budget <= '100000' and rb_theme like '%%' and rb_location like '%%';

delete REVIEW_BOARD where rb_no=11;


alter table REVIEW_BOARD add (
rb_headNum varchar2(50 char) not null,
rb_budget varchar2(50 char) not null,
rb_theme varchar2(50 char) not null,
rb_location varchar2(50 char) not null
)

alter table review_board add rb_img varchar2(100 char) not null;

truncate table review_board;

alter table review_board modify rb_budget number(20);
alter table review_board add rb_username varchar2(100 char) not null;

alter table review_board modify rb_img varchar2(1000 char);


alter table REVIEW_BOARD add (
rb_coordinate varchar2(1000 char) not null,
rb_d1Schedule varchar2(1000 char) ,
rb_d1Text varchar2(1000 char) ,
rb_d2Schedule varchar2(1000 char) ,
rb_d2Text varchar2(1000 char) ,
rb_d3Schedule varchar2(1000 char) ,
rb_d3Text varchar2(1000 char) ,
rb_d4Schedule varchar2(1000 char) ,
rb_d4Text varchar2(1000 char) ,
rb_d5Schedule varchar2(1000 char) ,
rb_d5Text varchar2(1000 char) ,
rb_d6Schedule varchar2(1000 char) ,
rb_d6Text varchar2(1000 char) ,
rb_d7Schedule varchar2(1000 char) ,
rb_d7Text varchar2(1000 char) ,
rb_d8Schedule varchar2(1000 char) ,
rb_d8Text varchar2(1000 char) ,
rb_d9Schedule varchar2(1000 char) ,
rb_d9Text varchar2(1000 char) ,
rb_d10Schedule varchar2(1000 char) ,
rb_d10Text varchar2(1000 char) );

insert into REVIEW_BOARD values(review_board_seq.nextval, 'title', 0, 0, 0, sysdate, 'text','headnum',
'budget','theme','location','img','username','coordinate','d1schedule','d1text',
'd2schedule','d2text','d3schedule','d3text','d4schedule','d4text','d5schedule','d5text','d6schedule','d6text',
'd7schedule','d7text','d8schedule','d8text','d9schedule','d9text','d10schedule','d10text');

alter table REVIEW_BOARD add (rb_totalroute varchar2(2000 char) not null);
alter table REVIEW_BOARD add (rb_totalday number(20) not null);

/*리뷰댓글*/
create table review_reply(
rbr_no number(3) primary key,
rbr_rb_no number(3) not null,
rbr_owner varchar(30 char) not null,
rbr_txt varchar(300 char) not null,
rbr_when date not null,

constraint cons_rb_no 
foreign key(rbr_rb_no)
		references REVIEW_BOARD(rb_no)
		on delete cascade
);
create sequence review_reply_seq

select * from review_reply;
insert into comm_picture_reply values(comm_picture_reply_seq.nextval,#{cpr_cp_no},'김진현',#{cpr_txt},sysdate);
insert into review_reply values(review_reply_seq.nextval,'281','rbr_owner','rbr_txt',sysdate);

select * from review_reply where rbr_rb_no = 281 order by
		rbr_when desc
		
