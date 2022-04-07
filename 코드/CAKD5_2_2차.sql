SELECT * FROM PURPROD;
SELECT * FROM prodcl;
SELECT * FROM channel;    --의미가 없음 아무정보도 안나옴
SELECT * FROM compet;     --경쟁사를 이용한 정보가 없음
SELECT * FROM custdemo;     
SELECT * FROM membership;       

-- 전년대비 매출
SELECT YEAR ,SUM(구매금액) ,AVG(구매금액)
FROM PURPROD
GROUP BY YEAR;

--D이용고객 테이블 생성
SELECT * FROM PURPROD;
CREATE TABLE MAKET_D AS
SELECT * FROM PURPROD
WHERE 제휴사 = 'D';

-- D제휴사 정리
SELECT 고객번호,COUNT(DISTINCT(영수증번호))
FROM MAKET_D
GROUP BY 고객번호;


--
SELECT * from maket_d m
full outer join custdemo c on m.고객번호 = c.고객번호;

drop view a;

create view a as
SELECT m.고객번호, sum(m.구매금액)총소비,COUNT(DISTINCT(m.영수증번호))소비건수
from maket_d m
full outer join custdemo c on m.고객번호 = c.고객번호
group by m.고객번호;

SELECT 성별, sum(총소비),sum(소비건수)
from custdemo c
join a  on a.고객번호 = c.고객번호
group by 성별;

SELECT 연령대, sum(총소비),sum(소비건수)
from custdemo c
join a  on a.고객번호 = c.고객번호
group by 연령대
order by 연령대 ;

SELECT 거주지역, sum(총소비),sum(소비건수)
from custdemo c
join a  on a.고객번호 = c.고객번호
group by 거주지역
order by 거주지역 ;

--대분류코드별 금액
SELECT 대분류코드, sum(구매금액)
FROM MAKET_D
GROUP BY 대분류코드
order by 대분류코드;

SELECT 대분류코드, COUNT(DISTINCT(영수증번호))
FROM MAKET_D
GROUP BY 대분류코드
order by 대분류코드;

SELECT 대분류코드, sum(구매금액)
FROM MAKET_D
where year = 2015
GROUP BY 대분류코드
order by 대분류코드;


SELECT 대분류코드, COUNT(DISTINCT(영수증번호))
FROM MAKET_D
where year = 2015
GROUP BY 대분류코드
order by 대분류코드;

SELECT m.대분류코드, sum(구매금액)
from maket_d m
full outer join custdemo c on m.고객번호 = c.고객번호
where 성별 = 'M'
group by m.대분류코드
order by 대분류코드;

--대분류코드별 금액
SELECT 대분류코드, sum(구매금액)
FROM MAKET_D
GROUP BY 대분류코드
order by 대분류코드;

SELECT 대분류코드, COUNT(DISTINCT(영수증번호))
FROM MAKET_D
GROUP BY 대분류코드
order by 대분류코드;

SELECT 대분류코드, sum(구매금액)
FROM MAKET_D
where year = 2015
GROUP BY 대분류코드
order by 대분류코드;


SELECT 대분류코드, COUNT(DISTINCT(영수증번호))
FROM MAKET_D
where year = 2015
GROUP BY 대분류코드
order by 대분류코드;

SELECT m.대분류코드, sum(구매금액)
from maket_d m
full outer join custdemo c on m.고객번호 = c.고객번호
where 성별 = 'M'
group by m.대분류코드
order by 대분류코드;

--중분류코드별 금액
SELECT 중분류코드, sum(구매금액)
FROM MAKET_D
GROUP BY 중분류코드
order by 중분류코드;

SELECT 중분류코드, COUNT(DISTINCT(영수증번호))
FROM MAKET_D
GROUP BY 중분류코드
order by 중분류코드;

SELECT 중분류코드, sum(구매금액)
FROM MAKET_D
where year = 2015
GROUP BY 중분류코드
order by 중분류코드;


