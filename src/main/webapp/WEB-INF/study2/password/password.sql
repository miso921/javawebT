show tables;

create table hashTable (
  pwdKey   int  not null auto_increment primary key,
  pwdValue varchar(30) not null
);

drop table hashTable;

insert into hashTable values (default, '54467457');
insert into hashTable values (default, '40302918');
insert into hashTable values (default, '20394857');
insert into hashTable values (default, '39282818');
insert into hashTable values (default, '49282712');
insert into hashTable values (default, '17271829');
insert into hashTable values (default, '49292930');
insert into hashTable values (default, '49282838');
insert into hashTable values (default, '19193838');
insert into hashTable values (default, '29192942');
insert into hashTable values (default, '39292919');
insert into hashTable values (default, '19392821');
insert into hashTable values (default, '30202034');
insert into hashTable values (default, '49939222');
insert into hashTable values (default, '20119291');
insert into hashTable values (default, '40030222');
insert into hashTable values (default, '10003121');
insert into hashTable values (default, '32002322');
insert into hashTable values (default, '22220221');
insert into hashTable values (default, '32320333');
insert into hashTable values (default, '32020232');
insert into hashTable values (default, '40303043');
insert into hashTable values (default, '40141141');
insert into hashTable values (default, '20112143');
insert into hashTable values (default, '30223223');
insert into hashTable values (default, '43232323');
insert into hashTable values (default, '20112012');
insert into hashTable values (default, '50333233');
insert into hashTable values (default, '40334344');
insert into hashTable values (default, '32233232');

select * from hashTable order by pwdValue;
