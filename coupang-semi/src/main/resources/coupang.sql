DROP TABLE delivery; 
DROP TABLE pick; 
DROP TABLE review; 
DROP TABLE swap; 
DROP TABLE coupon; 
DROP TABLE choice; 
DROP TABLE purchase; 
DROP TABLE product; 
DROP TABLE category; 
DROP TABLE enterprise;  
DROP TABLE user; 


CREATE TABLE category(
	cate_code INT AUTO_INCREMENT PRIMARY KEY, -- 카테고리 코드
    cate_icon VARCHAR(20), -- 카테고리 아이콘
    cate_name VARCHAR(30) NOT NULL, -- 카테고리 이름 
    cate_url VARCHAR(100), -- 카테고리 대표 이미지
    parent_code INT  -- 부모 카테고리 코드
);

INSERT INTO category (cate_icon, cate_name, cate_url) VALUES ('fa-shirt', '패션의류/잡화', 'https://image8.coupangcdn.com/image/displayitem/displayitem_3cc22bda-73a2-4f9b-a7ea-c12d205adcb3.jpg'); -- 1
INSERT INTO category (cate_icon, cate_name, cate_url) VALUES ('fa-pump-soap', '뷰티', 'https://image9.coupangcdn.com/image/displayitem/displayitem_66b57433-c633-44e2-ad4a-e334e2779ab3.jpg'); -- 2
INSERT INTO category (cate_icon, cate_name, cate_url) VALUES ('fa-baby', '출산/유아동', 'https://image7.coupangcdn.com/image/displayitem/displayitem_177b1f26-409b-4799-a6f6-1468c45fcdcc.jpg'); -- 3
INSERT INTO category (cate_icon, cate_name, cate_url) VALUES ('fa-bowl-food', '식품', 'https://image7.coupangcdn.com/image/displayitem/displayitem_96ace47f-0079-4436-9cf0-25a43ac75517.jpg'); -- 4
INSERT INTO category (cate_icon, cate_name, cate_url) VALUES ('fa-mug-saucer', '주방용품', 'https://image6.coupangcdn.com/image/displayitem/displayitem_2049fac1-63d9-441c-ba0a-26a95ca5ee71.jpg'); -- 5
INSERT INTO category (cate_icon, cate_name, cate_url) VALUES ('fa-bottle-droplet', '생활용품', 'https://image6.coupangcdn.com/image/displayitem/displayitem_5c29f78b-865f-4303-bc84-b811633fab36.jpg'); -- 6
INSERT INTO category (cate_icon, cate_name, cate_url) VALUES ('fa-couch', '홈인테리어', 'https://image9.coupangcdn.com/image/displayitem/displayitem_2af06d7f-e016-419e-8fcb-059898000ee2.jpg'); -- 7
INSERT INTO category (cate_icon, cate_name, cate_url) VALUES ('fa-camera', '가전디지털', 'https://image7.coupangcdn.com/image/displayitem/displayitem_1682114d-db45-4371-8aee-b1d6f69523dc.jpg'); -- 8
INSERT INTO category (cate_icon, cate_name, cate_url) VALUES ('fa-baseball', '스포츠/레저', 'https://image7.coupangcdn.com/image/displayitem/displayitem_632d731b-b306-4e0a-b3fb-1ee5bf06f380.jpg'); -- 9
INSERT INTO category (cate_icon, cate_name, cate_url) VALUES ('fa-car', '자동차용품', 'https://image7.coupangcdn.com/image/displayitem/displayitem_33eefe3e-deb8-45f3-b1f9-e9a01815c3f7.jpg'); -- 10
INSERT INTO category (cate_name, parent_code) VALUES ('여성패션', 1);
INSERT INTO category (cate_name, parent_code) VALUES ('남성패션', 1);
INSERT INTO category (cate_name, parent_code) VALUES ('남녀 공용 의류', 1);
INSERT INTO category (cate_name, parent_code) VALUES ('유아동패션', 1);
INSERT INTO category (cate_name, parent_code) VALUES ('로켓럭셔리', 2);
INSERT INTO category (cate_name, parent_code) VALUES ('스킨케어', 2);
INSERT INTO category (cate_name, parent_code) VALUES ('클린/비건뷰티', 2);
INSERT INTO category (cate_name, parent_code) VALUES ('클렌징/필링', 2);
INSERT INTO category (cate_name, parent_code) VALUES ('더마코스메틱', 2);
INSERT INTO category (cate_name, parent_code) VALUES ('유아동패션', 3);
INSERT INTO category (cate_name, parent_code) VALUES ('기저귀', 3);
INSERT INTO category (cate_name, parent_code) VALUES ('물티슈', 3);
INSERT INTO category (cate_name, parent_code) VALUES ('분유/어린이식품', 3);
INSERT INTO category (cate_name, parent_code) VALUES ('어린이 건강식품', 3);
INSERT INTO category (cate_name, parent_code) VALUES ('유기농/친환경 전문관', 4);
INSERT INTO category (cate_name, parent_code) VALUES ('과일', 4);
INSERT INTO category (cate_name, parent_code) VALUES ('견과/건과', 4);
INSERT INTO category (cate_name, parent_code) VALUES ('채소', 4);
INSERT INTO category (cate_name, parent_code) VALUES ('쌀/잡곡', 4);
INSERT INTO category (cate_name, parent_code) VALUES ('주방가전', 5);
INSERT INTO category (cate_name, parent_code) VALUES ('냄비/프라이팬', 5);
INSERT INTO category (cate_name, parent_code) VALUES ('주방조리도구', 5);
INSERT INTO category (cate_name, parent_code) VALUES ('그릇/홈세트', 5);
INSERT INTO category (cate_name, parent_code) VALUES ('수저/커트러리', 5);
INSERT INTO category (cate_name, parent_code) VALUES ('방한용품', 6);
INSERT INTO category (cate_name, parent_code) VALUES ('헤어', 6);
INSERT INTO category (cate_name, parent_code) VALUES ('바디/세안', 6);
INSERT INTO category (cate_name, parent_code) VALUES ('구강/면도', 6);
INSERT INTO category (cate_name, parent_code) VALUES ('화장지/물티슈', 6);
INSERT INTO category (cate_name, parent_code) VALUES ('크리스마스용품', 7);
INSERT INTO category (cate_name, parent_code) VALUES ('방한용품', 7);
INSERT INTO category (cate_name, parent_code) VALUES ('F/W 침구샵', 7);
INSERT INTO category (cate_name, parent_code) VALUES ('싱글하우스', 7);
INSERT INTO category (cate_name, parent_code) VALUES ('홈데코', 7);
INSERT INTO category (cate_name, parent_code) VALUES ('TV/영상가전', 8);
INSERT INTO category (cate_name, parent_code) VALUES ('냉장고', 8);
INSERT INTO category (cate_name, parent_code) VALUES ('세탁기/건조기', 8);
INSERT INTO category (cate_name, parent_code) VALUES ('생활가전', 8);
INSERT INTO category (cate_name, parent_code) VALUES ('청소기', 8);
INSERT INTO category (cate_name, parent_code) VALUES ('캠핑전문관', 9);
INSERT INTO category (cate_name, parent_code) VALUES ('홈트레이닝', 9);
INSERT INTO category (cate_name, parent_code) VALUES ('수영/수상스포츠', 9);
INSERT INTO category (cate_name, parent_code) VALUES ('골프', 9);
INSERT INTO category (cate_name, parent_code) VALUES ('자전거', 9);
INSERT INTO category (cate_name, parent_code) VALUES ('겨울철 차량관리', 10);
INSERT INTO category (cate_name, parent_code) VALUES ('인테리어', 10);
INSERT INTO category (cate_name, parent_code) VALUES ('익스테리어', 10);
INSERT INTO category (cate_name, parent_code) VALUES ('세차/카케어', 10);
INSERT INTO category (cate_name, parent_code) VALUES ('차량용 전자기기', 10);