SELECT 중분류코드, COUNT(DISTINCT(영수증번호))
FROM MAKET_D
where year = 2015
GROUP BY 중분류코드
order by 중분류코드;

SELECT m.대분류코드, sum(구매금액)
from maket_d m
full outer join custdemo c on m.고객번호 = c.고객번호
where 성별 = 'M'
group by m.대분류코드
order by 대분류코드;
--고객별 뷰 생성
고객번호, 구매일자
--멤버십
SELECT m.고객번호,c.멤버십명  from maket_d m
left join membership c on m.고객번호 = c.고객번호;
group by m.고객번호;


SELECT m.고객번호, COUNT(DISTINCT(c.멤버십명))  from maket_d m
left join membership c on m.고객번호 = c.고객번호
group by m.고객번호;

--
drop view a;

create view a as
SELECT m.고객번호, COUNT(DISTINCT(c.멤버십명))멤버십수 
from maket_d m
left join membership c on m.고객번호 = c.고객번호
group by m.고객번호;

select count(고객번호) from a
WHERE 멤버십수 = 4;

SELECT * from COMPET
WHERE 제휴사 = 'D';

CREATE VIEW B AS
SELECT 고객번호,COUNT(이용년월)이용횟수
from COMPET
WHERE 제휴사 = 'D'
GROUP BY 고객번호;

select count(고객번호) from B
WHERE 이용횟수 >=10;

SELECT * FROM CHANNEL
WHERE 제휴사 LIKE 'D%';

CREATE VIEW C AS
SELECT C.고객번호,C.제휴사,C.이용횟수,CU.성별, cu."연령대" FROM CHANNEL C
JOIN CUSTDEMO CU ON CU.고객번호 = C.고객번호 
WHERE 제휴사 LIKE 'D%';

SELECT * FROM C;
WHERE "이용횟수" >= 10;
WHERE "이용횟수" BETWEEN 7 AND 9;



SELECT * from maket_d m
left join COMPET c on m.고객번호 = c.고객번호
WHERE c.제휴사 = 'D';
group by m.고객번호;

SELECT * from maket_d;
SELECT 대분류코드 , SUM(구매금액) from maket_d
WHERE YEAR = 2014 AND 월 BETWEEN 7 AND 12
GROUP BY 대분류코드
ORDER BY 대분류코드;

SELECT * from maket_d;
SELECT SUM(구매금액) from maket_d
where 제휴사 = 'D' and 소분류코드 between 'D010101' and 'D020504'
or 제휴사 = 'D' and 소분류코드 between 'D030201'  and 'D050205'
or 제휴사 = 'D' and 소분류코드 between 'D060101'  and 'D060501'
or 제휴사 = 'D' and 소분류코드 between 'D070101'  and 'D080401';
GROUP BY 소분류코드; -- 9

SELECT SUM(구매금액) from


from maket_d m
left join membership c on m.고객번호 = c.고객번호

FROM employees;


SELECT COUNT(DISTINCT(영수증번호)) FROM purprod;

SELECT * FROM PURPROD;
SELECT * FROM compet;
SELECT * FROM custdemo;
SELECT 연령대,count(고객번호) 
FROM custdemo
group by 연령대;
SELECT * FROM membership;

SELECT * FROM PURPROD
where 제휴사 like '%B';


select * 
from purprod p
join custdemo c on p.고객번호 = c.고객번호 ;

select c.연령대 ,sum(p.구매금액)총금액,count(distinct(영수증번호))건수
from purprod p
join custdemo c on p.고객번호 = c.고객번호 
where year like '%2014'
group by 연령대;

select c.연령대 ,sum(p.구매금액)총금액,count(distinct(영수증번호))건수
from purprod p
join custdemo c on p.고객번호 = c.고객번호 
where year like '%2015'
group by 연령대;

SELECT 중분류코드, sum(구매금액)총금액 FROM PURPROD
where 제휴사 like '%B'
group by 중분류코드
order by 중분류코드 asc;

