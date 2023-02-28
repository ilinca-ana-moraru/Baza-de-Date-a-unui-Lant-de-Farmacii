create table FARMACIE
(
id_farmacie number(4,0),
adresa varchar2(50) not null unique,
nr_telefon varchar2(10) not null unique,
constraint pk_farmacie primary key(id_farmacie),
constraint lungime_telefon_farmacie check(length(nr_telefon) = 10)
);


create table FARMACIST(
id_farmacist number(6,0),
id_farmacie number(4,0),
salariu number(6,0),
nume varchar2(30) not null unique,
nr_telefon varchar2(10) not null unique,
constraint pk_farmacist primary key(id_farmacist),
constraint fk_farmacist foreign key (id_farmacie) references FARMACIE(id_farmacie) on delete set null,
constraint lungime_telefon_farmacist check(length(nr_telefon) = 10)
);
alter table farmacist
add constraint salariu_pozitiv check(salariu >=0);

create table COLECTOR_EXPIRATE(
id_colector number(2,0),
nume_firma varchar2(20) not null unique,
adresa varchar2(50) unique,
nr_telefon varchar2(10) not null unique,
email varchar2(30) not null unique,
constraint pk_colector primary key(id_colector),
constraint lungime_telefon_colector check(length(nr_telefon) = 10)
);

create table COLECTARE(
id_farmacie number(4,0),
id_colector number(2,0),
data_colectare date,
constraint pk_fk_colector primary key(id_farmacie, id_colector, data_colectare),
foreign key(id_farmacie) references FARMACIE(id_farmacie) on delete cascade,
foreign key(id_colector) references COLECTOR_EXPIRATE(id_colector) on delete cascade
);


create table PRODUCATOR(
id_producator number(3,0),
nume_firma varchar2(20) not null unique,
adresa varchar2(50) unique,
nr_telefon varchar2(10) not null unique,
email varchar2(30) not null unique,
constraint pk_producator primary key(id_producator),
constraint lungime_telefon_producator check(length(nr_telefon) = 10)
);


create table DISTRIBUIRE(
id_farmacie number(4,0),
id_producator number(4,0),
data_distribuire date,
constraint pk_fk_distribuire primary key(id_farmacie, id_producator, data_distribuire),
foreign key(id_farmacie) references FARMACIE(id_farmacie) on delete cascade,
foreign key(id_producator) references PRODUCATOR(id_producator) on delete cascade
);

create table TRANZACTIE(
id_tranzactie number(15),
data_tranzactie date not null,
suma number(5) not null,
constraint pk_tranzactie primary key(id_tranzactie)
);

create table PRODUS(
id_produs number(20),
id_tranzactie number(15),
id_farmacie number(4),
medicament varchar2(30) not null,
lot varchar2(10) not null,
data_fabricare date not null,
data_expirare date not null,
pret number(5),
constraint pk_produs primary key(id_produs),
constraint fk1_produs foreign key(id_tranzactie) references TRANZACTIE(id_tranzactie),
constraint fk2_produs foreign key(id_farmacie) references FARMACIE(id_farmacie),
constraint sens_date check(data_fabricare <= data_expirare)
);
alter table produs
add constraint pret_pozitiv check(pret >= 0);

create table CLIENT(
id_client number(7),
nume varchar2(30) unique,
nr_telefon varchar2(10) unique,
email varchar2(30) unique,
constraint pk_client primary key(id_client),
constraint lungime_telefon_client check(length(nr_telefon) = 10)
);

create table RETETA(
id_reteta number(10),
id_client number(7) not null,
medic varchar2(30) not null,
data_eliberare date not null,
constraint pk_reteta primary key(id_reteta),
constraint fk_reteta foreign key(id_client) references CLIENT(id_client)
);

create table ATASAT_LA(
id_tranzactie number(15),
id_reteta number(10),
data date,
constraint pk_atasat_la primary key(id_tranzactie, id_reteta),
constraint fk1_atasat_la foreign key(id_tranzactie) references TRANZACTIE(id_tranzactie) on delete cascade,
constraint fk2_atasat_la foreign key(id_reteta) references RETETA(id_reteta) on delete cascade
);




insert into farmacie
values (1,'Bucuresti, Strada Teiului nr 15','0741278450');

insert into farmacie
values (2,'Bacau, Strada Prelungirea Bradului nr 30','0743954859');

