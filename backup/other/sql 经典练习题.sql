use fuxi;

CREATE TABLE STUDENT
(
  SNO       VARCHAR(3) NOT NULL,
  SNAME     VARCHAR(4) NOT NULL,
  SSEX      VARCHAR(2) NOT NULL,
  SBIRTHDAY DATETIME,
  CLASS     VARCHAR(5)
);

CREATE TABLE COURSE
(
  CNO   VARCHAR(5)  NOT NULL,
  CNAME VARCHAR(10) NOT NULL,
  TNO   VARCHAR(10) NOT NULL
);

CREATE TABLE SCORE
(
  SNO    VARCHAR(3)     NOT NULL,
  CNO    VARCHAR(5)     NOT NULL,
  DEGREE NUMERIC(10, 1) NOT NULL
);

CREATE TABLE TEACHER
(
  TNO       VARCHAR(3)  NOT NULL,
  TNAME     VARCHAR(4)  NOT NULL,
  TSEX      VARCHAR(2)  NOT NULL,
  TBIRTHDAY DATETIME    NOT NULL,
  PROF      VARCHAR(6),
  DEPART    VARCHAR(10) NOT NULL
);

INSERT INTO STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS) VALUES (108, '曾華'
  , '男', '1977-09-01', 95033);
INSERT INTO STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS) VALUES (105, '匡明'
  , '男', '1975-10-02', 95031);
INSERT INTO STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS) VALUES (107, '王麗'
  , '女', '1976-01-23', 95033);
INSERT INTO STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS) VALUES (101, '李軍'
  , '男', '1976-02-20', 95033);
INSERT INTO STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS) VALUES (109, '王芳'
  , '女', '1975-02-10', 95031);
INSERT INTO STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS) VALUES (103, '陸君'
  , '男', '1974-06-03', 95031);

INSERT INTO COURSE (CNO, CNAME, TNO) VALUES ('3-105', '計算機導論', 825);
INSERT INTO COURSE (CNO, CNAME, TNO) VALUES ('3-245', '操作系統', 804);
INSERT INTO COURSE (CNO, CNAME, TNO) VALUES ('6-166', '數據電路', 856);
INSERT INTO COURSE (CNO, CNAME, TNO) VALUES ('9-888', '高等數學', 100);

INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (103, '3-245', 86);
INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (105, '3-245', 75);
INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (109, '3-245', 68);
INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (103, '3-105', 92);
INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (105, '3-105', 88);
INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (109, '3-105', 76);
INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (101, '3-105', 64);
INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (107, '3-105', 91);
INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (101, '6-166', 85);
INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (107, '6-106', 79);
INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (108, '3-105', 78);
INSERT INTO SCORE (SNO, CNO, DEGREE) VALUES (108, '6-166', 81);

INSERT INTO TEACHER (TNO, TNAME, TSEX, TBIRTHDAY, PROF, DEPART)
VALUES (804, '李誠', '男', '1958-12-02', '副教授', '計算機系');
INSERT INTO TEACHER (TNO, TNAME, TSEX, TBIRTHDAY, PROF, DEPART)
VALUES (856, '張旭', '男', '1969-03-12', '講師', '電子工程系');
INSERT INTO TEACHER (TNO, TNAME, TSEX, TBIRTHDAY, PROF, DEPART)
VALUES (825, '王萍', '女', '1972-05-05', '助教', '計算機系');
INSERT INTO TEACHER (TNO, TNAME, TSEX, TBIRTHDAY, PROF, DEPART)
VALUES (831, '劉冰', '女', '1977-08-14', '助教', '電子工程系');

-- 1、 查詢Student表中的所有記錄的Sname、Ssex和Class列。
select
  SNAME,
  SSEX,
  CLASS
from STUDENT;

-- 2、 查詢教師所有的單位即不重覆的Depart列。
select distinct DEPART
from TEACHER1;

-- 3、 查詢Student表的所有記錄。
select *
from STUDENT;

-- 4、 查詢Score表中成績在60到80之間的所有記錄。
select *
from SCORE
where DEGREE > 60 and DEGREE < 80;

-- 5、 查詢Score表中成績為85，86或88的記錄。
select *
from SCORE
where DEGREE = 85 or DEGREE = 86 or DEGREE = 88;

-- 6、 查詢Student表中“95031”班或性別為“女”的同學記錄。
select *
from STUDENT
where CLASS = '95031' or SSEX = '女';

-- 7、 以Class降序查詢Student表的所有記錄。
select *
from STUDENT
order by CLASS desc;

-- 8、 以Cno升序、Degree降序查詢Score表的所有記錄。
select *
from SCORE
order by CNO asc, DEGREE desc;

-- 9、 查詢“95031”班的學生人數。
select count(*)
from STUDENT
where CLASS = '95031';

