SELECT * FROM PRO_NEW;

SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '가구류';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '고급식료품';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '귀금속';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '기타';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '기호품';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '도서음반';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '레저취미';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '명품';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '문구류';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '생활잡화';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '악기';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '의류잡화';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '전자제품';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '차량용품';
SELECT SUM(S.구매금액) FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE P.상품분류 = '화장품';
--전체 세분류별 매출확인
SELECT P.상품분류, SUM(S.구매금액) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE (P.소비재분류 = '편의품')
GROUP BY P.상품분류;

CREATE VIEW T AS;
SELECT P.상품분류,S.YEAR, SUM(S.구매금액) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE (월 between 10 and 12) AND (P.소비재분류 = '편의품')
GROUP BY P.상품분류,S.YEAR;

--제휴사 A의 세분류별 매출확인
SELECT * FROM PRO_NEW;
SELECT P.상품분류,S.YEAR, SUM(S.구매금액) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE  (월 between 10 and 12) AND (S.제휴사= 'A' AND P.소비재분류 = '편의품')
GROUP BY P.상품분류,S.YEAR;
--제휴사 B의 세분류별 매출확인
SELECT * FROM PRO_NEW;
SELECT P.상품분류,S.YEAR, SUM(S.구매금액) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE  (월 between 10 and 12) AND (S.제휴사= 'B' AND P.소비재분류 = '편의품')
GROUP BY P.상품분류,S.YEAR;
--제휴사 C의 세분류별 매출확인
SELECT P.상품분류,S.YEAR, SUM(S.구매금액) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE  (월 between 7 and 9) AND (S.제휴사= 'C' AND P.소비재분류 = '편의품')
GROUP BY P.상품분류,S.YEAR;
--제휴사D의 세분류별 확인
SELECT P.상품분류,S.YEAR, SUM(S.구매금액) 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
WHERE  (월 between 10 and 12) AND (S.제휴사= 'D' AND P.소비재분류 = '편의품')
GROUP BY P.상품분류,S.YEAR;

SELECT COUNT(*) FROM S_PUR_COPY;
SELECT COUNT(*) FROM TEST_SUM_C;

SELECT P.소비재분류,SUM(S.구매금액)구매합 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
GROUP BY P.소비재분류
ORDER BY 구매합 DESC;

SELECT YEAR ,P.소비재분류,COUNT(DISTINCT(영수증번호)) 건수 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
GROUP BY YEAR ,P.소비재분류
ORDER BY 건수 DESC;

SELECT YEAR ,P.소비재분류,TRUNC(AVG(구매금액)) 평균구매액 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
GROUP BY YEAR ,P.소비재분류
ORDER BY 평균구매액 DESC;

SELECT YEAR , TRUNC(AVG(구매금액)) 평균구매액 
FROM PRO_NEW P
FULL OUTER JOIN S_PUR_COPY S ON S.소분류코드 = P.소분류코드
GROUP BY YEAR 
ORDER BY 평균구매액 DESC;

WHERE  P.소비재분류 = '편의품';
GROUP BY P.상품분류;