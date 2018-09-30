create table a_deal(
	a_deal_no number primary key,
	a_no number,
	id varchar2(3000),
	f_price varchar2(3000)
);
CREATE TABLE product(
p_no number primary key,
title varchar2(3000),
price varchar2(3000),
content varchar2(3000),
area varchar2(3000),
hashtag varchar2(3000),
originfilename varchar2(3000),
newfilename varchar2(3000),
p_date date,
category varchar2(3000),
crn varchar2(3000),
location varchar2(3000),
type varchar2(3000),
s_time varchar2(3000),
e_time varchar2(3000),
tel varchar2(3000),
id varchar2(3000),
staravg number,
originfilenames varchar2(3000),
newfilenames varchar2(3000));

CREATE table bid (
id varchar2(3000),
price varchar2(3000),
count varchar2(3000));

CREATE table pointhistory(
id varchar2(3000),
kind varchar2(3000),
category varchar2(3000),
turnover varchar2(3000),
ph_no number);

create table spaceuser(
		id varchar2(3000) primary key,
		password varchar2(3000),
		name varchar2(3000),
		address varchar2(3000),
		point varchar2(3000),
		auction varchar2(3000),
		product varchar2(3000),
		crn varchar2(3000),
grade varchar2(3000),
tel varchar2(3000));



create table board(
		b_no number primary key,
		id varchar2(3000),
		title varchar2(3000),
		category varchar2(3000),
		b_date date,
		content varchar2(3000),
		newfilename varchar2(3000),
		originfilename varchar2(3000),
notice varchar2(3000));

create table deal(
d_no number primary key,
s_id varchar2(3000),
b_id varchar2(3000),
p_no number,
price varchar2(3000),
res_date varchar2(3000),
res_time varchar2(3000),
btel varchar2(3000),
stel varchar2(3000),
title varchar2(3000),
area varchar2(3000),
b_state varchar2(3000),
s_state varchar2(3000),
accept varchar2(3000)
);

create table hashtag(
h_no number,
h_name varchar2(3000),
p_no number,
type varchar2(3000));

create table auction(
	a_no number primary key,
	price varchar2(3000),
	content varchar2(3000),
	area varchar2(3000),
	originfilename varchar2(3000),
	newfilename varchar2(3000),
	location varchar2(3000),
	tel varchar2(3000),
	crn varchar2(3000),
	a_date date,
	confirm varchar2(3000),
	title varchar2(3000),
	id varchar2(3000),
	name varchar2(3000),
enddate varchar2(3000));

create table complain(
c_no number primary key,
id varchar2(3000),
p_no number,
content varchar2(3000),
title varchar2(3000),
c_date date);

create table review(
	r_no number primary key,
	p_no number,
	id varchar2(3000),
	average varchar2(3000),
	content varchar2(3000),
	good_count varchar2(3000),
	r_date date,
	originfilename varchar2(3000),
	newfilename varchar2(3000)
);



create table good(
	id varchar2(3000),
	good_state varchar2(3000),
	r_no number,
	p_no number
);

create table auctiontemp(
	a_no number primary key,
	price varchar2(3000),
	content varchar2(3000),
	area varchar2(3000),
	originfilename varchar2(3000),
	newfilename varchar2(3000),
	location varchar2(3000),
	tel varchar2(3000),
	crn varchar2(3000),
	a_date date,
	confirm varchar2(3000),
	title varchar2(3000),
	id varchar2(3000),
	name varchar2(3000),
enddate varchar2(3000));

CREATE SEQUENCE product_seq
start with 1
increment by 1
nomaxvalue
nocycle
nocache;

create sequence board_seq
	start with 1
	increment by 1
	nomaxvalue
	nocycle
	nocache;
create sequence deal_seq
	start with 1
	increment by 1
	nomaxvalue
	nocycle
	nocache;

create sequence auction_seq
increment by 1
nocycle
nomaxvalue
nocache;

