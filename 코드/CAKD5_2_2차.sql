SELECT * FROM PURPROD;
SELECT * FROM prodcl;
SELECT * FROM channel;    --�ǹ̰� ���� �ƹ������� �ȳ���
SELECT * FROM compet;     --����縦 �̿��� ������ ����
SELECT * FROM custdemo;     
SELECT * FROM membership;       

-- ������ ����
SELECT YEAR ,SUM(���űݾ�) ,AVG(���űݾ�)
FROM PURPROD
GROUP BY YEAR;

--D�̿�� ���̺� ����
SELECT * FROM PURPROD;
CREATE TABLE MAKET_D AS
SELECT * FROM PURPROD
WHERE ���޻� = 'D';

-- D���޻� ����
SELECT ����ȣ,COUNT(DISTINCT(��������ȣ))
FROM MAKET_D
GROUP BY ����ȣ;


--
SELECT * from maket_d m
full outer join custdemo c on m.����ȣ = c.����ȣ;

drop view a;

create view a as
SELECT m.����ȣ, sum(m.���űݾ�)�ѼҺ�,COUNT(DISTINCT(m.��������ȣ))�Һ�Ǽ�
from maket_d m
full outer join custdemo c on m.����ȣ = c.����ȣ
group by m.����ȣ;

SELECT ����, sum(�ѼҺ�),sum(�Һ�Ǽ�)
from custdemo c
join a  on a.����ȣ = c.����ȣ
group by ����;

SELECT ���ɴ�, sum(�ѼҺ�),sum(�Һ�Ǽ�)
from custdemo c
join a  on a.����ȣ = c.����ȣ
group by ���ɴ�
order by ���ɴ� ;

SELECT ��������, sum(�ѼҺ�),sum(�Һ�Ǽ�)
from custdemo c
join a  on a.����ȣ = c.����ȣ
group by ��������
order by �������� ;

--��з��ڵ庰 �ݾ�
SELECT ��з��ڵ�, sum(���űݾ�)
FROM MAKET_D
GROUP BY ��з��ڵ�
order by ��з��ڵ�;

SELECT ��з��ڵ�, COUNT(DISTINCT(��������ȣ))
FROM MAKET_D
GROUP BY ��з��ڵ�
order by ��з��ڵ�;

SELECT ��з��ڵ�, sum(���űݾ�)
FROM MAKET_D
where year = 2015
GROUP BY ��з��ڵ�
order by ��з��ڵ�;


SELECT ��з��ڵ�, COUNT(DISTINCT(��������ȣ))
FROM MAKET_D
where year = 2015
GROUP BY ��з��ڵ�
order by ��з��ڵ�;

SELECT m.��з��ڵ�, sum(���űݾ�)
from maket_d m
full outer join custdemo c on m.����ȣ = c.����ȣ
where ���� = 'M'
group by m.��з��ڵ�
order by ��з��ڵ�;

--��з��ڵ庰 �ݾ�
SELECT ��з��ڵ�, sum(���űݾ�)
FROM MAKET_D
GROUP BY ��з��ڵ�
order by ��з��ڵ�;

SELECT ��з��ڵ�, COUNT(DISTINCT(��������ȣ))
FROM MAKET_D
GROUP BY ��з��ڵ�
order by ��з��ڵ�;

SELECT ��з��ڵ�, sum(���űݾ�)
FROM MAKET_D
where year = 2015
GROUP BY ��з��ڵ�
order by ��з��ڵ�;


SELECT ��з��ڵ�, COUNT(DISTINCT(��������ȣ))
FROM MAKET_D
where year = 2015
GROUP BY ��з��ڵ�
order by ��з��ڵ�;

SELECT m.��з��ڵ�, sum(���űݾ�)
from maket_d m
full outer join custdemo c on m.����ȣ = c.����ȣ
where ���� = 'M'
group by m.��з��ڵ�
order by ��з��ڵ�;

--�ߺз��ڵ庰 �ݾ�
SELECT �ߺз��ڵ�, sum(���űݾ�)
FROM MAKET_D
GROUP BY �ߺз��ڵ�
order by �ߺз��ڵ�;