insert into farmacie
values (3,'Buzau, Strada Prieteniei nr 96','0747623069');

insert into farmacie
values (4,'Bucuresti, Bulevardul Constitutiei nr 302','0740945358');

insert into farmacie
values (5,'Galati, Calea Noua nr 18','0742176464');

insert into farmacie
values (6,'Bucuresti, Strada Drumul Taberei nr 104','0740988360');







insert into farmacist
values(1, 4, 4500, 'Petrache Mihaela','0743759120');

insert into farmacist
values(2, 2, 4500, 'Lacatusu Andrei', '0749348603');

insert into farmacist
values(3, 2, 5000, 'Mihalache Ioana', '0746723577');

insert into farmacist
values(4, 3, 4700, 'Codruta Ana', '0740988523');

insert into farmacist
values(5, 6, 4000, 'Mandache Cosmina', '0740673496');

insert into farmacist
values(6, 1, 5400, 'Barbu Ion', '0745983069');

insert into farmacist
values(7, 5, 7000, 'Mihail Marius', '0749678456');

insert into farmacist
values(8, 3, 4500, 'Romanescu Raluca', '0748503953');

insert into farmacist
values(9, 1, 5000, 'Calinescu Claudiu', '0749504581');

insert into farmacist
values(10, 5, 5400, 'Stefan Robert', '0740583958');

insert into farmacist
values(11, 4, 4000, 'Piper Mara', '0749503958');

insert into farmacist
values(12, 3, 4800, 'Papuc Sabina', '0740485693');

insert into farmacist
values(13, 3, 6200, 'Mihalache Alin', '0740593850');

insert into farmacist
values(14, 2, 4800, 'Caraiman Luca', '0749503812');

insert into farmacist
values(15, 5, 5200, 'Catarama Maria', '0740495027');

insert into farmacist
values(16, 1, 6500, 'Moise Adriana', '0740485910');

insert into farmacist
values(17, 3, 5500, 'Moraru Ilinca', '0740483910');



insert into client
values(1,'Ionescu Daria','0746739673','ionescudaria@gmail.com');

insert into client
values(2,'Damian Carla','0746748394','damiancarla@gmail.com');

insert into client
values(3,'Dan Alex','0746739710','danalex@gmail.com');

insert into client
values(4,'Cortu Miruna','0746739601','cortumiruna@gmail.com');

insert into client
values(6,'Carie Danut','0745707815','cariedan@gmail.com');

insert into colector_expirate
values (1, 'ColectRO','Bucuresti Bulevardul Unirii nr 387','0747849275','colectro@gmail.com');

insert into colector_expirate
values (2, 'FarmColect','Buzau Strada Stefan cel Mare nr 13','0746748295','FarmColect@gmail.com');

insert into colector_expirate
values (3, 'MirelColectSRL','Bucuresti Strada Luceafarul nr 4','0747830581','mirelcolector@gmail.ro');

insert into colector_expirate
values (4, 'WasteAdministration','Bucuresti Strada Alexandru Ioan Cuza nr 34','0746749570','wasteAdministration@gmail.com');

insert into colector_expirate
values (5, 'DeseuCoord','Suceava Strada Pacii nr 51','0745638603','DeseuCoord@gmail.com');


insert into produs values
(1,null,1,'Nurofen',967,'5-Jan-2022','7-Nov-2023',30);

insert into produs values
(2,null,3,'NoSpa',3868,'11-Dec-2022','15-Apr-2023',56);

insert into produs values
(3,null,2,'Triferment',8703,'19-Oct-2022','25-May-2023',82);

insert into produs values
(4,null,3,'Paracetamol',15472,'29-May-2022','7-Nov-2023',28);

insert into produs values
(5,null,1,'Panadol',24175,'11-Feb-2022','21-Oct-2023',54);

insert into produs values
(6,null,1,'Ketonal',34812,'25-Feb-2022','7-Jan-2023',80);

insert into produs values
(7,null,3,'Nurofen',47383,'11-Aug-2022','25-Feb-2023',26);

insert into produs values
(8,null,2,'Panadol',61888,'29-Jan-2022','15-Dec-2023',52);

insert into produs values
(9,null,3,'Aspirina',78327,'19-Aug-2022','7-Mar-2023',78);

insert into produs values
(10,null,1,'NoSpa',96700,'11-Sep-2022','1-Feb-2023',24);