CREATE TABLE product(
	prod_code INT AUTO_INCREMENT PRIMARY KEY, -- 상품 코드
    ente_id VARCHAR(50), -- 업체 아이디
    cate_code INT, -- 카테고리 코드
    prod_name VARCHAR(30) NOT NULL, -- 상품명
    prod_desc TEXT, -- 상품설명
    price INT NOT NULL, -- 가격 
    stock INT, -- 재고수량
    prod_date DATE DEFAULT (current_date), -- 상품등록일 
    prod_photo VARCHAR(200) -- 상품 사진 URL
);

CREATE TABLE enterprise( 
	ente_id VARCHAR(50) PRIMARY KEY, -- 업체 아이디
    password VARCHAR(50) NOT NULL, -- 비밀번호
    name VARCHAR(30), -- 대표자 이름
    company VARCHAR(50), -- 업체명
    address VARCHAR(100), -- 업체 주소
    regist_number VARCHAR(50), -- 사업자 등록번호
    company_phone VARCHAR(50) -- 업체 번호 
);

CREATE TABLE user( 
	id VARCHAR(50) PRIMARY KEY, -- 아이디
    password VARCHAR(100) NOT NULL, -- 비밀번호
    name VARCHAR(30), -- 고객명
    phone VARCHAR(20), -- 전화번호
    address VARCHAR(100), -- 주소
    email VARCHAR(50), -- 이메일
    role VARCHAR(20) DEFAULT 'ROLE_USER'
);