SELECT �ߺз��ڵ�, COUNT(DISTINCT(��������ȣ))
FROM MAKET_D
GROUP BY �ߺз��ڵ�
order by �ߺз��ڵ�;

SELECT �ߺз��ڵ�, sum(���űݾ�)
FROM MAKET_D
where year = 2015
GROUP BY �ߺз��ڵ�
order by �ߺз��ڵ�;


SELECT �ߺз��ڵ�, COUNT(DISTINCT(��������ȣ))
FROM MAKET_D
where year = 2015
GROUP BY �ߺз��ڵ�
order by �ߺз��ڵ�;

SELECT m.��з��ڵ�, sum(���űݾ�)
from maket_d m
full outer join custdemo c on m.����ȣ = c.����ȣ
where ���� = 'M'
group by m.��з��ڵ�
order by ��з��ڵ�;
--���� �� ����
����ȣ, ��������
--�����
SELECT m.����ȣ,c.����ʸ�  from maket_d m
left join membership c on m.����ȣ = c.����ȣ;
group by m.����ȣ;


SELECT m.����ȣ, COUNT(DISTINCT(c.����ʸ�))  from maket_d m
left join membership c on m.����ȣ = c.����ȣ
group by m.����ȣ;

--
drop view a;

create view a as
SELECT m.����ȣ, COUNT(DISTINCT(c.����ʸ�))����ʼ� 
from maket_d m
left join membership c on m.����ȣ = c.����ȣ
group by m.����ȣ;

select count(����ȣ) from a
WHERE ����ʼ� = 4;

SELECT * from COMPET
WHERE ���޻� = 'D';

CREATE VIEW B AS
SELECT ����ȣ,COUNT(�̿���)�̿�Ƚ��
from COMPET
WHERE ���޻� = 'D'
GROUP BY ����ȣ;

select count(����ȣ) from B
WHERE �̿�Ƚ�� >=10;

SELECT * FROM CHANNEL
WHERE ���޻� LIKE 'D%';

CREATE VIEW C AS
SELECT C.����ȣ,C.���޻�,C.�̿�Ƚ��,CU.����, cu."���ɴ�" FROM CHANNEL C
JOIN CUSTDEMO CU ON CU.����ȣ = C.����ȣ 
WHERE ���޻� LIKE 'D%';

SELECT * FROM C;
WHERE "�̿�Ƚ��" >= 10;
WHERE "�̿�Ƚ��" BETWEEN 7 AND 9;



SELECT * from maket_d m
left join COMPET c on m.����ȣ = c.����ȣ
WHERE c.���޻� = 'D';
group by m.����ȣ;

SELECT * from maket_d;
SELECT ��з��ڵ� , SUM(���űݾ�) from maket_d
WHERE YEAR = 2014 AND �� BETWEEN 7 AND 12
GROUP BY ��з��ڵ�
ORDER BY ��з��ڵ�;

SELECT * from maket_d;
SELECT SUM(���űݾ�) from maket_d
where ���޻� = 'D' and �Һз��ڵ� between 'D010101' and 'D020504'
or ���޻� = 'D' and �Һз��ڵ� between 'D030201'  and 'D050205'
or ���޻� = 'D' and �Һз��ڵ� between 'D060101'  and 'D060501'
or ���޻� = 'D' and �Һз��ڵ� between 'D070101'  and 'D080401';
GROUP BY �Һз��ڵ�; -- 9

SELECT SUM(���űݾ�) from


from maket_d m
left join membership c on m.����ȣ = c.����ȣ

FROM employees;


SELECT COUNT(DISTINCT(��������ȣ)) FROM purprod;

SELECT * FROM PURPROD;
SELECT * FROM compet;
SELECT * FROM custdemo;
SELECT ���ɴ�,count(����ȣ) 
FROM custdemo
group by ���ɴ�;
SELECT * FROM membership;

SELECT * FROM PURPROD
where ���޻� like '%B';