select 월 ,sum(p.구매금액)총금액
from purprod p
join custdemo c on p.고객번호 = c.고객번호 
where 제휴사 like '%B' and year like '%2015'
group by 월
order by 월 asc;

--거주지역 점포코드 join
select 점포코드 ,sum(p.구매금액)총금액, trunc(avg(p.구매금액))평균금액
from purprod p
join custdemo c on p.점포코드 = c.거주지역 
where 제휴사 like '%B' 
group by 점포코드
order by 총금액 desc;

--고객별 제휴사B에서 구매한 2014,2015별 구매데이터 정리
SELECT 대분류코드, sum(구매금액)총금액, trunc(avg(구매금액))평균금액 
FROM MAKET_B
GROUP BY 대분류코드
ORDER BY 평균금액 DESC;


SELECT 대분류코드, COUNT(DISTINCT 영수증번호) 구매건수 
FROM MAKET_B
GROUP BY 대분류코드
ORDER BY 구매건수 DESC;

INSERT 
  INTO MAKET_B
SELECT *
  FROM PURPROD
 WHERE 제휴사 LIKE '%B';  

CREATE TABLE MAKET_B AS
SELECT * FROM PURPROD
WHERE 제휴사 LIKE '%B';


select c.연령대 ,sum(p.구매금액)총금액,TRUNC(AVG(구매금액)) 평균금액 ,count(distinct(영수증번호))건수
from MAKET_B p
join custdemo c on p.고객번호 = c.고객번호 
where year like '%2014'
group by 연령대
ORDER BY 연령대 ASC;

select 고객번호 , 
from MAKET_B p
join custdemo c on p.고객번호 = c.고객번호 
where year like '%2014'
group by 연령대
ORDER BY 연령대 ASC;

SELECT 고객번호, SUM(구매금액)
--OVER(PARTITION BY 고객번호 ORDER BY 고객번호 ASC)
FROM MAKET_B
WHERE YEAR LIKE '%2014'
GROUP BY 고객번호 ;

alter table purprod add year number;
update purprod set year = substr(구매일자,1,4);
commit;
SELECT * FROM MAKET_B;


CREATE TABLE COUSTVS AS
SELECT 고객번호  FROM PURPROD
WHERE 제휴사 LIKE '%B';

--JOIN을 사용해서 고객데이터-구매내역


select 고객번호, c.연령대, c."성별", SUM(구매금액) OVER(PARTITION BY 고객번호 
ORDER BY 고객번호 ASC)
from MAKET_B p
join custdemo c on p.고객번호 = c.고객번호 
where year like '%2014';

ORDER BY 연령대 ASC;
--고객별로 2014 2015 사용금액
CREATE VIEW cs2014
As SELECT 고객번호, SUM(구매금액) as 구매금액14
FROM MAKET_B
WHERE YEAR LIKE '%2014'
GROUP BY 고객번호 ;


CREATE VIEW cs2015
As SELECT 고객번호, SUM(구매금액) as  구매금액15
FROM MAKET_B
WHERE YEAR LIKE '%2015'
GROUP BY 고객번호 ;

select * from cs2014;
select * from cs2015;

SELECT *
FROM cs2014 c4
join cs2015 c5 on c5.고객번호 = c4.고객번호;

SELECT *
FROM cs2014 c4
join cs2015 c5 on c5.고객번호 = c4.고객번호;

--
select c.연령대,  SUM(구매금액)총매출
from MAKET_B p
join custdemo c on p.고객번호 = c.고객번호 
where year like '%2014'
group by c.연령대
order by c.연령대 asc;
--
select 구매시간,  SUM(구매금액)총매출
from MAKET_B
where year like '%2014'
group by 구매시간
order by 구매시간 asc;

--
select c.성별,  SUM(구매금액)총매출
from MAKET_B p
join custdemo c on p.고객번호 = c.고객번호 
where year like '%2015'
group by c.성별;
--order by c.연령대 asc;


DROP VIEW cs2014;
DROP VIEW cs2015;
--20220226


