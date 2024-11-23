USE WanderSpaceDB;

CREATE TABLE IF NOT EXISTS users (
    u_email VARCHAR(50) NOT NULL UNIQUE,
    u_name VARCHAR(50) NOT NULL,
    u_phoneNumber VARCHAR(15) NOT NULL,
    u_nickname VARCHAR(20),
    u_password TEXT NOT NULL,
    PRIMARY KEY (u_email)
) DEFAULT CHARSET=utf8;

INSERT INTO users (u_name, u_email, u_phoneNumber, u_nickname, u_password) 
VALUES 
('박창률', 'admin', '010-1234-5678', 'parker', '1234'),
('박창률', 'parker@parker.com', '010-1234-5678', 'parker', 'parker12!'),
('Qihuan', 'qihuan@qihuan.com', '010-1234-5678', 'qihuan', 'qihuan12!');

--SELECT * FROM users;	--입력 데이터 확인
--DELETE FROM users;		--입력 데이터 전체 삭제
--DROP TABLE users;		--테이블 삭제
DELETE FROM users WHERE u_email ='parker1@parker.com';