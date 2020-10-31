CREATE TABLE "CATEGORY" (
  "IDX" NUMBER(*,0) NOT NULL, 
	"CATEGORY" VARCHAR2(100 BYTE) NOT NULL, 
	"REF" NUMBER(*,0), 
	"LEV" NUMBER(*,0), 
	"SEQ" NUMBER(*,0), 
	PRIMARY KEY ("IDX")
);

delete from category;
drop sequence category_idx_seq;
create sequence category_idx_seq;

-- �� �׷��� ������������ ����Ѵ�. ���� �� �׷� �ȿ����� �� ��� ������ ������������ ���´�.
select * from category order by ref desc, seq asc;