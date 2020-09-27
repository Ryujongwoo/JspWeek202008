# insert into 테이블이름(필드이름) values (저장할 데이터);
INSERT INTO memolist(NAME, PASSWORD, memo, ip) VALUES ('홍길동', '1111', '1등 입니다.', '192.168.100.101');
INSERT INTO memolist(NAME, PASSWORD, memo, ip) VALUES ('임꺽정', '2222', '2등 입니다.', '192.168.100.102');
INSERT INTO memolist(NAME, PASSWORD, memo, ip) VALUES ('장길산', '3333', '3등 입니다.', '192.168.100.103');
INSERT INTO memolist(NAME, PASSWORD, memo, ip) VALUES ('일지매', '4444', '4등 입니다.', '192.168.100.104');

# 자동증가 다시 1부터 시작하기
DELETE FROM memolist;
ALTER TABLE memolist AUTO_INCREMENT = 1;

# select 필드이름 또는 * from 테이블이름;
SELECT NAME, memo FROM memolist;
SELECT * FROM memolist;

# select * from 테이블이름 order by 필드이름 [asc 또는 desc]; # 정렬
SELECT * FROM memolist ORDER BY NAME;
SELECT * FROM memolist ORDER BY NAME ASC;
SELECT * FROM memolist ORDER BY idx DESC; # 글 목록을 최신글 부터 얻어온다.

# select * from 테이블이름 order by 필드이름 [asc 또는 desc] limit 인덱스, 개수
# 인덱스 : select 명령의 출력 결과 맨 처음에 표시되는 데이터의 인덱스 번호가 0부터 시작된다.
SELECT * FROM memolist ORDER BY idx DESC LIMIT 0, 10; # 글 목록을 최신글 부터 한 페이지를 얻어온다.

# select * from 테이블이름 [where 조건식] [order by 필드이름 정렬기준] [limit 인덱스, 개수];
SELECT * FROM memolist WHERE NAME = '홍길동';
SELECT * FROM memolist WHERE idx = 5; # 특정 글 한 건을 얻어온다.

# or 조건
SELECT * FROM memolist WHERE NAME = '홍길동' OR NAME = '임꺽정';
SELECT * FROM memolist WHERE NAME = '장길산' || NAME = '일지매';
SELECT * FROM memolist WHERE NAME IN ('홍길동', '임꺽정', '장길산');
SELECT * FROM memolist WHERE NAME NOT IN ('홍길동', '임꺽정', '장길산');

# and 조건
SELECT * FROM memolist WHERE idx >= 5 AND idx <= 10;
SELECT * FROM memolist WHERE idx >= 15 && idx <= 20;
SELECT * FROM memolist WHERE idx BETWEEN 25 AND 30; # 이상, 이하 조건만 가능하다.

# 부분일치 조건 => LIKE 연산자와 와일드 카드 문자 => '_'(1문자), '%'(여러문자)
SELECT * FROM memolist WHERE NAME LIKE '홍%'; # ~로 시작하는
SELECT * FROM memolist WHERE NAME LIKE '%매'; # ~로 끝나는
SELECT * FROM memolist WHERE NAME LIKE '%길%'; # ~를 포함하는, 검색 기능 실행에 사용한다.

# 그룹 함수
# SUM(합계), AVG(평균), MAX(최대값), MIN(최소값), COUNT(개수)
SELECT SUM(idx) FROM memolist;
SELECT AVG(idx) FROM memolist;
SELECT MAX(idx) FROM memolist;
SELECT MIN(idx) FROM memolist;
SELECT COUNT(*) FROM memolist; # 테이블에 저장된 전체 글의 개수를 얻어온다.

# delete from 테이블이름 where 조건식;
# 조건식을 사용하지 않으면 테이블에 저장된 모든 데이터가 삭제된다.
DELETE FROM memolist;
DELETE FROM memolist WHERE NAME = '홍길동';

# update 테이블이름 set 수정할 내용, 수정할 내용, ... where 조건식
# 조건식을 사용하지 않으면 테이블에 저장된 모든 데이터가 수정된다.
UPDATE memolist SET PASSWORD = '5555';
UPDATE memolist SET PASSWORD = '2222' WHERE NAME = '임꺽정';
UPDATE memolist SET PASSWORD = '3333' WHERE NAME = '장길산';
UPDATE memolist SET PASSWORD = '4444' WHERE NAME = '일지매';

SELECT * FROM memolist ORDER BY idx DESC;

