USE WanderSpaceDB;

CREATE TABLE IF NOT EXISTS country (
    country_id VARCHAR(3) NOT NULL,      -- 나라 코드 (ISO 3166-1 alpha-3)
    country_name VARCHAR(50) NOT NULL,   -- 나라 이름
    capital VARCHAR(50),                 -- 수도
    PRIMARY KEY (country_id)             -- 나라 코드를 기본키로 설정
) DEFAULT CHARSET=utf8;

INSERT INTO country (country_id, country_name, capital)
VALUES 
    ('kr', 'Korea', 'Seoul'),
    ('cn', 'China', 'Beijing'),
    ('jp', 'Japan', 'Tokyo'),
    ('fr', 'France', 'Paris'),
    ('it', 'Italy', 'Roma'),
    ('us', 'USA', 'Washington, D.C.'),
    ('ca', 'Canada', 'Ottawa'),
    ('de', 'Germany', 'Berlin'),
    ('gb', 'United Kingdom', 'London'),
    ('au', 'Australia', 'Canberra'),
    ('es', 'Spain', 'Madrid'),
    ('mx', 'Mexico', 'Mexico City'),
    ('br', 'Brazil', 'Brasilia'),
    ('in', 'India', 'New Delhi'),
    ('eg', 'Egypt', 'Cairo'),
    ('za', 'South Africa', 'Pretoria'),
    ('th', 'Thailand', 'Bangkok'),
    ('ar', 'Argentina', 'Buenos Aires'),
    ('ru', 'Russia', 'Moscow'),
    ('tr', 'Turkey', 'Ankara'),
    ('ch', 'Switzerland', 'Bern'),
    ('se', 'Sweden', 'Stockholm'),
    ('pt', 'Portugal', 'Lisbon'),
    ('no', 'Norway', 'Oslo'),
    ('nl', 'Netherlands', 'Amsterdam'),
    ('gr', 'Greece', 'Athens'),
    ('nz', 'New Zealand', 'Wellington'),
    ('id', 'Indonesia', 'Jakarta'),
    ('my', 'Malaysia', 'Kuala Lumpur');

SELECT * FROM country;		--입력 데이터 전체 조회
DELETE FROM country;		--입력 데이터 전체 삭제
DROP TABLE country;			--테이블 삭제