-- 10、查詢Score表中的最高分的學生學號和課程號。
select
  sno,
  CNO
from SCORE
where DEGREE = (
  select max(DEGREE)
  from SCORE
);

-- 11、查詢‘3-105’號課程的平均分。
select avg(DEGREE)
from SCORE
where CNO = '3-105';

-- 12、查詢Score表中至少有5名學生選修的並以3開頭的課程的平均分數。
select
  avg(DEGREE),
  CNO
from SCORE
where cno like '3%'
group by CNO
having count(*) > 5;

-- 13、查詢最低分大於70，最高分小於90的Sno列。
select SNO
from SCORE
group by SNO
having min(DEGREE) > 70 and max(DEGREE) < 90;

-- 14、查詢所有學生的Sname、Cno和Degree列。
select
  SNAME,
  CNO,
  DEGREE
from STUDENT, SCORE
where STUDENT.SNO = SCORE.SNO;

-- 15、查詢所有學生的Sno、Cname和Degree列。
select
  SCORE.SNO,
  CNO,
  DEGREE
from STUDENT, SCORE
where STUDENT.SNO = SCORE.SNO;

-- 16、查詢所有學生的Sname、Cname和Degree列。
SELECT
  A.SNAME,
  B.CNAME,
  C.DEGREE
FROM STUDENT A
  JOIN (COURSE B, SCORE C)
    ON A.SNO = C.SNO AND B.CNO = C.CNO;

-- 17、查詢“95033”班所選課程的平均分。
select avg(DEGREE)
from SCORE
where sno in (select SNO
              from STUDENT
              where CLASS = '95033');

-- 18、假設使用如下命令建立了一個grade表：
create table grade (
  low  numeric(3, 0),
  upp  numeric(3),
  rank char(1)
);
insert into grade values (90, 100, 'A');
insert into grade values (80, 89, 'B');
insert into grade values (70, 79, 'C');
insert into grade values (60, 69, 'D');
insert into grade values (0, 59, 'E');
-- 現查詢所有同學的Sno、Cno和rank列。
SELECT
  A.SNO,
  A.CNO,
  B.RANK
FROM SCORE A, grade B
WHERE A.DEGREE BETWEEN B.LOW AND B.UPP
ORDER BY RANK;

-- 19、查詢選修“3-105”課程的成績高於“109”號同學成績的所有同學的記錄。
select *
from SCORE
where CNO = '3-105' and DEGREE > ALL (
  select DEGREE
  from SCORE
  where SNO = '109'
);

set @@global.sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
set sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

-- 20、查詢score中選學一門以上課程的同學中分數為非最高分成績的記錄
select *
from SCORE
where DEGREE < (select MAX(DEGREE)
                from SCORE)
group by SNO
having count(*) > 1;

-- 21、查詢成績高於學號為“109”、課程號為“3-105”的成績的所有記錄。
-- 同19

-- 22、查詢和學號為108的同學同年出生的所有學生的Sno、Sname和Sbirthday列。
select
  SNO,
  SNAME,
  SBIRTHDAY
from STUDENT
where year(SBIRTHDAY) = (
  select year(SBIRTHDAY)
  from STUDENT
  where SNO = '108'
);

-- 23、查詢“張旭“教師任課的學生成績。
select *
from SCORE
where cno = (
  select CNO
  from COURSE
    inner join TEACHER on COURSE.TNO = TEACHER.TNO and TNAME = '張旭'
);

-- 24、查詢選修某課程的同學人數多於5人的教師姓名。
select TNAME
from TEACHER
where TNO = (
  select TNO
  from COURSE
  where CNO = (select CNO
               from SCORE
               group by CNO
               having count(SNO) > 5)
);

-- 25、查詢95033班和95031班全體學生的記錄。
select *
from STUDENT
where CLASS in ('95033', '95031');

-- 26、查詢存在有85分以上成績的課程Cno.
select cno
from SCORE
group by CNO
having MAX(DEGREE) > 85;

-- 27、查詢出“計算機系“教師所教課程的成績表。
select *
from SCORE
where CNO in (select CNO
              from TEACHER, COURSE
              where DEPART = '計算機系' and COURSE.TNO = TEACHER.TNO);

-- 28、查詢“計算機系”與“電子工程系“不同職稱的教師的Tname和Prof
select
  tname,
  prof
from TEACHER
where depart = '計算機系' and prof not in (
  select prof
  from TEACHER
  where depart = '電子工程系'
);

-- 29、查詢選修編號為“3-105“課程且成績至少高於選修編號為“3-245”的同學的Cno、Sno和Degree,並按Degree從高到低次序排序。
select
  CNO,
  SNO,
  DEGREE
from SCORE
where CNO = '3-105' and DEGREE > any (
  select DEGREE
  from SCORE
  where CNO = '3-245'
)
order by DEGREE desc;