select * 
from purprod p
join custdemo c on p.����ȣ = c.����ȣ ;

select c.���ɴ� ,sum(p.���űݾ�)�ѱݾ�,count(distinct(��������ȣ))�Ǽ�
from purprod p
join custdemo c on p.����ȣ = c.����ȣ 
where year like '%2014'
group by ���ɴ�;

select c.���ɴ� ,sum(p.���űݾ�)�ѱݾ�,count(distinct(��������ȣ))�Ǽ�
from purprod p
join custdemo c on p.����ȣ = c.����ȣ 
where year like '%2015'
group by ���ɴ�;

SELECT �ߺз��ڵ�, sum(���űݾ�)�ѱݾ� FROM PURPROD
where ���޻� like '%B'
group by �ߺз��ڵ�
order by �ߺз��ڵ� asc;

select �� ,sum(p.���űݾ�)�ѱݾ�
from purprod p
join custdemo c on p.����ȣ = c.����ȣ 
where ���޻� like '%B' and year like '%2015'
group by ��
order by �� asc;

--�������� �����ڵ� join
select �����ڵ� ,sum(p.���űݾ�)�ѱݾ�, trunc(avg(p.���űݾ�))��ձݾ�
from purprod p
join custdemo c on p.�����ڵ� = c.�������� 
where ���޻� like '%B' 
group by �����ڵ�
order by �ѱݾ� desc;

--���� ���޻�B���� ������ 2014,2015�� ���ŵ����� ����
SELECT ��з��ڵ�, sum(���űݾ�)�ѱݾ�, trunc(avg(���űݾ�))��ձݾ� 
FROM MAKET_B
GROUP BY ��з��ڵ�
ORDER BY ��ձݾ� DESC;


SELECT ��з��ڵ�, COUNT(DISTINCT ��������ȣ) ���ŰǼ� 
FROM MAKET_B
GROUP BY ��з��ڵ�
ORDER BY ���ŰǼ� DESC;

INSERT 
  INTO MAKET_B
SELECT *
  FROM PURPROD
 WHERE ���޻� LIKE '%B';  

CREATE TABLE MAKET_B AS
SELECT * FROM PURPROD
WHERE ���޻� LIKE '%B';


select c.���ɴ� ,sum(p.���űݾ�)�ѱݾ�,TRUNC(AVG(���űݾ�)) ��ձݾ� ,count(distinct(��������ȣ))�Ǽ�
from MAKET_B p
join custdemo c on p.����ȣ = c.����ȣ 
where year like '%2014'
group by ���ɴ�
ORDER BY ���ɴ� ASC;

select ����ȣ , 
from MAKET_B p
join custdemo c on p.����ȣ = c.����ȣ 
where year like '%2014'
group by ���ɴ�
ORDER BY ���ɴ� ASC;

SELECT ����ȣ, SUM(���űݾ�)
--OVER(PARTITION BY ����ȣ ORDER BY ����ȣ ASC)
FROM MAKET_B
WHERE YEAR LIKE '%2014'
GROUP BY ����ȣ ;

alter table purprod add year number;
update purprod set year = substr(��������,1,4);
commit;
SELECT * FROM MAKET_B;


CREATE TABLE COUSTVS AS
SELECT ����ȣ  FROM PURPROD
WHERE ���޻� LIKE '%B';

--JOIN�� ����ؼ� ��������-���ų���


select ����ȣ, c.���ɴ�, c."����", SUM(���űݾ�) OVER(PARTITION BY ����ȣ 
ORDER BY ����ȣ ASC)
from MAKET_B p
join custdemo c on p.����ȣ = c.����ȣ 
where year like '%2014';

ORDER BY ���ɴ� ASC;
--������ 2014 2015 ���ݾ�
CREATE VIEW cs2014
As SELECT ����ȣ, SUM(���űݾ�) as ���űݾ�14
FROM MAKET_B
WHERE YEAR LIKE '%2014'
GROUP BY ����ȣ ;


CREATE VIEW cs2015
As SELECT ����ȣ, SUM(���űݾ�) as  ���űݾ�15
FROM MAKET_B
WHERE YEAR LIKE '%2015'
GROUP BY ����ȣ ;

