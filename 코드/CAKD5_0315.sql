SELECT * FROM PRO_NEW;

SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '������';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '��޽ķ�ǰ';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '�ͱݼ�';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '��Ÿ';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '��ȣǰ';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '��������';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '�������';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '��ǰ';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '������';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '��Ȱ��ȭ';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '�Ǳ�';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '�Ƿ���ȭ';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '������ǰ';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = '������ǰ';
SELECT SUM(S.���űݾ�) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE P.��ǰ�з� = 'ȭ��ǰ';
--��ü ���з��� ����Ȯ��
SELECT P.��ǰ�з�, SUM(S.���űݾ�) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE (P.�Һ���з� = '����ǰ')
GROUP BY P.��ǰ�з�;

CREATE VIEW T AS;
SELECT P.��ǰ�з�,S.YEAR, SUM(S.���űݾ�) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE (�� between 10 and 12) AND (P.�Һ���з� = '����ǰ')
GROUP BY P.��ǰ�з�,S.YEAR;

--���޻� A�� ���з��� ����Ȯ��
SELECT * FROM PRO_NEW;
SELECT P.��ǰ�з�,S.YEAR, SUM(S.���űݾ�) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE  (�� between 10 and 12) AND (S.���޻�= 'A' AND P.�Һ���з� = '����ǰ')
GROUP BY P.��ǰ�з�,S.YEAR;
--���޻� B�� ���з��� ����Ȯ��
SELECT * FROM PRO_NEW;
SELECT P.��ǰ�з�,S.YEAR, SUM(S.���űݾ�) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE  (�� between 10 and 12) AND (S.���޻�= 'B' AND P.�Һ���з� = '����ǰ')
GROUP BY P.��ǰ�з�,S.YEAR;
--���޻� C�� ���з��� ����Ȯ��
SELECT P.��ǰ�з�,S.YEAR, SUM(S.���űݾ�) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE  (�� between 7 and 9) AND (S.���޻�= 'C' AND P.�Һ���з� = '����ǰ')
GROUP BY P.��ǰ�з�,S.YEAR;
--���޻�D�� ���з��� Ȯ��
SELECT P.��ǰ�з�,S.YEAR, SUM(S.���űݾ�) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
WHERE  (�� between 10 and 12) AND (S.���޻�= 'D' AND P.�Һ���з� = '����ǰ')
GROUP BY P.��ǰ�з�,S.YEAR;

SELECT COUNT(*) FROM S_PUR_COPY;
SELECT COUNT(*) FROM TEST_SUM_C;

SELECT P.�Һ���з�,SUM(S.���űݾ�)������ 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
GROUP BY P.�Һ���з�
ORDER BY ������ DESC;

SELECT YEAR ,P.�Һ���з�,COUNT(DISTINCT(��������ȣ)) �Ǽ� 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
GROUP BY YEAR ,P.�Һ���з�
ORDER BY �Ǽ� DESC;

SELECT YEAR ,P.�Һ���з�,TRUNC(AVG(���űݾ�)) ��ձ��ž� 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
GROUP BY YEAR ,P.�Һ���з�
ORDER BY ��ձ��ž� DESC;

SELECT YEAR , TRUNC(AVG(���űݾ�)) ��ձ��ž� 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.�Һз��ڵ� = P.�Һз��ڵ�
GROUP BY YEAR 
ORDER BY ��ձ��ž� DESC;

WHERE  P.�Һ���з� = '����ǰ';
GROUP BY P.��ǰ�з�;