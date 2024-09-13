# 주석 : 메모장
# Day02라는 이름을 가진 데이터베이스 제작
create database Day02;

# 데이터베이스 : 작업환경
# 작업환경을 제작했으면 사용을 해야한다.
# Day02라는 데이터베이스(작업환경) 사용
use Day02;

# T1이라는 이름을 가진 테이블을 제작
create table T1(sys_config
	# id : 속성
    # int : 도메인
    ,id int);
    
# describe : 테이블을 요약하는 명령어
desc T1;

insert into T1 values(1);
select * from T1;

create table T2(
	id int, # 속성 -> id, 도메인 -> 정수(int)
    name varchar(10)); # 속성 -> name, 도메인 -> 문자열(varchar)
    
desc T2;

create table T3(
	id int not null,
    name varchar(10));
    
insert into T3(name) values('KDK');
insert into T3(id) values(1);
select * from T3;

# unique : 중복이 발생하지 않아야한다.
create table T4(
	id int unique);
    
insert into T4 values(1);
insert into T4 values(1); # 오류 발생 --> 1 중복

# check : 값이 입력되거나 수정될 때 조건에 맞춰서 수정되게함
create table T5(
	age int check(age >= 0));

insert into T5 values(-1); # 오류 발생 : check 옵션에서 설정한 조건에 맞지 않음

# default : NULL 값이 입력될 때 미리 입력된 값으로 대체
create table T6(
	id int,
    name varchar(10) default "DF");
    
insert into T6(id) values(1);
select * from T6;

# 상위 테이블로 사용할 dept(부서) 테이블 생성
create table dept(
	id int primary key, # 기본키 옵션 : not null + unique
    name varchar(10) not null);
    
# 하위 테이블로 사용한 emp(직원) 테이블 생성
create table emp(
	id int primary key,
    name varchar(10) not null,
    dept_id int,
    foreign key(dept_id) references dept(id)); # 외래키 옵션 : dept 테이블의 기본키인 id를 참조
    
insert into dept values(1, '인사'), (2, '개발'), (3, '계획'), (4,'총무');

insert into emp values (1, '김동규', 1); 
insert into emp values (2, '김동규', 5); # 오류 발생 : 상위 테이블(부모)에 있는 기본키 값 중에 5가 존재 X
insert into emp values (3, '김개똥', null); # 오류 발생 X : 외래키 옵션에는 기본적으로 NULL 값 허용

delete from dept where id = 1; # 상위 테이블 1번 id를 삭제(오류) -> 하위 테이블에 참조되는 값

# 여기에 ALTER_TABLE 생성하기 _>>
create table ALTER_TABLE(
	c1 int,
    c2 int,
    c3 int,
    c4 int,
    c5 int,
    c6 int,
    c7 int,
    c8 int,
    c9 int,
    c10 int);

# ALTER_TABLE이라는 명칭을 가진 테이블의 c10 속성을 삭제
alter table ALTER_TABLE drop column c10;
alter table ALTER_TABLE drop c9; # column 생략 가능

desc ALTER_TABLE;

# ALTER_TABLE이라는 명칭을 가진 테이블에 c11, c12, c13 속성을 추가
alter table ALTER_TABLE add column c11 int;
alter table ALTER_TABLE add column c12 varchar(10) not null; # 옵션 부여가능
alter table ALTER_TABLE add c13 int; # column 생략가능

desc ALTER_TABLE;

# ALTER_TABLE이라는 명칭을 가진 테이블의 c13 속성의 이름을 c23으로 변경
# Column 생략 불가능
alter table ALTER_TABLE rename column c13 to c23;

# ALTER_TABLE이라는 명칭을 가진 테이블의 c23(전 c13) 속상의 자료형을 varchar(10)fh qusrud
alter table ALTER_TABLE modify column c23 varchar(10);

# ALTER_TABLE이라는 명칭을 가진 테이블의 c23(전 c13) 속성의 자료형을 int로 변경하면서 옵션 부여
alter table ALTER_TABLE modify column c23 int not null;
alter table ALTER_TABLE modify c23 int not null; # column 생략 가능alter

# ALTER_TABLE이라는 명칭을 가진 테이블의 c23(전 c13)의 이름을 c13으로 변경하면서
# 자료형과 옵션을 변경
alter table ALTER_TABLE change column c23 c13 varchar(10) unique;
alter table ALTER_TABLE change c23 c13 varchar(10) unique; # column 생략 가능

#ALTER_TABLE의 이름을 T100으로 변경
alter table ALTER_TABLE rename to T100;
desc ALTER_TABLE; # 오류 발생 : 테이블 명칭 변경
desc T100;

# T100(전 ALTER_TABLE)에 기본키 옵션 추가 (c1 속성에 기본키 옵션 부여)
alter table T100 add primary key(c1);

# T100(전 ALTER_TABLE)에 기본키 옵션 삭제
alter table T100 drop primary key;

# T100이라는 명칭을 가진 테이블 삭제
drop table T100;

# Day02라는 명칭을 가진 데이터베이스 삭제
drop database Day02;

# drop database if exists Day02;
# 만약 Day02라는 데이터베이스가 존재한다면 삭제 