select * from cs2014;
select * from cs2015;

SELECT *
FROM cs2014 c4
join cs2015 c5 on c5.����ȣ = c4.����ȣ;

SELECT *
FROM cs2014 c4
join cs2015 c5 on c5.����ȣ = c4.����ȣ;

--
select c.���ɴ�,  SUM(���űݾ�)�Ѹ���
from MAKET_B p
join custdemo c on p.����ȣ = c.����ȣ 
where year like '%2014'
group by c.���ɴ�
order by c.���ɴ� asc;
--
select ���Žð�,  SUM(���űݾ�)�Ѹ���
from MAKET_B
where year like '%2014'
group by ���Žð�
order by ���Žð� asc;

--
select c.����,  SUM(���űݾ�)�Ѹ���
from MAKET_B p
join custdemo c on p.����ȣ = c.����ȣ 
where year like '%2015'
group by c.����;
--order by c.���ɴ� asc;


DROP VIEW cs2014;
DROP VIEW cs2015;
--20220226


--�����̷� ������ ����
select *  from purprod;
select * from amt_14;
order by ����ȣ;

--amt14,amt15 ����
CREATE TABLE AMT_YEAR_FOJ AS 
SELECT A4.����ȣ, A4.���޻�, A4.���űݾ�14 ����14, A5.����ȣ ����ȣ15, A5.���޻� ���޻�15 , A5.���űݾ�15 ����15
FROM AMT_14 A4 
FULL OUTER JOIN AMT_15 A5 ON (A4.����ȣ=A5.����ȣ AND A4.���޻�=A5.���޻�);
--Ȯ���ϴ¹�
SELECT COALESCE(����ȣ,����ȣ15),COALESCE(���޻�,���޻�15),����14,����15 FROM AMT_YEAR_FOJ
WHERE ����15 IS NULL;

--amt14,amt15 ����
CREATE TABLE AMT_YEAR_PM AS
SELECT COALESCE(����ȣ,����ȣ15)����ȣ,COALESCE(���޻�,���޻�15)���޻�, NVL(����14,0) ����14, NVL(����15,0) ����15,
(NVL(����15,0)-NVL(����14,0)) ����
FROM AMT_YEAR_FOJ A
order by ����ȣ;

--�� �����Ͷ� ����
SELECT * FROM AMT_YEAR_PM;
SELECT * FROM CUSTDEMO;
SELECT * FROM ALL_PM;
--�� �����Ͷ� ����
DROP VIEW ALL_PM;
CREATE VIEW ALL_PM AS
SELECT A.����ȣ,C.����,C.���ɴ�, A.���޻�, A.����14, A.����15,A.����
FROM AMT_YEAR_PM A 
FULL OUTER JOIN CUSTDEMO C
ON (A.����ȣ=C.����ȣ);
--���ɴ뺰 ���Ҿ�
SELECT ���ɴ� , COUNT(����), SUM(����) �Ѱ��Ҿ�
FROM ALL_PM
WHERE ���� <0
GROUP BY ���ɴ�
ORDER BY �Ѱ��Ҿ�;
--���ɴ뺰 ������
SELECT ���ɴ� , COUNT(����), SUM(����) ��������
FROM ALL_PM
WHERE ����>0
GROUP BY ���ɴ�
ORDER BY �������� DESC;

SELECT COUNT(*) FROM CUSTDEMO
WHERE ���ɴ� is null;

SELECT * FROM ALL_PM
WHERE ���ɴ� is null;

SELECT ��з��ڵ�,SUM(���űݾ�) ��ǰ������ FROM PURPROD
WHERE ���޻� = 'B' AND YEAR ='2014'
GROUP BY ��з��ڵ�
ORDER BY ��ǰ������ DESC;
SELECT * FROM PURPROD;