--구매이력 고객별로 정리
select *  from purprod;
select * from amt_14;
order by 고객번호;

--amt14,amt15 증감
CREATE TABLE AMT_YEAR_FOJ AS 
SELECT A4.고객번호, A4.제휴사, A4.구매금액14 구매14, A5.고객번호 고객번호15, A5.제휴사 제휴사15 , A5.구매금액15 구매15
FROM AMT_14 A4 
FULL OUTER JOIN AMT_15 A5 ON (A4.고객번호=A5.고객번호 AND A4.제휴사=A5.제휴사);
--확인하는법
SELECT COALESCE(고객번호,고객번호15),COALESCE(제휴사,제휴사15),구매14,구매15 FROM AMT_YEAR_FOJ
WHERE 구매15 IS NULL;

--amt14,amt15 증감
CREATE TABLE AMT_YEAR_PM AS
SELECT COALESCE(고객번호,고객번호15)고객번호,COALESCE(제휴사,제휴사15)제휴사, NVL(구매14,0) 구매14, NVL(구매15,0) 구매15,
(NVL(구매15,0)-NVL(구매14,0)) 증감
FROM AMT_YEAR_FOJ A
order by 고객번호;

--고객 데이터랑 조인
SELECT * FROM AMT_YEAR_PM;
SELECT * FROM CUSTDEMO;
SELECT * FROM ALL_PM;
--고객 데이터랑 조인
DROP VIEW ALL_PM;
CREATE VIEW ALL_PM AS
SELECT A.고객번호,C.성별,C.연령대, A.제휴사, A.구매14, A.구매15,A.증감
FROM AMT_YEAR_PM A 
FULL OUTER JOIN CUSTDEMO C
ON (A.고객번호=C.고객번호);
--연령대별 감소액
SELECT 연령대 , COUNT(증감), SUM(증감) 총감소액
FROM ALL_PM
WHERE 증감 <0
GROUP BY 연령대
ORDER BY 총감소액;
--연령대별 증가액
SELECT 연령대 , COUNT(증감), SUM(증감) 총증가액
FROM ALL_PM
WHERE 증감>0
GROUP BY 연령대
ORDER BY 총증가액 DESC;

SELECT COUNT(*) FROM CUSTDEMO
WHERE 연령대 is null;

SELECT * FROM ALL_PM
WHERE 연령대 is null;

SELECT 대분류코드,SUM(구매금액) 제품별매출 FROM PURPROD
WHERE 제휴사 = 'B' AND YEAR ='2014'
GROUP BY 대분류코드
ORDER BY 제품별매출 DESC;
SELECT * FROM PURPROD;

CREATE VIEW DCL14 AS
SELECT 고객번호 고객번호14, 대분류코드 대분류코드14,SUM(구매금액)구매가격14 FROM PURPROD
WHERE 제휴사 = 'B' AND YEAR ='2014'
GROUP BY 고객번호,대분류코드
ORDER BY 고객번호;
SELECT * FROM DCL14;

CREATE VIEW DCL15 AS
SELECT 고객번호 고객번호15, 대분류코드 대분류코드15,SUM(구매금액)구매가격15 FROM PURPROD
WHERE 제휴사 = 'B' AND YEAR ='2015'
GROUP BY 고객번호,대분류코드
ORDER BY 고객번호;
SELECT * FROM DCL15;

--구매가격 14,15 정리

--제휴사B의 대분류코드별 매출-2014
CREATE TABLE PROPRI14 AS
SELECT 대분류코드,SUM(구매금액) 제품별매출 FROM PURPROD
WHERE 제휴사 = 'B' AND YEAR ='2014'
GROUP BY 대분류코드
ORDER BY 제품별매출 DESC;
--제휴사B의 대분류코드별 매출-2015
CREATE TABLE PROPRI15 AS
SELECT 대분류코드,SUM(구매금액) 제품별매출 FROM PURPROD
WHERE 제휴사 = 'B' AND YEAR ='2015'
GROUP BY 대분류코드
ORDER BY 제품별매출 DESC;
SELECT * FROM PURPROD;
--바뀐데이터 합
SELECT 대분류코드,SUM(제품별매출)  FROM PROPRI14
GROUP BY 대분류코드;
SELECT 대분류코드,SUM(제품별매출)  FROM PROPRI15
GROUP BY 대분류코드;

