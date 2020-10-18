CREATE TABLE "GUESTBOOK" (
  "IDX" NUMBER(*,0) NOT NULL, 
	"NAME" CHAR(30 BYTE) NOT NULL, 
	"PASSWORD" CHAR(30 BYTE) NOT NULL, 
	"MEMO" VARCHAR2(1000 BYTE) NOT NULL, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"IP" CHAR(15 BYTE), 
	PRIMARY KEY ("IDX")
);

-- sequence를 다시 1부터 시작하게 한다.
delete from guestbook;
drop sequence guestbook_idx_seq; -- sequence를 제거한다.
create sequence guestbook_idx_seq; -- sequence를 만든다.

select * from guestbook order by idx desc;

insert into guestbook (idx, name, password, memo, ip) 
values (guestbook_idx_seq.nextval, '홍길동', '1111', '1등 입니다.', '192.168.100.101');
insert into guestbook (idx, name, password, memo, ip) 
values (guestbook_idx_seq.nextval, '임꺽정', '2222', '2등 입니다.', '192.168.100.102');
insert into guestbook (idx, name, password, memo, ip) 
values (guestbook_idx_seq.nextval, '장길산', '3333', '3등 입니다.', '192.168.100.103');
insert into guestbook (idx, name, password, memo, ip) 
values (guestbook_idx_seq.nextval, '일지매', '4444', '4등 입니다.', '192.168.100.104');