CREATE TABLE pick( 
	pick_code INT AUTO_INCREMENT PRIMARY KEY, -- 찜 코드 
    id VARCHAR(50), -- 아이디
    prod_code INT, -- 상품 코드 
    pick_date DATE DEFAULT (current_date) -- 찜한 날짜
);

CREATE TABLE review( 
	revi_code INT AUTO_INCREMENT PRIMARY KEY, -- 리뷰 코드
    id VARCHAR(50), -- 아이디 
    prod_code INT, -- 상품 코드
    revi_title VARCHAR(50), -- 제목
    revi_desc TEXT, -- 설명
    revi_date DATE DEFAULT (current_date), -- 작성 날짜
    rating INT -- 평점
);

CREATE TABLE purchase( 
	pur_code INT AUTO_INCREMENT PRIMARY KEY, -- 구매 코드 
    id VARCHAR(50), -- 아이디
    prod_code INT, -- 상품 코드
    pur_date DATE DEFAULT (current_date), -- 구매 일시 
    pur_status VARCHAR(10) CHECK (pur_status IN ('구매완료', '배송대기중', '배송중', '배송완료')) DEFAULT '구매완료' -- 구매 상태
);

CREATE TABLE delivery(
	deli_code INT AUTO_INCREMENT PRIMARY KEY, -- 배송 코드
    pur_code INT, -- 구매 코드
    deli_date DATE DEFAULT (current_date), -- 배송 날짜
    deli_company VARCHAR(30), -- 배송사 
    deli_cost INT, -- 배송비
    deli_addr VARCHAR(100) -- 배송 주소
);

CREATE TABLE swap(
	swap_code INT AUTO_INCREMENT PRIMARY KEY, -- 교환 반품 코드 
    id VARCHAR(50), -- 아이디
    prod_code INT, -- 상품 코드 
    reason TEXT, -- 사유 
    swap_date DATE DEFAULT (current_date), -- 날짜 
    price INT, -- 비용
	swap_check CHAR(2) CHECK(swap_check IN ('교환', '반품')) -- 교환/반품
);

CREATE TABLE coupon(
	coupon_code INT AUTO_INCREMENT PRIMARY KEY, -- 쿠폰 코드 
    coupon_name VARCHAR(30), -- 쿠폰명
    expiry_date DATE DEFAULT (current_date), -- 사용기한 
    id VARCHAR(50), -- 아이디 
    prod_code INT -- 상품 코드
);

CREATE TABLE choice( 
	choi_code INT AUTO_INCREMENT PRIMARY KEY, -- 옵션 코드 
    prod_code INT, -- 상품 코드 
    choi_name VARCHAR(30) -- 옵션명 
);

ALTER TABLE category ADD FOREIGN KEY (parent_code) REFERENCES category(cate_code);
ALTER TABLE product ADD FOREIGN KEY (ente_id) REFERENCES enterprise(ente_id);
ALTER TABLE product ADD FOREIGN KEY (cate_code) REFERENCES category(cate_code);
ALTER TABLE pick ADD FOREIGN KEY (id) REFERENCES user (id);
ALTER TABLE pick ADD FOREIGN KEY (prod_code) REFERENCES product (prod_code);
ALTER TABLE review ADD FOREIGN KEY (id) REFERENCES user (id);
ALTER TABLE review ADD FOREIGN KEY (prod_code) REFERENCES product (prod_code);
ALTER TABLE purchase ADD FOREIGN KEY (id) REFERENCES user (id);
ALTER TABLE purchase ADD FOREIGN KEY (prod_code) REFERENCES product (prod_code);
ALTER TABLE delivery ADD FOREIGN KEY (pur_code) REFERENCES purchase (pur_code);
ALTER TABLE swap ADD FOREIGN KEY (id) REFERENCES user (id);
ALTER TABLE swap ADD FOREIGN KEY (prod_code) REFERENCES product (prod_code);
ALTER TABLE coupon ADD FOREIGN KEY (id) REFERENCES user (id);
ALTER TABLE coupon ADD FOREIGN KEY (prod_code) REFERENCES product (prod_code);
ALTER TABLE choice ADD FOREIGN KEY (prod_code) REFERENCES product (prod_code);