CREATE VIEW DCL14 AS
SELECT ����ȣ ����ȣ14, ��з��ڵ� ��з��ڵ�14,SUM(���űݾ�)���Ű���14 FROM PURPROD
WHERE ���޻� = 'B' AND YEAR ='2014'
GROUP BY ����ȣ,��з��ڵ�
ORDER BY ����ȣ;
SELECT * FROM DCL14;

CREATE VIEW DCL15 AS
SELECT ����ȣ ����ȣ15, ��з��ڵ� ��з��ڵ�15,SUM(���űݾ�)���Ű���15 FROM PURPROD
WHERE ���޻� = 'B' AND YEAR ='2015'
GROUP BY ����ȣ,��з��ڵ�
ORDER BY ����ȣ;
SELECT * FROM DCL15;

--���Ű��� 14,15 ����

--���޻�B�� ��з��ڵ庰 ����-2014
CREATE TABLE PROPRI14 AS
SELECT ��з��ڵ�,SUM(���űݾ�) ��ǰ������ FROM PURPROD
WHERE ���޻� = 'B' AND YEAR ='2014'
GROUP BY ��з��ڵ�
ORDER BY ��ǰ������ DESC;
--���޻�B�� ��з��ڵ庰 ����-2015
CREATE TABLE PROPRI15 AS
SELECT ��з��ڵ�,SUM(���űݾ�) ��ǰ������ FROM PURPROD
WHERE ���޻� = 'B' AND YEAR ='2015'
GROUP BY ��з��ڵ�
ORDER BY ��ǰ������ DESC;
SELECT * FROM PURPROD;
--�ٲﵥ���� ��
SELECT ��з��ڵ�,SUM(��ǰ������)  FROM PROPRI14
GROUP BY ��з��ڵ�;
SELECT ��з��ڵ�,SUM(��ǰ������)  FROM PROPRI15
GROUP BY ��з��ڵ�;

ORDER BY ��ǰ������ DESC;
SELECT * FROM PURPROD;
SELECT * FROM COMPET;

--���� ���Ϲݱ�� ������(��ݱ�1~6,�Ϲݱ�7~12)
CREATE VIEW SEA141 AS
SELECT ����ȣ, COUNT(DISTINCT ��������ȣ) ����Ƚ��, SUM(���űݾ�) ���űݾ�
FROM PURPROD
WHERE �������� < 20140701
GROUP BY ����ȣ;
DROP VIEW SEA141;

CREATE VIEW SEA142 AS
SELECT ����ȣ, COUNT(DISTINCT ��������ȣ) ����Ƚ��, SUM(���űݾ�) ���űݾ�
FROM PURPROD
WHERE �������� >= 20140701 AND �������� < 20150101
GROUP BY ����ȣ;
DROP VIEW SEA142;

CREATE VIEW SEA151 AS
SELECT ����ȣ, COUNT(DISTINCT ��������ȣ) ����Ƚ��, SUM(���űݾ�) ���űݾ�
FROM PURPROD
WHERE �������� >= 20150101 AND �������� < 20150701
GROUP BY ����ȣ;
DROP VIEW SEA151;

CREATE VIEW SEA152 AS
SELECT ����ȣ, COUNT(DISTINCT ��������ȣ) ����Ƚ��, SUM(���űݾ�) ���űݾ�
FROM PURPROD
WHERE �������� >= 20150701 AND �������� < 20160101
GROUP BY ����ȣ;
DROP VIEW SEA152;

