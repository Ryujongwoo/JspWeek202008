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

-- 글 그룹의 내림차순으로 출력한다. 같은 글 그룹 안에서는 글 출력 순서의 오름차순으로 얻어온다.
select * from category order by ref desc, seq asc;