create sequence auctiontemp_seq
increment by 1
nocycle
nomaxvalue
nocache;

 
create sequence complain_seq
increment by 1
nomaxvalue
nocache
nocycle;

create sequence review_seq start with 1 increment by 1 nomaxvalue nocycle nocache;

create sequence pointhistory_seq start with 1 increment by 1 nomaxvalue nocycle nocache;
create sequence hashtag_seq start with 1 increment by 1 nomaxvalue nocycle nocache;
create sequence a_deal_seq
	start with 1
	increment by 1
	nomaxvalue
	nocycle
	nocache;

alter table review add constraint fk_review_p_no foreign key(p_no) references product(p_no)
on delete cascade;
alter table review add constraint fk_review_id foreign key(id) references spaceuser(id) on delete cascade;


alter table complain add constraint fk_complain_id foreign key(id) references spaceuser(id) on delete cascade;
alter table complain add constraint fk_complain_p_no foreign key(p_no) references product(p_no) on delete cascade;

alter table hashtag add constraint fk_hashtag_p_no foreign key(p_no) references product(p_no) on delete cascade;


alter table deal add constraint fk_deal_s_id foreign key(s_id) references spaceuser(id) on delete cascade;
alter table deal add constraint fk_deal_b_id foreign key(b_id) references spaceuser(id) on delete cascade;
alter table deal add constraint fk_deal_p_no foreign key(p_no) references product(p_no) on delete cascade;
alter table good add constraint fk_good_id foreign key(id) references spaceuser(id) on delete cascade;
alter table good add constraint fk_good_p_no foreign key(p_no) references product(p_no) on delete cascade;
alter table good add constraint fk_good_r_no foreign key(r_no) references review(r_no) on delete cascade;

alter table bid add constraint fk_bid_id foreign key(id) references spaceuser(id)
on delete cascade;

alter table auction add constraint fk_auction_id foreign key(id) references spaceuser(id) on delete cascade;

alter table a_deal add constraint fk_a_deal_a_no foreign key(a_no) references auction(a_no) on delete cascade;

alter table a_deal add constraint fk_a_deal_id foreign key(id) references spaceuser(id)
on delete cascade;

alter table product add constraint fk_product_id foreign key(id) references spaceuser(id) on delete cascade;







create table amenties(
p_no number,
wifi number,
tv number,
printer number,
fax number,
aucostics number,
microphone number,
cooking number,
acceptFood number,
acceptDrink number,
shower number,
parking number,
smoking number,
pet number,
pc number,
labtop number,
desk number,
airconditioner number,
elevator number,
hairdryer number,
stand number,
aquaequipment number,
cctv number,
market number,
wheelchair number);

alter table amenties add constraint fk_amenties_p_no foreign key(p_no) references product(p_no) on delete cascade;

alter table product 
add(accomodation varchar2(3000));

alter table deal add(d_date date);

alter table pointhistory add(ph_date date);


alter table auction add(accomodation varchar2(3000));

alter table auctiontemp add(accomodation varchar2(3000));

alter table amenties add(a_no number);

alter table amenties add(atemp_no number);


alter table amenties add constraint fk_amenities_a_no foreign key(a_no) references auction(a_no) on delete cascade;

alter table amenties add constraint fk_amenities_atemp_no foreign key(atemp_no) references auctiontemp(a_no) on delete cascade;

alter table product add (area2 varchar2(3000));





alter table auction add(aoriginfilename varchar2(3000));

alter table auction add(anewfilename varchar2(3000));

alter table auctiontemp add(aoriginfilename varchar2(3000));

alter table auctiontemp add(anewfilename varchar2(3000));




drop table amenties;
commit;
create table amenities(
	p_no number,
	amenities varchar2(3000),
	a_no number,
 	atemp_no number);



alter table amenities add constraint fk_amenities_a_no foreign key(a_no) references auction(a_no) on delete cascade;
alter table amenities add constraint fk_amenities_atemp_no foreign key(atemp_no) references auctiontemp(a_no) on delete cascade;

