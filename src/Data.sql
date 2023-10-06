Drop table authors;

CREATE TABLE authors (
	au_id serial PRIMARY KEY,
	au_lname varchar,
	au_fname varchar,
	phone char(12),
	address varchar(40),
	city varchar (20),
	state char(2),
	zip char(5),
	contract bit NOT NULL 
);

insert into authors (au_lname,au_fname,phone,address,city,state,zip,contract)
values('Bennet', 'Abraham', '415 658-9932','6223 Bateman St.', 'Berkeley', 'CA', '94705', '1');
insert into authors (au_lname,au_fname,phone,address,city,state,zip,contract)
values('Green', 'Marjorie', '415 986-7020','309 63rd St. #411', 'Oakland', 'CA', '94618', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Carson', 'Cheryl', '415 548-7723','589 Darwin Ln.', 'Berkeley', 'CA', '94705', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Ringer', 'Albert', '801 826-0752','67 Seventh Av.', 'Salt Lake City', 'UT', '84152', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Ringer', 'Anne', '801 826-0752','67 Seventh Av.', 'Salt Lake City', 'UT', '84152', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('DeFrance', 'Michel', '219 547-9982','3 Balding Pl.', 'Gary', 'IN', '46403', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Panteley', 'Sylvia', '301 946-8853','1956 Arlington Pl.', 'Rockville', 'MD', '20853', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('McBadden', 'Heather','707 448-4982', '301 Putnam', 'Vacaville', 'CA', '95688', '0');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Stringer', 'Dirk', '415 843-2991','5420 Telegraph Av.', 'Oakland', 'CA', '94609', '0');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Straight', 'Dean', '415 834-2919','5420 College Av.', 'Oakland', 'CA', '94609', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Karsen', 'Livia', '415 534-9219','5720 McAuley St.', 'Oakland', 'CA', '94609', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('MacFeather', 'Stearns', '415 354-7128','44 Upland Hts.', 'Oakland', 'CA', '94612', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Dull', 'Ann', '415 836-7128','3410 Blonde St.', 'Palo Alto', 'CA', '94301', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Yokomoto', 'Akiko', '415 935-4228','3 Silver Ct.', 'Walnut Creek', 'CA', '94595', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('O''Leary', 'Michael', '408 286-2428','22 Cleveland Av. #14', 'San Jose', 'CA', '95128', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Gringlesby', 'Burt', '707 938-6445','PO Box 792', 'Covelo', 'CA', '95428', '0');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Greene', 'Morningstar', '615 297-2723','22 Graybar House Rd.', 'Nashville', 'TN', '37215', '0');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('White', 'Johnson', '408 496-7223','10932 Bigge Rd.', 'Menlo Park', 'CA', '94025', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('del Castillo', 'Innes', '615 996-8275','2286 Cram Pl. #86', 'Ann Arbor', 'MI', '48105', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Hunter', 'Sheryl', '415 836-7128','3410 Blonde St.', 'Palo Alto', 'CA', '94301', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Locksley', 'Charlene', '415 585-4620','18 Broadway Av.', 'San Francisco', 'CA', '94130', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Blotchet-Halls', 'Reginald', '503 745-6402','55 Hillsdale Bl.', 'Corvallis', 'OR', '97330', '1');
insert into authors(au_lname,au_fname,phone,address,city,state,zip,contract)
values('Smith', 'Meander', '913 843-0462','10 Mississippi Dr.', 'Lawrence', 'KS', '66044', '0');

CREATE TABLE cities(
idcity varchar(5) PRIMARY KEY,
city varchar(20) NOT NULL UNIQUE
);
