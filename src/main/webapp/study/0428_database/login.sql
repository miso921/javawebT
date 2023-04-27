/* login.sql */
show tables;

desc sungjuk;
select * from sungjuk;		-- 한줄 주석

create table login (
  idx  int not null auto_increment primary key,	/* 고유번호 */
  mid  varchar(20) not null,			/* 아이디 */
  pwd  varchar(20) not null,			/* 비밀번호 */
  name varchar(20) not null,			/* 성명 */
  point int default 100,					/* 포인트 */
  lastDate datetime default now(),/* 최종 방문일자 */
  todayCount int default 0				/* 오늘 방문일자 누적 */
);

desc login;

insert into login values (default,"admin","1234","관리자",default,default,default);

select * from login;