-- 30、查詢選修編號為“3-105”且成績高於選修編號為“3-245”課程的同學的Cno、Sno和Degree.
SELECT *
FROM SCORE
WHERE DEGREE > ALL (
  SELECT DEGREE
  FROM SCORE
  WHERE CNO = '3-245'
)
ORDER by DEGREE desc;

-- 31、查詢所有教師和同學的name、sex和birthday.
select
  TNAME     name,
  TSEX      sex,
  TBIRTHDAY birthday
from TEACHER
union
select
  sname     name,
  SSEX      sex,
  SBIRTHDAY birthday
from STUDENT;

-- 32、查詢所有“女”教師和“女”同學的name、sex和birthday.
select
  TNAME     name,
  TSEX      sex,
  TBIRTHDAY birthday
from TEACHER
where TSEX = '女'
union
select
  sname     name,
  SSEX      sex,
  SBIRTHDAY birthday
from STUDENT
where SSEX = '女';

-- 33、查詢成績比該課程平均成績低的同學的成績表。
SELECT A.*
FROM SCORE A
WHERE DEGREE < (SELECT AVG(DEGREE)
                FROM SCORE B
                WHERE A.CNO = B.CNO);

-- 34、查詢所有任課教師的Tname和Depart.
select
  TNAME,
  DEPART
from TEACHER a
where exists(select *
             from COURSE b
             where a.TNO = b.TNO);

-- 35、查詢所有未講課的教師的Tname和Depart.
select
  TNAME,
  DEPART
from TEACHER a
where tno not in (select tno
                  from COURSE);

-- 36、查詢至少有2名男生的班號。
select CLASS
from STUDENT
where SSEX = '男'
group by CLASS
having count(SSEX) > 1;

-- 37、查詢Student表中不姓“王”的同學記錄。
select *
from STUDENT
where SNAME not like "王%";

-- 38、查詢Student表中每個學生的姓名和年齡。
select
  SNAME,
  year(now()) - year(SBIRTHDAY)
from STUDENT;

-- 39、查詢Student表中最大和最小的Sbirthday日期值。
select min(SBIRTHDAY) birthday
from STUDENT
union
select max(SBIRTHDAY) birthday
from STUDENT;

-- 40、以班號和年齡從大到小的順序查詢Student表中的全部記錄。
select *
from STUDENT
order by CLASS desc, year(now()) - year(SBIRTHDAY) desc;

-- 41、查詢“男”教師及其所上的課程。
select *
from TEACHER, COURSE
where TSEX = '男' and COURSE.TNO = TEACHER.TNO;

-- 42、查詢最高分同學的Sno、Cno和Degree列。
select
  sno,
  CNO,
  DEGREE
from SCORE
where DEGREE = (select max(DEGREE)
                from SCORE);

-- 43、查詢和“李軍”同性別的所有同學的Sname.
select sname
from STUDENT
where SSEX = (select SSEX
              from STUDENT
              where SNAME = '李軍');

-- 44、查詢和“李軍”同性別並同班的同學Sname.
select sname
from STUDENT
where (SSEX, CLASS) = (select
                         SSEX,
                         CLASS
                       from STUDENT
                       where SNAME = '李軍');

-- 45、查詢所有選修“計算機導論”課程的“男”同學的成績表
select *
from SCORE, STUDENT
where SCORE.SNO = STUDENT.SNO and SSEX = '男' and CNO = (
  select CNO
  from COURSE
  where CNAME = '計算機導論');



-- 46、使用遊標方式來同時查詢每位同學的名字，他所選課程及成績。

declare
 cursor student_cursor is
  select S.SNO,S.SNAME,C.CNAME,SC.DEGREE as DEGREE
  from STUDENT S, COURSE C, SCORE SC
  where S.SNO=SC.SNO
  and SC.CNO=C.CNO;

  student_row student_cursor%ROWTYPE;

begin
  open student_cursor;
   loop
    fetch student_cursor INTO student_row;
    exit when student_cursor%NOTFOUND;
     dbms_output.put_line( student_row.SNO || '' || 

student_row.SNAME|| '' || student_row.CNAME || '' ||

student_row.DEGREE);
   end loop;
  close student_cursor;
END;
/ 


-- 47、 聲明觸發器指令，每當有同學轉換班級時執行觸發器顯示當前和之前所在班級。

CREATE OR REPLACE TRIGGER display_class_changes 
AFTER DELETE OR INSERT OR UPDATE ON student 
FOR EACH ROW 
WHEN (NEW.sno > 0) 

BEGIN 
   
   dbms_output.put_line('Old class: ' || :OLD.class); 
   dbms_output.put_line('New class: ' || :NEW.class); 
END; 
/ 


Update student
set class=95031
where sno=109;


-- 48、 刪除已設置的觸發器指令

DROP TRIGGER display_class_changes;

