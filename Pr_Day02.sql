# 제조업체 테이블
# 상품 테이블 제작

# 데이터베이스 이름 : Pr_Day02
# if exists 구분 필수 사용

# 제조업체 테이블 이름 : manu
# id : 정수 , 기본키
# name : 문자열, null 값 허용하지 않음

# 상품 테이블 이름 : pro
# id : 정수, 기본키
# name : 문자열, null 값 허용하지 않음
# m_id : 외래키, manu 테이블 id 값을 참조



drop database if exists Pr_Day02;

create database Pr_Day02;

use Pr_Day02;

create table manu(
	id int primary key,
    name varchar(10) not null
);

create table pro(
	id int primary key,
    name varchar(10) not null,
    m_id int,
    foreign key(m_id) references manu(id)
);
