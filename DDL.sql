/*create table
===================================*/
-- 테이블, 제약조건 및 뷰 삭제
drop table productcolor purge;
drop table productsize purge;
drop table product PURGE;
DROP TABLE mainCategory CASCADE CONSTRAINTS;
DROP TABLE subCategory CASCADE CONSTRAINTS;
DROP TABLE BRAND CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE BRANCH CASCADE CONSTRAINTS;
DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;

-- 테이블 생성 
-- PRODUCT 테이블 생성 
CREATE TABLE product (
    id              VARCHAR2(255) NOT NULL,
    brandId         NUMBER(10) NOT NULL,
    sex             VARCHAR2(255) NOT NULL,
    maincategoryId  NUMBER(10) NOT NULL,
    subcategoryId   NUMBER(10) NOT NULL,
    title           VARCHAR2(255) NOT NULL,
    price           NUMBER(20) NOT NULL,
    longdetail      CLOB NOT NULL,
    shortdetail     CLOB NOT NULL
    /*****************************************************************************
      TABLE NAME  	: PRODUCT 
      DESCRIPTION   : 상품 정보를 저장하는 테이블
      PARAMETERS    : id     -- 상품 번호
					  brandId	 -- 브랜드 이름
					  sex  -- 상품 카테고리 성별
					  maincategoryId  --  상품 메인 카테고리 번호
					  subcategoryId   -- 상품 서브 카테고리 번호
					  title  --  상품 이름
					  price  --  상품 가격
					  longdetail   --  상품 긴 설명
					  shortdetail  --  상품 짧은 설명
      특이사항       :
  ----------------------------------------------------------------------------
        DATE       AUTHOR           DESCRIPTION
  ----------------------------------------------------------------------------
     2021-07-05    IYR              최초 작성
	

******************************************************************************/
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( id );

-- PRODUCTCOLOR 테이블 생성 
CREATE TABLE productcolor (
    productId  VARCHAR2(255) NOT NULL,
    color      VARCHAR2(255) NOT NULL,
    imagePath  VARCHAR2(255) NOT NULL
   
      /*****************************************************************************
      TABLE NAME  	: PRODUCTCOLOR  
      DESCRIPTION   : 상품 색상을 저장하는 테이블
      PARAMETERS    : productId  --   상품 번호
					  color     --   상품 색상
					  imagePath	 --   상품 이미지
      특이사항       :
  ----------------------------------------------------------------------------
        DATE       AUTHOR           DESCRIPTION
  ----------------------------------------------------------------------------
     2021-07-05    IYR              최초 작성
	

******************************************************************************/
);

ALTER TABLE productcolor ADD CONSTRAINT productcolor_pk PRIMARY KEY ( productId,
                                                                      color );
-- PRODUCTSIZE 테이블 생성 
CREATE TABLE productsize (
    productId  VARCHAR2(255) NOT NULL,
    sizelabel     VARCHAR2(255) NOT NULL
    
    /*****************************************************************************
      TABLE NAME  	: PRODUCTCOLOR  
      DESCRIPTION   : 상품 색상을 저장하는 테이블
      PARAMETERS    : productId  --   상품 번호
					  sizelabel     --   상품 사이즈
      특이사항       :
  ----------------------------------------------------------------------------
        DATE       AUTHOR           DESCRIPTION
  ----------------------------------------------------------------------------
     2021-07-05    IYR              최초 작성
	

******************************************************************************/
);
ALTER TABLE productsize ADD CONSTRAINT productsize_pk PRIMARY KEY ( productId,
                                                                    sizelabel );


-- MAINCATEGORY 테이블 생성 
CREATE TABLE mainCategory (
    id NUMBER GENERATED AS IDENTITY NOT NULL, 
    name VARCHAR2(30) NOT NULL, 
    ename VARCHAR2(30) NOT NULL
    
     /*****************************************************************************
      TABLE NAME  	: MAINCATEGORY
      DESCRIPTION   : 메인 카테고리 정보 테이블
      PARAMETERS    : Id  --   카테고리 구분
                      name  --  카테고리 한글표기
					  ename     --  카테고리 영어표기
      특이사항       :
  ----------------------------------------------------------------------------
        DATE       AUTHOR           DESCRIPTION
  ----------------------------------------------------------------------------
     2021-07-05    CMJ              최초 작성
	

******************************************************************************/
    );
ALTER TABLE mainCategory ADD CONSTRAINT mainCategory_pk PRIMARY KEY (id);

-- SUBCATEGORY 테이블 생성 
CREATE TABLE subCategory (
    id NUMBER GENERATED AS IDENTITY NOT NULL, 
    name VARCHAR2(30) NOT NULL, 
    ename VARCHAR2(30) NOT NULL
    
     /*****************************************************************************
      TABLE NAME  	: SUBCATEGORY
      DESCRIPTION   : 상세 카테고리 정보 테이블
      PARAMETERS    : Id  --   카테고리 구분
                      name  --  카테고리 한글표기
					  ename     --  카테고리 영어표기
      특이사항       :
  ----------------------------------------------------------------------------
        DATE       AUTHOR           DESCRIPTION
  ----------------------------------------------------------------------------
     2021-07-05    CMJ              최초 작성
	

******************************************************************************/
    );
ALTER TABLE subCategory ADD CONSTRAINT subCategory_pk PRIMARY KEY (id);


-- BRAND 테이블 생성
CREATE TABLE BRAND(
    ID    NUMBER GENERATED AS IDENTITY NOT NULL,
    NAME  VARCHAR2(100) NOT NULL
    
    /*****************************************************************************
      TABLE NAME  	: BRAND  
      DESCRIPTION   : 브랜드 이름을 저장하는 테이블
      PARAMETERS    : ID    --  브랜드 번호
					  NAME	--	브랜드 이름
      특이사항       :
  ----------------------------------------------------------------------------
        DATE       AUTHOR           DESCRIPTION
  ----------------------------------------------------------------------------
     2021-07-05    KDH              최초 작성
	

******************************************************************************/
);
ALTER TABLE BRAND ADD CONSTRAINT BRAND_ID_PK PRIMARY KEY(ID);



-- DEPARTMENT 테이블 생성
CREATE TABLE DEPARTMENT(
    ID        NUMBER GENERATED AS IDENTITY NOT NULL,
    NAME      VARCHAR2(100) NOT NULL,
    ADDRESS   VARCHAR2(200) NOT NULL,
    LATITUDE  NUMBER        NOT NULL,
    LONGITUDE NUMBER        NOT NULL
    
    /*****************************************************************************
      TABLE NAME  	: DEPARTMENT  
      DESCRIPTION   : 백화점 정보를 저장하는 테이블
      PARAMETERS    : ID        --  백화점 번호
					  NAME		--	백화점 이름
					  ADDRESS	--	백화점 주소
					  LATITUDE  --  백화점 위도
					  LONGITUDE --  백화점 경도
      특이사항       :
  ----------------------------------------------------------------------------
        DATE       AUTHOR           DESCRIPTION
  ----------------------------------------------------------------------------
     2021-07-05    KDH              최초 작성
	

******************************************************************************/
);
ALTER TABLE DEPARTMENT ADD CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(ID);



-- BRANCH 테이블 생성
CREATE TABLE BRANCH(
    ID              NUMBER GENERATED AS IDENTITY NOT NULL,
    DEPARTMENT_ID   NUMBER NOT NULL,
    BRAND_ID        NUMBER NOT NULL
    
    /*****************************************************************************
      TABLE NAME  	: DEPARTMENT  
      DESCRIPTION   : 백화점 정보를 저장하는 테이블
      PARAMETERS    : ID            --  지점 번호
					  DEPARTMENT_ID	--	백화점 번호
					  BRAND_ID		--	브랜드 번호
      특이사항       : 백화점 별로 여러개의 브랜드를 가지고 있음.
  ----------------------------------------------------------------------------
        DATE       AUTHOR           DESCRIPTION
  ----------------------------------------------------------------------------
     2021-07-05    KDH              최초 작성
	

******************************************************************************/
);
ALTER TABLE BRANCH ADD CONSTRAINT BRANCH_ID_PK PRIMARY KEY(ID);


-- ADMIN 테이블 생성
CREATE TABLE ADMIN(
    ID              VARCHAR2(100) NOT NULL,
    PASSWORD        VARCHAR2(1000) NOT NULL,
    BRANCH_ID       NUMBER
    
    /*****************************************************************************
      TABLE NAME  	: DEPARTMENT  
      DESCRIPTION   : 백화점 정보를 저장하는 테이블
      PARAMETERS    : ID			--	아이디
					  PASSWORD		--	비밀번호
					  BRANCH_ID     --  지점 번호
      특이사항       : 
  ----------------------------------------------------------------------------
        DATE       AUTHOR           DESCRIPTION
  ----------------------------------------------------------------------------
     2021-07-05    KDH              최초 작성
	

******************************************************************************/
);
ALTER TABLE ADMIN ADD CONSTRAINT ADMIN_ID_PK PRIMARY KEY(ID);



-- MEMBER 테이블 생성
CREATE TABLE MEMBER (
    id          VARCHAR2(100) NOT NULL,
    password    VARCHAR2(100) NOT NULL,
    name        VARCHAR2(50) NOT NULL,
    regist_num  VARCHAR2(100) NOT NULL,
    gender      VARCHAR2(50) NOT NULL,
    address     VARCHAR2(100) NOT NULL,
    phone       VARCHAR2(100) NOT NULL,
    preferDepartmentId      NUMBER(10) NOT NULL,
    preferBrandId       NUMBER(10) NOT NULL
    /*****************************************************************************
      TABLE NAME  	: MEMBER 
      DESCRIPTION   : 고객의 정보를 나타내는 테이블
      PARAMETERS    : id       -- 고객 아이디
                      password -- 고객 비밀번호
                      name     -- 이름
                      regist_num  -- 주민번호
                      gender  -- 성별
                      address  -- 주소
                      phone  -- 연락처
                      preferDepartmentId  -- 선호하는 백화점 지점
                      preferBrandId  -- 선호하는 브랜드
      특이사항       :
  ----------------------------------------------------------------------------
        DATE       AUTHOR           DESCRIPTION
  ----------------------------------------------------------------------------
     2021-07-06    CMJ              최초 작성
	

******************************************************************************/
);

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( id );


-- CART 테이블 생성
CREATE TABLE CART (
    userId          VARCHAR2(100) NOT NULL,
    productId       VARCHAR2(255) NOT NULL,
    quantity        NUMBER(10) NOT NULL
    /*****************************************************************************
      TABLE NAME  	: CART 
      DESCRIPTION   : 고객의 장바구니 정보를 나타내는 테이블
      PARAMETERS    : userId     -- 고객 아이디
					  productId	 -- 상품 고유번호
					  quantity   -- 상품 수량
      특이사항       :
  ----------------------------------------------------------------------------
        DATE       AUTHOR           DESCRIPTION
  ----------------------------------------------------------------------------
     2021-07-06    CMJ              최초 작성
	

******************************************************************************/
);

ALTER TABLE cart ADD CONSTRAINT cart_pk PRIMARY KEY ( userId, productId );


--------------------------------------------------------------------------------------------

ALTER TABLE productcolor
    ADD CONSTRAINT productcolor_product_fk FOREIGN KEY ( productId )
        REFERENCES product ( id );

ALTER TABLE productsize
    ADD CONSTRAINT productsize_product_fk FOREIGN KEY ( productId )
        REFERENCES product ( id );
        
ALTER TABLE BRANCH ADD CONSTRAINT BRANCH_DEPARTMENT_ID_FK 
                      FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENT(ID);
                      
ALTER TABLE BRANCH ADD CONSTRAINT BRANCH_BRAND_ID_FK 
                      FOREIGN KEY(BRAND_ID) REFERENCES BRAND(ID);
                      
ALTER TABLE ADMIN ADD CONSTRAINT ADMIN_BRANCH_ID_FK 
                      FOREIGN KEY(BRANCH_ID) REFERENCES BRANCH(ID);
                            
ALTER TABLE member ADD CONSTRAINT member_preferbranch_fk 
    FOREIGN KEY ( preferDepartmentId ) REFERENCES department ( id );

ALTER TABLE member ADD CONSTRAINT member_preferbrand_fk 
    FOREIGN KEY ( preferBrandId ) REFERENCES brand ( id );

ALTER TABLE cart ADD CONSTRAINT cart_member_fk
    FOREIGN KEY ( userId ) REFERENCES member ( id );
    
ALTER TABLE cart ADD CONSTRAINT cart_product_fk 
    FOREIGN KEY ( productId ) REFERENCES product ( id );