show tables;

/* 관리자가 예약정보(프로그램) 등록하기 */
create table reservationInformation (
  idx       int not null auto_increment primary key,
  title      varchar(40) not null,		/* 예약 프로그램명(필라테스/헬스/통기타/영화감상/영어회화) */
  content   text not null,						/* 예약프로그램 소개 */
  totalNum  int default 1,						/* 예약 총 인원수 */
  reservationNum int default 0,				/* 실제로 예약한 인원수 */
  progress  varchar(10) default '모집중',	/* 진행현황(모집중/모집마감/프로그램종료/모집대기) */
  startDate datetime default now(),			/* 프로그램 시작일 */
  endDate   datetime default now(),			/* 프로그램 종료일 */
  popup			char(2)  default 'OK', 			/* 초기 공지메뉴에 고정시키기(OK/NO) */
  photo			varchar(100)
);
drop table reservationInformation;
desc reservationInformation;

/* 회원들 예약테이블에 예약하기 */
create table reservation (
  idx int not null auto_increment primary key,	/* 예약테이블 고유번호 */
  resInforIdx int not null,					/* 예약정보명의 고유번호(외래키설정) */
  memberIdx int not null,						/* 회원테이블의 고유번호 - 회원테이블의 mid를 외래키로 사용하려면 member테이블의 primary key지정과 똑같이 해줘야한다. 따라서 회원테이블의 주키인 idx를 맞춰주기위해, memberIdx를 하나 더 주었다. */
  mid		varchar(20) not null,				/* 예약자아이디(외래키설정) */
  reservationNum int default 1,				/* 예약인원(본인1명 + 추가인원) */
  reservationDate	datetime default now(), /* 예약일자 */
  rWDate  datetime default now(),				/* 예약사이트에 실제로 '예약/취소'을 한 날짜 */
  reservationFlag varchar(10) default '예약완료', /* 예약상태(예약완료/예약취소) */
  foreign key(resInforIdx) references reservationInformation(idx)
    on update cascade on delete restrict,
  foreign key(memberIdx,mid) references member(idx,mid)		/* member테이블의 primary key 설정형식과 똑 같아야 한다. */
    on update cascade on delete restrict
);

drop table reservation;
desc reservation;

