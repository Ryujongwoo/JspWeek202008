CREATE TABLE "GUESTBOOK" (
  "IDX" NUMBER(*,0) NOT NULL, 
	"NAME" CHAR(30 BYTE) NOT NULL, 
	"PASSWORD" CHAR(30 BYTE) NOT NULL, 
	"MEMO" VARCHAR2(1000 BYTE) NOT NULL, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"IP" CHAR(15 BYTE), 
	PRIMARY KEY ("IDX")
);

-- sequence�� �ٽ� 1���� �����ϰ� �Ѵ�.
delete from guestbook;
drop sequence guestbook_idx_seq; -- sequence�� �����Ѵ�.
create sequence guestbook_idx_seq; -- sequence�� �����.

select * from guestbook order by idx desc;

insert into guestbook (idx, name, password, memo, ip) 
values (guestbook_idx_seq.nextval, 'ȫ�浿', '1111', '1�� �Դϴ�.', '192.168.100.101');
insert into guestbook (idx, name, password, memo, ip) 
values (guestbook_idx_seq.nextval, '�Ӳ���', '2222', '2�� �Դϴ�.', '192.168.100.102');
insert into guestbook (idx, name, password, memo, ip) 
values (guestbook_idx_seq.nextval, '����', '3333', '3�� �Դϴ�.', '192.168.100.103');
insert into guestbook (idx, name, password, memo, ip) 
values (guestbook_idx_seq.nextval, '������', '4444', '4�� �Դϴ�.', '192.168.100.104');
