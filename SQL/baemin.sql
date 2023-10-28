
-- 01 ȸ��

-- 02 ����

-- 03 ����
drop table store_tbl;

CREATE TABLE store_tbl (
  storeCode VARCHAR2(50) PRIMARY KEY, -- �����ڵ�
  storeName VARCHAR2(50) NOT NULL,  -- �����̸�
  storeCategory VARCHAR2(50) NOT NULL,  -- ���� ī�װ�
  storeImage VARCHAR2(200) NOT NULL,    -- �������
  storeAddress VARCHAR2(200) NOT NULL,  -- �����ּ�
  storePhone VARCHAR2(12) NOT NULL, -- ������ȭ��ȣ
  zzimCount NUMBER(6) NOT NULL, -- �򰳼�
  reviewCount NUMBER(3, 0) NOT NULL,    -- �����
  storeRating number(1, 1)  NOT NULL,   -- ��������
  storeDescription VARCHAR2(2000) NOT NULL, -- ����Ұ���
  minOrderAmount NUMBER(4) NOT NULL,    -- �ּ��ֹ��ݾ�
  deliveryFee NUMBER(4) NOT NULL,   -- ��޺�
  operatingTime VARCHAR2(50) NOT NULL,  -- ��ð�
  deliveryArea VARCHAR2(50) NOT NULL,   -- �������
  storeStatus NUMBER(1) NOT NULL -- 0:close, 1:open
);

-- ������ ���� �� �ʱⰪ ����
DROP SEQUENCE storeCodeSeq;
CREATE SEQUENCE storeCodeSeq START WITH 1000;

-- ������ ����
INSERT INTO store_tbl
VALUES ('store'||storeCodeSeq.nextval, '����', '�п�', 'acorn.jpg', '01093811510', '������ ������ 457-27', 1, 2, 'ȫ�� �ְ��� IT ���� ��ī����', 9000, 0, '9:00-18:00', '������', 1);

select * from store_tbl;
-- 04 �޴�
drop table menu_tbl;

create table menu_tbl(
menuCode varchar2(50) primary key,  -- �޴��ڵ�
menuName varchar2(50) not null, -- �޴��̸�
menuPrice number(5),    -- �޴�����
menuImage varchar2(50) not null,    -- �޴�����
menuContent varchar2(2000) not null,   -- �޴�����
menuClassification varchar2(50) not null,   -- �޴��з�
menuStatus number(1) not null   -- �޴�����
);

-- ������ ���� �� �ʱⰪ ����;
DROP SEQUENCE menuCodeSeq;
create sequence menuCodeSeq start with 1000;

-- ������ ����
INSERT INTO menu_tbl
VALUES ('menu'||menuCodeSeq.nextval, '2���ǽ�', 50000, 'classroom.jpg', '3���� �־ �ٸ��� �� ���Ŀ�', 'classRoom', 0);

select * from menu_tbl;

-- 05 �ɼ�

-- 06 ��ٱ���

-- 07 �ֹ�
CREATE SEQUENCE orderNumber_seq START WITH 10000;
create table order_tbl(
orderNumber varchar2(20) PRIMARY KEY,
userCode varchar2(20),
storeCode varchar2(20),
orderDate date,
payType NUMBER(1, 0),
orderType NUMBER(1, 0), 
reqToSeller varchar(300),
reqToRider varchar(300),
orderStatus varchar(20),
CONSTRAINT fk_userCode FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
CONSTRAINT fk_storeCode FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
);

-- 08 ��
CREATE TABLE zzim_tbl (
    userCode VARCHAR2(20),
    storeCode VARCHAR2(20),
    CONSTRAINT fk_userCode FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
    CONSTRAINT fk_storeCode FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
);
-- 09 ����
create table review_tbl(
reviewCode  varchar2(5) primary key ,--�����ڵ� 
menuCode  varchar2(20)   ,--�޴��ڵ� 
userCode  varchar2(10) ,--ȸ���ڵ� 
storeCode  varchar2(13) ,--�����ڵ� 
reviewDate date not null ,--���䳯¥ 
reviewRating number(2) not null ,--�������� 
reviewContent varchar2(300) not null,--���䳻�� 
 CONSTRAINT fk_menuCode FOREIGN KEY (menuCode) REFERENCES menu_tbl(menuCode),
  CONSTRAINT fk_userCode FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
  CONSTRAINT fk_storeCode FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
);
create sequence reviewCode_seq start with 10000;
-- 10 ������
create table answer_tbl(
  answerCode  varchar2(20) not null primary key, --�亯�ڵ�
  reviewCode   varchar2(20) , --�����ڵ�
  answerDate  date not null , --�亯��¥
  answerContent varchar2(300) not null, --�亯����
   CONSTRAINT fk_reviewCode FOREIGN KEY (reviewCode) REFERENCES review_tbl(reviewCode)
);
create sequence answerCode_seq start with 10000;

-- 11 �ּ�
create table address_tbl(
    addressCode varchar2(20) primary key,
    userCode varchar2(20),
    deliveryAddress varchar2(200) not null,
    constraint fk_userCode foreign key (userCode) references user_tbl(userCode)
    );