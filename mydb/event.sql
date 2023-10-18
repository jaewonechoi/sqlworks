-- event ���̺� ����
CREATE TABLE event(
    event_no    NUMBER PRIMARY KEY,     -- �̺�Ʈ ��ȣ
    evnet_name  VARCHAR2(50) NOT NULL,  -- �̺�Ʈ �̸�
    start_date  VARCHAR2(20) NOT NULL,  -- ������
    end_date    VARCHAR2(20) NOT NULL   -- ������
);

-- �ڵ� �Ϸù�ȣ
CREATE SEQUENCE seq_eno NOCACHE; 

INSERT INTO event(event_no, evnet_name, start_date, end_date)
VALUES (seq_eno.NEXTVAL, '20% ���� ���� ����', '2023-10-10', '2023-10-20');
INSERT INTO event(event_no, evnet_name, start_date, end_date)
VALUES (seq_eno.NEXTVAL, '���콺 �е� ����', '2023-11-15', '2023-11-25');
INSERT INTO event(event_no, evnet_name, start_date, end_date)
VALUES (seq_eno.NEXTVAL, '���� ���� �佺Ƽ��', '2023-12-10', '2023-12-30');

COMMIT;

SELECT * FROM event;

-- �̺�Ʈ �Ⱓ���ȿ� ���並 �ۼ��� ������ ����ǰ�� �ִ� ���
-- �������̺�� �̺�Ʈ ���̺� ����
-- 1 : ��(�̺�Ʈ�� ����)
-- �񵿵�����, Non Equi Join(>=, <=, BETWEEN AND)
SELECT a.evnet_name,
       b.member_id,
       b.content,
       b.regdate
FROM event a, product_review b
WHERE b.regdate BETWEEN a.start_date AND a.end_date;

-- ��������(INNER JOIN ON)
SELECT a.evnet_name,
       b.member_id,
       b.content,
       b.regdate
FROM event a JOIN product_review b  --INNER ��������
ON b.regdate >= a.start_date AND b.regdate <= a.end_date; 
    --BETWEEN a.start_date AND a.end_date;



