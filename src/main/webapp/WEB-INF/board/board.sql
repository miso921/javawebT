show tables;

create table board (
	idx   int not null auto_increment,	/* 게시글의 고유번호 */
	mid      varchar(20) not null,					/* 게시글 올린이 아이디 */
	nickName varchar(20) not null,			/* 게시글 올린이 닉네임 */
	title   varchar(100) not null,				/* 게시글 제목 */
	email		varchar(50),							/* 이메일 주소 */
	homePage varchar(50),							/* 홈페이지(개인블로그) 주소 */
	content text not null,						/* 게시글 내용 */
	readNum int default 0,						/* 글 조회수 */
	hostIp  varchar(40) not null,			/* 글 올린이의 IP */
	openSw  char(2)	default 'OK',			/* 게시글 공개여부(OK:공개,NO:비공개) */
	wDate   datetime  default now(),		/* 글 올린 날짜/시간 */
	good		int default 0,						/* '좋아요' 클릭 횟수 누적 */
	primary key(idx)
);

desc board;

insert into board values (default,'admin','관리맨','게시판 서비스를 시작합니다.','cjsk1126@naver.com','cjsk1126.tistory.com','이곳은 게시판입니다.',default,'192.168.50.20',default,default,default);

select * from board;

/* 날짜함수 처리 연습 */
select now();				/* 오늘 날짜 보여달라. */
select year(now());
select month(now());
select day(now());
select concat(year(now()),'년 ',month(now()), '월 ', day(now()), '일');
select concat(year(now()),'년 ',month(now()), '월 ', day(now()), '일') as nalja;
select date(now());				/* 날짜를 '년-월-일' 로 출력 */
select weekday(now()); 		/* 0(월), 1(화), 2(수), 3(목), 4(금), 5(토), 6(일) */
select dayofweek(now());	/* 1(일), 2(월), 3(화), 4(수), 5(목), 6(금), 7(토) */

select year('2023-5-3');
select idx,wDate from board;
select idx,year(wDate) from board;

/* 날짜 연산 */
/* date_add(date, interval 값 Type) */
select date_add(now(), interval 1 day);		/* 오늘 날짜보다 +1 = 내일날짜 출력 */
select date_add(now(), interval -1 day);		/* 오늘 날짜보다 -1 = 어제날짜 출력 */
select now(),date_add(now(), interval 10 day_hour);		/* 오늘날짜보다 +10시간 이후의 날짜/시간 출력 */
select now(),date_add(now(), interval -10 day_hour);		/* 오늘날짜보다 -10시간 이후의 날짜/시간 출력 */

/* date_sub(date, interval 값 Type) */
select date_sub(now(), interval 1 day);		/* 오늘 날짜보다 -1 = 어제날짜 출력 */
select date_sub(now(), interval -1 day);		/* 오늘 날짜보다 +1 = 내일날짜 출력 */

/* board테이블에 적용하기 */
select wDate, date_add(now(), interval -1 day) from board;		/* 게시글중에서 하루전에 올라온 글만 보여주시오 */
select substring(wDate,1,10), substring(date_add(now(), interval -1 day),1,10) from board;
select idx, wDate, date_add(now(), interval -1 day) from board where substring(wDate,1,10) = substring(date_add(now(), interval -1 day),1,10);
select idx, wDate, now() from board where wDate >= date_add(now(), interval -24 day_hour);		/* 게시글중 24시간 전에 올라온 글에대해서만 보여주시오 */
select * from board where wDate >= date_add(now(), interval -24 day_hour);
select idx, wDate, date_add(now(), interval -24 day_hour), now(), (wDate - date_add(now(), interval -24 day_hour)) from board;

/* 날짜차이 계산 : DATEDIFF(시작날짜, 마지막날짜) */
select datediff('2023-05-04', '2023-05-01');
select datediff(now(), '2023-05-01');
select idx, datediff(now(), wDate) from board;
select idx, datediff(now(), wDate) as day_diff from board;

select timestampdiff(hour, now(), '2023-05-04');
select timestampdiff(hour, '2023-05-04', now());
select timestampdiff(hour, wDate, now()) from board;
select timestampdiff(hour, wDate, now()) as hour_diff from board;
select *,timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc;
select *,timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc limit 0,5;
select *,datediff(wDate, now()) as day_diff,timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc limit 0,5;

/* 날짜양식(date_format()) : 4자리년도(%Y), 월(%m), 일(%d) */
select wDate, date_format(wDate, '%Y-%m-%d %H:%i') from board;
select *,date_format(wDate, '%Y-%m-%d'),date_format(wDate, '%H:%i'),timestampdiff(hour, wDate, now()) as hour_diff from board;
select *,date_format(wDate, '%Y-%m-%d') as day_format, date_format(wDate, '%H:%i') as hour_format, timestampdiff(hour, wDate, now()) as hour_diff from board;