insert into produs values
(11,null,1,'Triferment',117007,'5-Dec-2022','27-Jan-2023',50);

insert into produs values
(19,null,3,'Aerius',349087,'29-Nov-2022','7-Nov-2023',18);

insert into produs values
(20,null,1,'BiomicinForte',386800,'11-Mar-2022','21-Jan-2023',44);

insert into produs values
(21,null,1,'BiomicinForte',426447,'25-May-2022','7-Apr-2023',70);

insert into produs values
(22,null,3,'Biomicin',468028,'11-Dec-2022','25-Apr-2023',16);

insert into produs values
(23,null,2,'NurofenForte',511543,'29-Sep-2022','15-Apr-2023',42);

insert into produs values
(25,null,1,'Panadol',604375,'11-Dec-2022','1-Oct-2023',14);

insert into produs values
(26,null,1,'Sindolor',653692,'5-Jan-2022','27-Nov-2023',40);

insert into produs values
(27,null,3,'SindolorGel',704943,'1-Mar-2022','25-Dec-2023',66);

insert into produs values
(28,null,2,'Aerius',758128,'29-Nov-2022','25-Mar-2023',12);

insert into produs values
(29,null,3,'Spasmomen',813247,'29-Jan-2022','27-Jan-2023',38);

insert into produs values
(30,null,1,'Tusocalm',870300,'1-Mar-2022','1-Nov-2023',64);

insert into produs values
(31,null,1,'Antinevralgic',929287,'5-Feb-2022','7-Mar-2023',10);

insert into produs values
(32,null,3,'Nexium',990208,'11-Oct-2022','15-Jun-2023',36);

insert into produs values
(33,null,2,'Coldrex',1053063,'19-Jul-2022','25-Jul-2023',62);

insert into produs values
(34,null,3,'Osteocare',1117852,'29-Jun-2022','7-Feb-2023',8);

insert into produs values
(35,null,1,'Spasmomen',1184575,'11-Oct-2022','21-Dec-2023',34);

insert into produs values
(36,null,1,'Antinevralgic',1253232,'25-Jan-2022','7-Mar-2023',60);

delete from reteta;
insert into reteta
values(1,3,'Popa Luminita','23-Feb-2022');

insert into reteta
values(2,6,'Carmen Claudia','2-Feb-2022');

insert into reteta
values(3,1,'Robert Claudiu','12-Feb-2022');

insert into reteta
values(4,4,'Codrea Cosmina','20-Feb-2022');

insert into reteta
values(5,4,'Codrea Cosmina','20-Feb-2022');

insert into reteta
values(6,2,'Tudor Adrian','26-Feb-2022');


insert into tranzactie
values(1,'23-Feb-2022',48);

insert into tranzactie
values(2,'05-Jan-2022',40);

insert into tranzactie
values(3,'14;Feb-2022',46);

insert into tranzactie
values(4,'20-Feb-2022',30);

insert into distribuire values
(5,1,'1-Jan-2022');

insert into distribuire values
(1,2,'4-Feb-2022');

insert into distribuire values
(2,5,'9-Dec-2022');

insert into distribuire values
(3,2,'16-Mar-2022');

insert into distribuire values
(4,1,'25-Jul-2022');

insert into distribuire values
(5,2,'6-Jul-2022');

insert into distribuire values
(1,5,'19-Oct-2022');

insert into distribuire values
(2,2,'4-May-2022');

insert into distribuire values
(3,1,'21-Jun-2022');

insert into distribuire values
(4,2,'10-Sep-2022');

insert into distribuire values
(5,5,'1-Nov-2022');

insert into distribuire values
(1,2,'24-Dec-2022');

insert into distribuire values
(2,1,'19-Feb-2022');

insert into distribuire values
(4,5,'15-Jul-2022');

insert into distribuire values
(5,2,'16-Nov-2022');

insert into distribuire values
(1,1,'19-Nov-2022');

insert into distribuire values
(2,2,'24-Apr-2022');

insert into distribuire values
(3,5,'1-Apr-2022');

alter table produs
update id_tranzactie = 2
where id_produs = 1;

alter table produs
update id_tranzactie = 4
where id_produs = 2;

alter table produs
update id_tranzactie = 1
where id_produs = 5;

alter table produs
update id_tranzactie = 1
where id_produs = 6;

alter table produs
update id_tranzactie = 3
where id_produs = 7;