CREATE TABLE SEA14 AS
SELECT A1.����ȣ ����ȣ141, A1.����Ƚ�� ����Ƚ��141,A1.���űݾ� ���űݾ�141, A2.����ȣ ����ȣ142, A2.����Ƚ�� ����Ƚ��142, A2.���űݾ� ���űݾ�142
FROM SEA141 A1 
FULL OUTER JOIN SEA142 A2 ON (A1.����ȣ=A2.����ȣ);
DROP TABLE SEA14;
CREATE TABLE CUST_CA AS
SELECT COALESCE(����ȣ141,����ȣ142)����ȣ, NVL(����Ƚ��141,0) ��ݱⱸ��ȸ��14 ,NVL(���űݾ�141,0) ��ݱⱸ�űݾ�14,NVL(����Ƚ��142,0) �Ϲݱⱸ��ȸ��14,NVL(���űݾ�142,0) �Ϲݱⱸ�űݾ�14
FROM SEA14
order by ����ȣ;
DROP TABLE CUST_CA;
CREATE TABLE SEA15 AS
SELECT A1.����ȣ ����ȣ151, A1.����Ƚ�� ����Ƚ��151,A1.���űݾ� ���űݾ�151, A2.����ȣ ����ȣ152, A2.����Ƚ�� ����Ƚ��152, A2.���űݾ� ���űݾ�152
FROM SEA151 A1 
FULL OUTER JOIN SEA152 A2 ON (A1.����ȣ=A2.����ȣ);
DROP TABLE SEA15;
CREATE TABLE CUST_CAA AS
SELECT COALESCE(����ȣ151,����ȣ152)����ȣ, NVL(����Ƚ��151,0) ��ݱⱸ��ȸ��15 ,NVL(���űݾ�151,0) ��ݱⱸ�űݾ�15,NVL(����Ƚ��152,0) �Ϲݱⱸ��ȸ��15,NVL(���űݾ�152,0) �Ϲݱⱸ�űݾ�15
FROM SEA15
order by ����ȣ;
DROP TABLE NEW_1;
SELECT * FROM CUST_CA;
SELECT * FROM CUST_CAA;

CREATE TABLE NEW_1 AS
SELECT A1.����ȣ, A1.��ݱⱸ��ȸ��14, A1.��ݱⱸ�űݾ�14, A1.�Ϲݱⱸ��ȸ��14, A1.�Ϲݱⱸ�űݾ�14, A2.����ȣ ����ȣ15, A2.��ݱⱸ��ȸ��15, A2.��ݱⱸ�űݾ�15, A2.�Ϲݱⱸ��ȸ��15, A2.�Ϲݱⱸ�űݾ�15
FROM CUST_CA A1 
FULL OUTER JOIN CUST_CAA A2 ON (A1.����ȣ=A2.����ȣ);

CREATE TABLE CUST_QUA AS
SELECT COALESCE(����ȣ,����ȣ15)����ȣ,��ݱⱸ��ȸ��14,��ݱⱸ�űݾ�14,�Ϲݱⱸ��ȸ��14,�Ϲݱⱸ�űݾ�14,��ݱⱸ��ȸ��15,��ݱⱸ�űݾ�15,�Ϲݱⱸ��ȸ��15,�Ϲݱⱸ�űݾ�15
FROM NEW_1
order by ����ȣ;


update CUST_QUA set �Ϲݱⱸ��ȸ��14 = 0
where �Ϲݱⱸ��ȸ��14 IS NULL;

SELECT * FROM CUST_QUA;
SELECT COUNT(*) FROM CUST_QUA;
SELECT * FROM CUST_QUA
WHERE �Ϲݱⱸ��ȸ��14 = 0;

SELECT MAX(��ݱⱸ��ȸ��14),MIN(��ݱⱸ��ȸ��14),ROUND(AVG(��ݱⱸ��ȸ��14),2) FROM CUST_QUA;
SELECT MAX(��ݱⱸ�űݾ�14),MIN(��ݱⱸ�űݾ�14),ROUND(AVG(��ݱⱸ�űݾ�14),2) FROM CUST_QUA;
SELECT MAX(�Ϲݱⱸ��ȸ��14),MIN(�Ϲݱⱸ��ȸ��14),ROUND(AVG(�Ϲݱⱸ��ȸ��14),2) FROM CUST_QUA;
SELECT MAX(�Ϲݱⱸ�űݾ�14),MIN(�Ϲݱⱸ�űݾ�14),ROUND(AVG(�Ϲݱⱸ�űݾ�14),2) FROM CUST_QUA;