ORDER BY 제품별매출 DESC;
SELECT * FROM PURPROD;
SELECT * FROM COMPET;

--구매 상하반기로 나누기(상반기1~6,하반기7~12)
CREATE VIEW SEA141 AS
SELECT 고객번호, COUNT(DISTINCT 영수증번호) 구매횟수, SUM(구매금액) 구매금액
FROM PURPROD
WHERE 구매일자 < 20140701
GROUP BY 고객번호;
DROP VIEW SEA141;

CREATE VIEW SEA142 AS
SELECT 고객번호, COUNT(DISTINCT 영수증번호) 구매횟수, SUM(구매금액) 구매금액
FROM PURPROD
WHERE 구매일자 >= 20140701 AND 구매일자 < 20150101
GROUP BY 고객번호;
DROP VIEW SEA142;

CREATE VIEW SEA151 AS
SELECT 고객번호, COUNT(DISTINCT 영수증번호) 구매횟수, SUM(구매금액) 구매금액
FROM PURPROD
WHERE 구매일자 >= 20150101 AND 구매일자 < 20150701
GROUP BY 고객번호;
DROP VIEW SEA151;

CREATE VIEW SEA152 AS
SELECT 고객번호, COUNT(DISTINCT 영수증번호) 구매횟수, SUM(구매금액) 구매금액
FROM PURPROD
WHERE 구매일자 >= 20150701 AND 구매일자 < 20160101
GROUP BY 고객번호;
DROP VIEW SEA152;

CREATE TABLE SEA14 AS
SELECT A1.고객번호 고객번호141, A1.구매횟수 구매횟수141,A1.구매금액 구매금액141, A2.고객번호 고객번호142, A2.구매횟수 구매횟수142, A2.구매금액 구매금액142
FROM SEA141 A1 
FULL OUTER JOIN SEA142 A2 ON (A1.고객번호=A2.고객번호);
DROP TABLE SEA14;
CREATE TABLE CUST_CA AS
SELECT COALESCE(고객번호141,고객번호142)고객번호, NVL(구매횟수141,0) 상반기구매회수14 ,NVL(구매금액141,0) 상반기구매금액14,NVL(구매횟수142,0) 하반기구매회수14,NVL(구매금액142,0) 하반기구매금액14
FROM SEA14
order by 고객번호;
DROP TABLE CUST_CA;
CREATE TABLE SEA15 AS
SELECT A1.고객번호 고객번호151, A1.구매횟수 구매횟수151,A1.구매금액 구매금액151, A2.고객번호 고객번호152, A2.구매횟수 구매횟수152, A2.구매금액 구매금액152
FROM SEA151 A1 
FULL OUTER JOIN SEA152 A2 ON (A1.고객번호=A2.고객번호);
DROP TABLE SEA15;
CREATE TABLE CUST_CAA AS
SELECT COALESCE(고객번호151,고객번호152)고객번호, NVL(구매횟수151,0) 상반기구매회수15 ,NVL(구매금액151,0) 상반기구매금액15,NVL(구매횟수152,0) 하반기구매회수15,NVL(구매금액152,0) 하반기구매금액15
FROM SEA15
order by 고객번호;
DROP TABLE NEW_1;
SELECT * FROM CUST_CA;
SELECT * FROM CUST_CAA;

CREATE TABLE NEW_1 AS
SELECT A1.고객번호, A1.상반기구매회수14, A1.상반기구매금액14, A1.하반기구매회수14, A1.하반기구매금액14, A2.고객번호 고객번호15, A2.상반기구매회수15, A2.상반기구매금액15, A2.하반기구매회수15, A2.하반기구매금액15
FROM CUST_CA A1 
FULL OUTER JOIN CUST_CAA A2 ON (A1.고객번호=A2.고객번호);