SELECT MAX(��ݱⱸ��ȸ��15),MIN(��ݱⱸ��ȸ��15),ROUND(AVG(��ݱⱸ��ȸ��15),2) FROM CUST_QUA;
SELECT MAX(��ݱⱸ�űݾ�15),MIN(��ݱⱸ�űݾ�15),ROUND(AVG(��ݱⱸ�űݾ�15),2) FROM CUST_QUA;
SELECT MAX(�Ϲݱⱸ��ȸ��15),MIN(�Ϲݱⱸ��ȸ��15),ROUND(AVG(�Ϲݱⱸ��ȸ��15),2) FROM CUST_QUA;
SELECT MAX(�Ϲݱⱸ�űݾ�15),MIN(�Ϲݱⱸ�űݾ�15),ROUND(AVG(�Ϲݱⱸ�űݾ�15),2) FROM CUST_QUA;
--������׷� ������ ��� ���غ�
select count(*) from cust_qua
where ��ݱⱸ�űݾ�14 < 5000000;
select count(*) from cust_qua
where ��ݱⱸ�űݾ�14 > 5000000 and ��ݱⱸ�űݾ�14 < 10000000;
select count(*) from cust_qua
where ��ݱⱸ�űݾ�14 > 10000000 and ��ݱⱸ�űݾ�14 < 20000000;
select count(*) from cust_qua
where ��ݱⱸ�űݾ�14 > 20000000;

select count(*) from cust_qua
where �Ϲݱⱸ�űݾ�14 < 5000000;
select count(*) from cust_qua
where �Ϲݱⱸ�űݾ�14 > 5000000 and ��ݱⱸ�űݾ�14 < 10000000;
select count(*) from cust_qua
where �Ϲݱⱸ�űݾ�14 > 10000000 and ��ݱⱸ�űݾ�14 < 20000000;
select count(*) from cust_qua
where �Ϲݱⱸ�űݾ�14 > 20000000;


CREATE TABLE NEWCUST AS
select ����ȣ,
CASE WHEN ��ݱⱸ�űݾ�14 <= 2500000 THEN '1'
WHEN (��ݱⱸ�űݾ�14 > 2500000 and ��ݱⱸ�űݾ�14 <= 4000000) THEN '2'
WHEN  (��ݱⱸ�űݾ�14 > 4000000 and ��ݱⱸ�űݾ�14 <= 9000000) THEN '3'
WHEN ��ݱⱸ�űݾ�14 > 9000000 THEN '4'
else '0' END AS ��ݱ���14,
CASE WHEN �Ϲݱⱸ�űݾ�14 <= 2500000 THEN '1'
WHEN (�Ϲݱⱸ�űݾ�14 > 2500000 and �Ϲݱⱸ�űݾ�14 <= 4000000) THEN '2'
WHEN  (�Ϲݱⱸ�űݾ�14 > 4000000 and �Ϲݱⱸ�űݾ�14 <= 9000000) THEN '3'
WHEN �Ϲݱⱸ�űݾ�14 > 9000000 THEN '4'
else '0' END AS �Ϲݱ���14,
CASE WHEN ��ݱⱸ�űݾ�15 <= 2500000 THEN '1'
WHEN (��ݱⱸ�űݾ�15 > 2500000 and ��ݱⱸ�űݾ�15 <= 4000000) THEN '2'
WHEN  (��ݱⱸ�űݾ�15 > 4000000 and ��ݱⱸ�űݾ�15 <= 9000000) THEN '3'
WHEN ��ݱⱸ�űݾ�15 > 9000000 THEN '4'
else '0' END AS ��ݱ���15,
CASE WHEN �Ϲݱⱸ�űݾ�15 <= 2500000 THEN '1'
WHEN (�Ϲݱⱸ�űݾ�15 > 2500000 and �Ϲݱⱸ�űݾ�15 <= 4000000) THEN '2'
WHEN  (�Ϲݱⱸ�űݾ�15 > 4000000 and �Ϲݱⱸ�űݾ�15 <= 9000000) THEN '3'
WHEN �Ϲݱⱸ�űݾ�15 >= 9000000 THEN '4'
else '0' END AS �Ϲݱ���15
from cust_qua;

SELECT * FROM NEWCUST;