CREATE TABLE CUST_QUA AS
SELECT COALESCE(고객번호,고객번호15)고객번호,상반기구매회수14,상반기구매금액14,하반기구매회수14,하반기구매금액14,상반기구매회수15,상반기구매금액15,하반기구매회수15,하반기구매금액15
FROM NEW_1
order by 고객번호;


update CUST_QUA set 하반기구매회수14 = 0
where 하반기구매회수14 IS NULL;

SELECT * FROM CUST_QUA;
SELECT COUNT(*) FROM CUST_QUA;
SELECT * FROM CUST_QUA
WHERE 하반기구매회수14 = 0;

SELECT MAX(상반기구매회수14),MIN(상반기구매회수14),ROUND(AVG(상반기구매회수14),2) FROM CUST_QUA;
SELECT MAX(상반기구매금액14),MIN(상반기구매금액14),ROUND(AVG(상반기구매금액14),2) FROM CUST_QUA;
SELECT MAX(하반기구매회수14),MIN(하반기구매회수14),ROUND(AVG(하반기구매회수14),2) FROM CUST_QUA;
SELECT MAX(하반기구매금액14),MIN(하반기구매금액14),ROUND(AVG(하반기구매금액14),2) FROM CUST_QUA;

SELECT MAX(상반기구매회수15),MIN(상반기구매회수15),ROUND(AVG(상반기구매회수15),2) FROM CUST_QUA;
SELECT MAX(상반기구매금액15),MIN(상반기구매금액15),ROUND(AVG(상반기구매금액15),2) FROM CUST_QUA;
SELECT MAX(하반기구매회수15),MIN(하반기구매회수15),ROUND(AVG(하반기구매회수15),2) FROM CUST_QUA;
SELECT MAX(하반기구매금액15),MIN(하반기구매금액15),ROUND(AVG(하반기구매금액15),2) FROM CUST_QUA;
--히스토그램 돌려서 등급 구해보
select count(*) from cust_qua
where 상반기구매금액14 < 5000000;
select count(*) from cust_qua
where 상반기구매금액14 > 5000000 and 상반기구매금액14 < 10000000;
select count(*) from cust_qua
where 상반기구매금액14 > 10000000 and 상반기구매금액14 < 20000000;
select count(*) from cust_qua
where 상반기구매금액14 > 20000000;

select count(*) from cust_qua
where 하반기구매금액14 < 5000000;
select count(*) from cust_qua
where 하반기구매금액14 > 5000000 and 상반기구매금액14 < 10000000;
select count(*) from cust_qua
where 하반기구매금액14 > 10000000 and 상반기구매금액14 < 20000000;
select count(*) from cust_qua
where 하반기구매금액14 > 20000000;


CREATE TABLE NEWCUST AS
select 고객번호,
CASE WHEN 상반기구매금액14 <= 2500000 THEN '1'
WHEN (상반기구매금액14 > 2500000 and 상반기구매금액14 <= 4000000) THEN '2'
WHEN  (상반기구매금액14 > 4000000 and 상반기구매금액14 <= 9000000) THEN '3'
WHEN 상반기구매금액14 > 9000000 THEN '4'
else '0' END AS 상반기등급14,
CASE WHEN 하반기구매금액14 <= 2500000 THEN '1'
WHEN (하반기구매금액14 > 2500000 and 하반기구매금액14 <= 4000000) THEN '2'
WHEN  (하반기구매금액14 > 4000000 and 하반기구매금액14 <= 9000000) THEN '3'
WHEN 하반기구매금액14 > 9000000 THEN '4'
else '0' END AS 하반기등급14,
CASE WHEN 상반기구매금액15 <= 2500000 THEN '1'
WHEN (상반기구매금액15 > 2500000 and 상반기구매금액15 <= 4000000) THEN '2'
WHEN  (상반기구매금액15 > 4000000 and 상반기구매금액15 <= 9000000) THEN '3'
WHEN 상반기구매금액15 > 9000000 THEN '4'
else '0' END AS 상반기등급15,
CASE WHEN 하반기구매금액15 <= 2500000 THEN '1'
WHEN (하반기구매금액15 > 2500000 and 하반기구매금액15 <= 4000000) THEN '2'
WHEN  (하반기구매금액15 > 4000000 and 하반기구매금액15 <= 9000000) THEN '3'
WHEN 하반기구매금액15 >= 9000000 THEN '4'
else '0' END AS 하반기등급15
from cust_qua;