CREATE TABLE NEWCUSTB AS
select ����ȣ,
CASE WHEN ��ݱⱸ��ȸ��14 <= 100 THEN '1'
WHEN (��ݱⱸ��ȸ��14 > 100 and ��ݱⱸ��ȸ��14 <= 150) THEN '2'
WHEN  (��ݱⱸ��ȸ��14 > 150 and ��ݱⱸ��ȸ��14 <= 200) THEN '3'
WHEN ��ݱⱸ��ȸ��14 > 200 THEN '4'
else '0' END AS ��ݱⱸ�ź�14,
CASE WHEN �Ϲݱⱸ��ȸ��14 <= 100 THEN '1'
WHEN (�Ϲݱⱸ��ȸ��14 > 100 and �Ϲݱⱸ��ȸ��14 <= 150) THEN '2'
WHEN  (�Ϲݱⱸ��ȸ��14 > 150 and �Ϲݱⱸ��ȸ��14 <= 200) THEN '3'
WHEN �Ϲݱⱸ��ȸ��14 > 200 THEN '4'
else '0' END AS �Ϲݱⱸ�ź�14,
CASE WHEN ��ݱⱸ��ȸ��15 <= 100 THEN '1'
WHEN (��ݱⱸ��ȸ��15 > 100 and ��ݱⱸ��ȸ��15 <= 150) THEN '2'
WHEN  (��ݱⱸ��ȸ��15 > 150 and ��ݱⱸ��ȸ��15 <= 200) THEN '3'
WHEN ��ݱⱸ��ȸ��15 > 200 THEN '4'
else '0' END AS ��ݱⱸ�ź�15,
CASE WHEN �Ϲݱⱸ��ȸ��15 <= 100 THEN '1'
WHEN (�Ϲݱⱸ��ȸ��15 > 100 and �Ϲݱⱸ��ȸ��15 <= 150) THEN '2'
WHEN  (�Ϲݱⱸ��ȸ��15 > 150 and �Ϲݱⱸ��ȸ��15 <= 200) THEN '3'
WHEN �Ϲݱⱸ��ȸ��15 > 200 THEN '4'
else '0' END AS �Ϲݱⱸ�ź�15
from cust_qua;

SELECT * FROM NEWCUST;
SELECT * FROM NEW_CUST_B;

CREATE TABLE SSUM AS
SELECT A.����ȣ,A.��ݱ���14,A.�Ϲݱ���14,A.��ݱ���15,A.�Ϲݱ���15,A2.��ݱⱸ�ź�14,A2.�Ϲݱⱸ�ź�14,A2.��ݱⱸ�ź�15,A2.�Ϲݱⱸ�ź�15
FROM NEW_CUST A
FULL OUTER JOIN NEW_CUST_B A2 ON A.����ȣ = a2.����ȣ;

SELECT ���Žð� , SUM(���űݾ�) FROM PURPROD
GROUP BY ���Žð�
ORDER BY ���Žð�;

SELECT C.���ɴ� , SUM(���űݾ�)
FROM PURPROD P
FULL OUTER JOIN CUSTDEMO C ON P.����ȣ = C.����ȣ
GROUP BY C.���ɴ�
ORDER BY C.���ɴ�;

SELECT C.���� , SUM(���űݾ�)
FROM PURPROD P
FULL OUTER JOIN CUSTDEMO C ON P.����ȣ = C.����ȣ
GROUP BY C.����
ORDER BY C.����;


SELECT * FROM PURPROD;
SELECT * FROM PRODCL;

SELECT P.��з��ڵ� , SUM(���űݾ�)
FROM PURPROD P
FULL OUTER JOIN PRODCL C ON P.��з��ڵ� = C.��з��ڵ� AND P.���޻� = C.���޻�
WHERE P.���޻� LIKE '%D' AND YEAR = '2015'
GROUP BY P.��з��ڵ�;
ORDER BY P.��з��ڵ�;

SELECT ��з��ڵ�, SUM(���űݾ�)
FROM MAKET_B
WHERE YEAR = '2015'
GROUP BY ��з��ڵ�;