SELECT * FROM NEWCUST;


CREATE TABLE NEWCUSTB AS
select 고객번호,
CASE WHEN 상반기구매회수14 <= 100 THEN '1'
WHEN (상반기구매회수14 > 100 and 상반기구매회수14 <= 150) THEN '2'
WHEN  (상반기구매회수14 > 150 and 상반기구매회수14 <= 200) THEN '3'
WHEN 상반기구매회수14 > 200 THEN '4'
else '0' END AS 상반기구매빈도14,
CASE WHEN 하반기구매회수14 <= 100 THEN '1'
WHEN (하반기구매회수14 > 100 and 하반기구매회수14 <= 150) THEN '2'
WHEN  (하반기구매회수14 > 150 and 하반기구매회수14 <= 200) THEN '3'
WHEN 하반기구매회수14 > 200 THEN '4'
else '0' END AS 하반기구매빈도14,
CASE WHEN 상반기구매회수15 <= 100 THEN '1'
WHEN (상반기구매회수15 > 100 and 상반기구매회수15 <= 150) THEN '2'
WHEN  (상반기구매회수15 > 150 and 상반기구매회수15 <= 200) THEN '3'
WHEN 상반기구매회수15 > 200 THEN '4'
else '0' END AS 상반기구매빈도15,
CASE WHEN 하반기구매회수15 <= 100 THEN '1'
WHEN (하반기구매회수15 > 100 and 하반기구매회수15 <= 150) THEN '2'
WHEN  (하반기구매회수15 > 150 and 하반기구매회수15 <= 200) THEN '3'
WHEN 하반기구매회수15 > 200 THEN '4'
else '0' END AS 하반기구매빈도15
from cust_qua;

SELECT * FROM NEWCUST;
SELECT * FROM NEW_CUST_B;

CREATE TABLE SSUM AS
SELECT A.고객번호,A.상반기등급14,A.하반기등급14,A.상반기등급15,A.하반기등급15,A2.상반기구매빈도14,A2.하반기구매빈도14,A2.상반기구매빈도15,A2.하반기구매빈도15
FROM NEW_CUST A
FULL OUTER JOIN NEW_CUST_B A2 ON A.고객번호 = a2.고객번호;

SELECT 구매시간 , SUM(구매금액) FROM PURPROD
GROUP BY 구매시간
ORDER BY 구매시간;

SELECT C.연령대 , SUM(구매금액)
FROM PURPROD P
FULL OUTER JOIN CUSTDEMO C ON P.고객번호 = C.고객번호
GROUP BY C.연령대
ORDER BY C.연령대;

SELECT C.성별 , SUM(구매금액)
FROM PURPROD P
FULL OUTER JOIN CUSTDEMO C ON P.고객번호 = C.고객번호
GROUP BY C.성별
ORDER BY C.성별;


SELECT * FROM PURPROD;
SELECT * FROM PRODCL;

SELECT P.대분류코드 , SUM(구매금액)
FROM PURPROD P
FULL OUTER JOIN PRODCL C ON P.대분류코드 = C.대분류코드 AND P.제휴사 = C.제휴사
WHERE P.제휴사 LIKE '%D' AND YEAR = '2015'
GROUP BY P.대분류코드;
ORDER BY P.대분류코드;

SELECT 대분류코드, SUM(구매금액)
FROM MAKET_B
WHERE YEAR = '2015'
GROUP BY 대분류코드;