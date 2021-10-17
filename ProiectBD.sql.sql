#Crearea bazei de date
CREATE DATABASE IF NOT EXISTS wingchun;

#Utilizarea bazei de date
use wingchun;

#Crearea tabelelor folosite pentru proiect

CREATE TABLE IF NOT EXISTS curs (
	id_curs TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    denumire_curs VARCHAR(50) NOT NULL,
    durate_curs tinyint NOT NULL
);

#Vizualizarea structurii tabelei 
describe curs;

CREATE TABLE IF NOT EXISTS instructor (
	id_instructor TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nume_instructor VARCHAR(50) NOT NULL,
    prenume_instructor VARCHAR(70) NOT NULL,
    telefon_instructor char(10) NOT NULL unique
);

describe instructor;

CREATE TABLE IF NOT EXISTS curs_instructor(
	id TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_curs tinyint,
    id_instructor tinyint,
    FOREIGN KEY(id_curs) REFERENCES curs(id_curs),
    FOREIGN KEY(id_instructor) REFERENCES instructor(id_instructor)
);

describe curs_instructor;

CREATE TABLE IF NOT EXISTS locatie(
	id TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tara varchar(30) NOT NULL,
    oras varchar(40) NOT NULL,
    id_curs TINYINT,
    FOREIGN KEY(id_curs) REFERENCES curs(id_curs)
);

describe locatie;

CREATE TABLE IF NOT EXISTS antrenament(
	id TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    exercitiu varchar(60) NOT NULL,
    id_curs TINYINT,
    FOREIGN KEY(id_curs) REFERENCES curs(id_curs)
);

describe antrenament;

CREATE TABLE IF NOT EXISTS cursant(
	id_cursant TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nume_cursant varchar(50) NOT NULL,
    prenume_cursant varchar(60) NOT NULL,
    telefon_cursant char(10) NOT NULL UNIQUE,
    id_curs tinyint,
    FOREIGN KEY(id_curs) REFERENCES curs(id_curs)
);

describe cursant;

#Sa se adauge in tabela curs o coloana numita data_curs
ALTER TABLE curs ADD data_curs DATE;
describe curs;

#Sa se modifice coloana data_curs astfel incat mereu sa existe o valoare prezenta
ALTER TABLE curs CHANGE data_curs data_curs DATE NOT NULL;
describe curs;

#Sa se stearga coloana telefon_cursant din tabela cursant
ALTER TABLE cursant DROP telefon_cursant;
describe cursant;

#Sa se redenumeasca tabela locatie in pozitie
ALTER TABLE locatie RENAME TO pozitie;
describe pozitie;

#Sa se redenumeasca tabela pozitie in adresa
ALTER TABLE pozitie RENAME TO adresa;
describe adresa;


#Popularea tabelelor cu date

describe curs;
insert into curs values
	(null,'Pak Sao', 20,'2017-01-03'),
    (null,'Tan Sao', 10,'2018-02-23'),
    (null,'Lap Sao', 30,'2014-04-13'),
    (null,'Fook Sao', 15,'2018-02-14'),
    (null,'Bong Sao', 7,'2015-11-08'),
    (null,'Gaun Sao', 18,'2014-09-05'),
    (null,'Wu Sao', 23,'2016-07-02'),
    (null,'Fak Sao', 45,'2019-06-09'),
    (null,'Chung Jeung', 54,'2017-06-15');
insert into curs values (null,'Wang Jeung', 64,'2019-06-25');
select * from curs;

describe adresa;
insert into adresa values
	(null,'Romania', 'Braila',1),
    (null,'Franta', 'Paris',2),
    (null,'Spania', 'Madrid',3),
    (null,'Portugalia', 'Porto',4),
    (null,'Anglia', 'Londra',5),
    (null,'Rusia', 'Moscova',6),
    (null,'Romania', 'Bucuresti',7),
    (null,'Germania', 'Berlin',8),
    (null,'Polonia', 'Varsovia',9),
    (null,'Austria', 'Viena',10);
select * from adresa;

describe cursant;
insert into cursant values 
	(null, 'Popescu', 'Marian', 1),
    (null, 'Dobrescu', 'Mihai', 2),
    (null, 'Tanase', 'Cristian', 3),
    (null, 'Marin', 'Ionela', 4),
    (null, 'Avram', 'Paul', 5),
    (null, 'Dorin', 'Nicolae', 6),
    (null, 'Olteanu', 'Ion', 7),
    (null, 'Enache', 'Adrian', 8),
    (null, 'Cucu', 'Calin', 9),
    (null, 'Godina', 'Marian', 10);
select * from cursant;

describe antrenament;
insert into antrenament values 
	(null, 'Lovire cu pumnul', 1),
    (null, 'Aparare cu mana', 2),
    (null, 'Lovire cu piciorul', 3),
    (null, 'Aparare cu piciorul', 4),
    (null, 'Lovire in rafala', 5),
    (null, 'Pasul in triunghi', 6),
    (null, 'Gambe', 7),
    (null, 'Brate', 8),
    (null, 'Abdomen', 9),
    (null, 'Piept', 10);
select * from antrenament;

describe instructor;
insert into instructor values
	(null, 'Bruce', 'Lee', 1),
    (null, 'Jackie', 'Chan', 2),
    (null, 'Chuck', 'Norris', 3),
    (null, 'Steven', 'Seagal', 4),
    (null, 'Miyamoto', 'Musashi', 5),
    (null, 'Ip', 'Man', 6),
    (null, 'Tony', 'Jaa', 7),
    (null, 'Jet', 'Li', 8),
    (null, 'Conor', 'McGregor', 9),
    (null, 'Kano', 'Jigoro', 10);
select * from instructor;

describe curs_instructor;
insert into curs_instructor values 
	(null, 1, 1),
    (null, 2, 2),
    (null, 3, 3),
    (null, 4, 4),
    (null, 5, 5),
    (null, 6, 6),
    (null, 7, 7),
    (null, 8, 8),
    (null, 9, 9),
    (null, 10, 10);
select * from curs_instructor;

#Sa se adauge in tabela curs o coloana numita pret
ALTER TABLE curs ADD pret FLOAT(6,2) NOT NULL DEFAULT 1400;
describe curs;

#Sa se completeze inregistrarile din tabela curs cu pretul
update curs set pret = 2000 where id_curs = 1;
update curs set pret = 4500 where id_curs = 3;
update curs set pret = 1200 where id_curs = 4;
update curs set pret = 500 where id_curs = 5;
update curs set pret = 3467 where id_curs = 6;
update curs set pret = 5372 where id_curs = 7;
update curs set pret = 2300 where id_curs = 8;
update curs set pret = 5000 where id_curs = 9;
update curs set pret = 7812 where id_curs = 10;
select * from curs;

#Setarea datei pentru cursul cu denumirea Fook Sao cu data curenta si schimbare numelui in Pak Da
SET sql_safe_updates = 0;
update curs set data_curs = curdate() where denumire_curs = 'Fook Sao';
update curs set denumire_curs = 'Pak Da' where denumire_curs = 'Fook Sao';

#Majorarea pretului cu 10% pentru cursurile cu durata mai mare de 30 minute
update curs set pret = pret + 0.1 * pret where pret > 30;
SET sql_safe_updates = 1;

#Sa se adauge in tabela instructor o coloana numita tarif si o coloana numita data_disponibilitate
ALTER TABLE instructor ADD tarif FLOAT(6,2) NOT NULL;
ALTER TABLE instructor ADD data_disponibilitate DATE;
ALTER TABLE instructor CHANGE data_disponibilitate data_disponibilitate DATE NOT NULL;
describe instructor;

#Sa se completeze cele 2 coloane adaugate mai sus cu date 
update instructor set tarif = 1234 where id_instructor = 1;
update instructor set tarif = 4500 where id_instructor = 2;
update instructor set tarif = 1900 where id_instructor = 3;
update instructor set tarif = 8000 where id_instructor = 4;
update instructor set tarif = 5600 where id_instructor = 5;
update instructor set tarif = 4300 where id_instructor = 6;
update instructor set tarif = 2800 where id_instructor = 7;
update instructor set tarif = 7322 where id_instructor = 8;
update instructor set tarif = 4900 where id_instructor = 9;
update instructor set tarif = 9800 where id_instructor = 10;

update instructor set data_disponibilitate = '2020-02-02' where id_instructor = 1; 
update instructor set data_disponibilitate = '2019-04-04' where id_instructor = 2; 
update instructor set data_disponibilitate = '2018-06-07' where id_instructor = 3; 
update instructor set data_disponibilitate = '2017-08-09' where id_instructor = 4; 
update instructor set data_disponibilitate = '2016-01-03' where id_instructor = 5; 
update instructor set data_disponibilitate = '2015-03-06' where id_instructor = 6; 
update instructor set data_disponibilitate = '2014-05-08' where id_instructor = 7; 
update instructor set data_disponibilitate = '2015-07-09' where id_instructor = 8; 
update instructor set data_disponibilitate = '2017-09-12' where id_instructor = 9; 
update instructor set data_disponibilitate = curdate() where id_instructor = 10;

select * from instructor; 

#Stergerea instructorului a carui data de disponibilitate este egala cu data curenta
SET sql_safe_updates = 0;
select * from instructor where data_disponibilitate = curdate();
delete from curs_instructor where id_instructor = 10; # stergerea cheii straine din tabela copil
delete from instructor where data_disponibilitate = curdate(); #stergerea din tabela parinte
SET sql_safe_updates = 1;

#Stergerea instructorilor care au tariful mai mic de 3000
select * from instructor where tarif < 3000; #id_instructor 1,3,7
delete from curs_instructor where id_instructor in (1,3,7);
delete from instructor where tarif < 3000;
select * from instructor;

truncate curs_instructor;
select * from curs_instructor;
SET FOREIGN_KEY_CHECKS = 0;
truncate instructor;
select * from instructor;
SET FOREIGN_KEY_CHECKS = 1;


describe instructor;
insert into instructor (id_instructor,nume_instructor,prenume_instructor, telefon_instructor) values
	(null, 'Bruce', 'Lee', '0771342567'),
    (null, 'Jackie', 'Chan', '0772342567'),
    (null, 'Chuck', 'Norris', '0773342567'),
    (null, 'Steven', 'Seagal', '0774342567'),
    (null, 'Miyamoto', 'Musashi', '0775342567'),
    (null, 'Ip', 'Man', '0776342567'),
    (null, 'Tony', 'Jaa', '077344567'),
    (null, 'Jet', 'Li', '0771342577'),
    (null, 'Conor', 'McGregor', '0771342569'),
    (null, 'Kano', 'Jigoro', '0771342568');
select * from instructor;

#Sa se adauge in tabela instructor o coloana numita maestru
ALTER TABLE instructor ADD maestru ENUM('Da', 'Nu');
describe instructor;

#Sa se completeze daca instructorii sunt maestri sau nu
update instructor set maestru = 'Da' where id_instructor = 1; 
update instructor set maestru = 'Nu' where id_instructor = 2; 
update instructor set maestru = 'Nu' where id_instructor = 3; 
update instructor set maestru = 'Da' where id_instructor = 4; 
update instructor set maestru = 'Nu' where id_instructor = 5; 
update instructor set maestru = 'Da' where id_instructor = 6; 
update instructor set maestru = 'Da' where id_instructor = 7; 
update instructor set maestru = 'Nu' where id_instructor = 8; 
update instructor set maestru = 'Nu' where id_instructor = 9; 
update instructor set maestru = 'Da' where id_instructor = 10;

#Sa se afiseze nr de  instructori care sunt maestri si care nu sunt maestri
select count(*) as nrMaestri, maestru from instructor group by maestru;

#Sa se afiseze tariful minim pentru instructori
select min(tarif) tarifMediu from instructor;

#Sa se afizeze numele si prenumele instructorilor care sunt maestri si care nu sunt
select maestru, group_concat( nume_instructor,' ',prenume_instructor separator ' - ') as listaInstructori from instructor group by maestru;  

#Sa se afizese instructorii cu tariful mediu mai mare sau egal cu 4000
select nume_instructor, prenume_instructor, maestru, avg(tarif) as tarifMediu from instructor group by maestru having tarifMediu >= 4000;

#Daca anul din data_disponibilitate este mai mare de 2017 disponibilitate imediata, altfel disponibilitate la distanta
select nume_instructor, prenume_instructor, if(year(data_disponibilitate) > 2017, 'DISPONIBILITATE IMEDIATA', 'DISPONIBILITATE LA DISTANTA') as concluzieDisponibiliate from instructor;

#Daca tariful > 8000 atunci instructor scump, daca tariful intre 4000 si 7000 atunci instructor mediu, altfel instructor ieftin
select nume_instructor, prenume_instructor, if(tarif>8000, 'instructor scump', if(tarif >= 4000 and tarif <= 7000, 'instructor mediu', 'instructor ieftin')) as concluzieTarif from instructor;

#Daca maestru = da si tarif > 8000 merita, altfel nu merita
select nume_instructor, prenume_instructor, if(maestru='Da' and tarif > 8000, 'Merita', 'Nu merita') as concluzie from instructor;

#Sa se afiseze cursul care are exercitiul Lovire in rafala
select denumire_curs from curs, antrenament where curs.id_curs=antrenament.id_curs and exercitiu='Lovire in rafala';

#Sa se afiseze cursul pe care il are de efectuat cursantul cu numele Godina
select denumire_curs from curs join cursant on curs.id_curs = cursant.id_curs and nume_cursant='Godina';

#Sa se afiseze cursul instructorului cu numele Bruce
select denumire_curs 
from instructor 
left join curs_instructor on instructor.id_instructor = curs_instructor.id_instructor 
left join curs on curs.id_curs = curs_instructor.id_curs where nume_instructor='Bruce';

#Sa se afiseze exercitiul care este inclus in cursul Pak Sao
select exercitiu from antrenament where id_curs = (select id_curs from curs where denumire_curs='Pak Sao');

#Sa se afiseze instructorul pentru cursantul cu numele Olteanu
select concat(nume_instructor,' ',prenume_instructor) as numeComplet 
from instructor 
left join curs_instructor on instructor.id_instructor = curs_instructor.id_instructor 
left join curs on curs.id_curs = curs_instructor.id_curs where curs.id_curs = (select id_curs from cursant where nume_cursant = 'Olteanu');

#Sa se afiseze cursurile tinute de instructori maestri
select denumire_curs from curs where id_curs in (select id_instructor from instructor where maestru='Da');

#Sa se afiseze tara si orasul cursului tinut de instructorul cu numrele Bruce
select tara, oras from adresa where (id_curs) = (select curs.id_curs from curs left join curs_instructor on curs_instructor.id_curs = curs.id_curs left join instructor i on i.id_instructor = curs_instructor.id_instructor where nume_instructor = 'Bruce');

#Tabela virtuala unde se vede fiecare instructor ce curs tine
CREATE OR REPLACE VIEW instructori_cursuri as select concat(nume_instructor,' ',prenume_instructor) as numeComplet, denumire_curs from instructor
left join curs_instructor on instructor.id_instructor = curs_instructor.id_instructor 
left join curs on curs.id_curs = curs_instructor.id_curs;

#Tabela virtuala in care apare cursantii care au cursuri cu tara=Romania
CREATE OR REPLACE VIEW cursanti_Romania as select nume_cursant, prenume_cursant from cursant left join curs on curs.id_curs = cursant.id_curs left join adresa on curs.id_curs=adresa.id_curs where tara='Romania';

#Tabela virtuala in care apar exercitiile a caror cursuri sunt tinute de un instructor maestru si cu anul datei de disponibilitate > 2018
CREATE OR REPLACE VIEW exercitiiInstructorMaestru as select exercitiu from antrenament left join curs on antrenament.id_curs=curs.id_curs left join curs_instructor on curs.id_curs=curs_instructor.id_curs left join instructor on instructor.id_instructor = curs_instructor.id_instructor
where year(data_disponibilitate) > 2018 and maestru='Da';


#Sa se creeze o procedura unde se afiseaza nr de cursanti
DELIMITER //
CREATE PROCEDURE afisareNrCursanti()
BEGIN
	SELECT count(*) FROM cursant;
END
//
DELIMITER ;
call afisareNrCursanti();


#Sa se creeze o procedura unde se afiseaza numarul de instructori maestri 
DELIMITER //
CREATE PROCEDURE afisareNrInstructoriMaestri(in esteMaestru VARCHAR(10))
BEGIN
	SELECT count(*) FROM instructor where maestru = esteMaestru;
END
//
DELIMITER ;
call afisareNrInstructoriMaestri('Da');


#Sa se calculeze valoarea instructorilor maestrilor care predau cursuri in Romania 
SET @valoare := 0;
select @valoare;

DELIMITER //
CREATE PROCEDURE valoareInstructoriMaestri(in esteMaestru VARCHAR(10), out valoareMaestri double(7,2))
BEGIN
	SELECT count(*) * sum(tarif) into valoareMaestri from instructor 
													 left join curs_instructor on curs_instructor.id_instructor=instructor.id_instructor 
                                                     left join curs on curs_instructor.id_curs=curs.id_curs 
                                                     left join adresa on adresa.id_curs=curs.id_curs 
                                                     where maestru = esteMaestru and tara='Romania';
END
//
DELIMITER ;
call valoareInstructoriMaestri('Da', @valoare);
select @valoare;


#Sa se creeze o procedura unde se afiseaza datele de contact(numarul de telefon) al instructorului care preda in Franta 
select telefon_instructor from adresa left join curs on adresa.id_curs=curs.id_curs left join curs_instructor on curs_instructor.id_curs=curs.id_curs left join instructor on curs_instructor.id_instructor=instructor.id_instructor where tara='Franta';
SET @telefon = '';
select @telefon;

DELIMITER //
CREATE PROCEDURE telefonInstructor(out telefonInstructor VARCHAR(20))
BEGIN
	select telefon_instructor into telefonInstructor from adresa 
    left join curs on adresa.id_curs=curs.id_curs 
    left join curs_instructor on curs_instructor.id_curs=curs.id_curs 
    left join instructor on curs_instructor.id_instructor=instructor.id_instructor 
    where tara='Franta';
END
//
DELIMITER ;
call telefonInstructor(@telefon);
select @telefon;

#Sa se creeze o functie care ia ca parametri: id-ul instructorului si un prag maxim pentru care se accepta indrumarea instructorului
#Daca tariful este mai mare de prag=> se respinge instructorul, altfel se accepta

DELIMITER //
CREATE FUNCTION decizieInstructor(idInstructor int, pragMax int) RETURNS VARCHAR(100)
BEGIN
	
    DECLARE tarifFinal FLOAT(6,2);
    DECLARE mesaj VARCHAR(100);
    
	SELECT tarif INTO tarifFinal FROM instructor AS i WHERE i.id_instructor = idInstructor;
    
    IF tarifFinal < pragMax THEN
		SET mesaj:='Instructor acceptat!!';
	ELSE
		SET mesaj:='Instructor respins!!';
    END IF;
    
    #functii conditionale IF - recapitulat!! -CURS4
    
    RETURN mesaj;
END;
//
DELIMITER ;

select decizieInstructor(2,5000);

# Sa se scrie o functie care primeste ca parametru id-ul cursului si returneaza un mesaj in functie de intervalul preturilor in care se afla cursul dorit

DELIMITER // 
CREATE FUNCTION valoareCurs(idCurs int(11)) RETURNS VARCHAR(50)
BEGIN

    DECLARE pretCurs float(6,2);
	DECLARE mesaj VARCHAR(50);

	SELECT pret INTO pretCurs FROM curs WHERE curs.id_curs = idCurs;    
    
    CASE pretCurs
		WHEN pretCurs > 1000.00 and pretCurs < 2000.00 THEN set mesaj:='Cursul se afla in intervalul 1000-2000 lei';
        WHEN pretCurs > 2000.00 and pretCurs < 3000.00 THEN set mesaj:='Cursul se afla in intervalul 2000-3000 lei';
        WHEN pretCurs > 3000.00 and pretCurs < 4000.00 THEN set mesaj:='Cursul se afla in intervalul 3000-4000 lei';
        WHEN pretCurs > 4000.00 and pretCurs < 5000.00 THEN set mesaj:='Cursul se afla in intervalul 4000-5000 lei';
        WHEN pretCurs > 5000.00 and pretCurs < 6000.00 THEN set mesaj:='Cursul se afla in intervalul 5000-6000 lei';
        WHEN pretCurs > 6000.00 and pretCurs < 7000.00 THEN set mesaj:='Cursul se afla in intervalul 6000-7000 lei';
        WHEN pretCurs > 7000.00 and pretCurs < 8000.00 THEN set mesaj:='Cursul se afla in intervalul 7000-8000 lei';
        WHEN pretCurs > 8000.00 and pretCurs < 9000.00 THEN set mesaj:='Cursul se afla in intervalul 8000-9000 lei';
        WHEN pretCurs > 9000.00 and pretCurs < 10000.00 THEN set mesaj:='Cursul se afla in intervalul 9000-10000 lei';
		else set mesaj:='nu exista curs cu acest index';
	END CASE;
    
    return mesaj;
    
END;
//
DELIMITER ;

select valoareCurs(2);

#Sa se scrie o functie care ia ca parametru durata cursului si afiseaza numele si prenumele instructorului care preda in tara Romania
DELIMITER // 
CREATE FUNCTION numeCompletInstructor(durata tinyint(4)) RETURNS VARCHAR(50)
BEGIN

	DECLARE nume VARCHAR(50);

	select concat(nume_instructor, ' ', prenume_instructor) into nume from curs left join adresa on curs.id_curs = adresa.id_curs  
					         left join curs_instructor on curs_instructor.id_curs=curs.id_curs 
						     left join instructor on curs_instructor.id_instructor=instructor.id_instructor where tara='Romania' and  durate_curs = durata;   
    
    return nume;
    
END;
//
DELIMITER ;

select numeCompletInstructor(20);
select numeCompletInstructor(23);

#Sa se creeze un tabel instructori_disponibili
CREATE TABLE IF NOT EXISTS instructori_disponibili(
    ID TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nume VARCHAR(200) NOT NULL,
    prenume VARCHAR(100) NOT NULL,
    telefon CHAR(10) NOT NULL
);

#Sa se faca o procedura cu un cursor care sa insereze in tabela instructori_disponibili date despre instructorii care pot tine cursuri(data_disponibilitate < data curenta)

DELIMITER // 
CREATE PROCEDURE cauta_instructori_disponibili()
BEGIN
	DECLARE v_nume VARCHAR(200);
    DECLARE v_prenume VARCHAR(200);
    DECLARE v_telefon CHAR(10);
    DECLARE v_semafor VARCHAR(10) DEFAULT 'verde';

	DECLARE c CURSOR FOR SELECT nume_instructor, prenume_instructor, telefon_instructor FROM instructor WHERE data_disponibilitate < curdate();
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    BEGIN
		set v_semafor ='rosu';
    END;
    
    OPEN c;
    
    instructori_disponibili:LOOP
		FETCH c INTO v_nume, v_prenume, v_telefon;
        IF v_semafor = 'rosu' THEN 
			LEAVE instructori_disponibili;
		ELSE 
			INSERT INTO	 instructori_disponibili VALUES (NULL, v_nume, v_prenume, v_telefon);
		END IF;
	END LOOP;
    
    CLOSE C;
    
END;
// 
DELIMITER ;
CALL cauta_instructori_disponibili();
SELECT * FROM instructori_disponibili;


#Sa se mai insereze un exercitiu in tabela antrenament
insert into antrenament values
	(null, 'Cardio', 1);

#Sa se scrie o functie cu un cursor care ia ca parametru numele cursului si orasul locatie si afiseaza exercitiile care se fac 
DELIMITER //
CREATE FUNCTION afla_exercitii(numeCurs VARCHAR(100),orasLocatie VARCHAR(100)) RETURNS VARCHAR(200)
BEGIN 
	DECLARE v_oras_locatie VARCHAR(200);
    DECLARE v_semafor VARCHAR(10) DEFAULT 'verde';
    DECLARE v_lista_exercitii VARCHAR(200);
    
	DECLARE c CURSOR FOR select exercitiu from antrenament left join curs on antrenament.id_curs = curs.id_curs left join adresa on adresa.id_curs = curs.id_curs where denumire_curs=numeCurs and oras=orasLocatie;
    
	DECLARE CONTINUE HANDLER FOR NOT FOUND
    BEGIN
		SET v_semafor = 'rosu';
	END;
    
    OPEN c;
		exercitii:LOOP
			FETCH c INTO v_lista_exercitii;
			IF v_semafor ='rosu' THEN 
				LEAVE exercitii;
			ELSE
				SET v_lista_exercitii = concat_ws(',', v_oras_locatie, v_lista_exercitii);
			END IF;
		END LOOP;
    CLOSE c;
    
    return v_lista_exercitii;
END;
//
DELIMITER ;

SELECT afla_exercitii('Pak Sao','Braila');

#Sa se o functie cu un cursor care pe baza numelui cursantului inscris se afiseaza numele cursului si instructorul care tine acel curs 

DELIMITER //
CREATE FUNCTION afla_informatii(numeCursant VARCHAR(100)) RETURNS VARCHAR(200)
BEGIN 
	DECLARE v_denumire_curs VARCHAR(200);
    DECLARE v_nume_instructor VARCHAR(200);
    DECLARE v_prenume_instructor VARCHAR(200);
    DECLARE v_semafor VARCHAR(10) DEFAULT 'verde';
    DECLARE v_informatii VARCHAR(200);
    
	DECLARE c CURSOR FOR select denumire_curs, nume_instructor, prenume_instructor from curs 
							left join curs_instructor on curs.id_curs=curs_instructor.id_curs 
							left join instructor on instructor.id_instructor = curs_instructor.id_instructor 
							left join cursant on curs.id_curs=cursant.id_curs
							where nume_cursant = numeCursant;
    
	DECLARE CONTINUE HANDLER FOR NOT FOUND
    BEGIN
		SET v_semafor = 'rosu';
	END;
    
    OPEN c;
		informatii:LOOP
			FETCH c INTO v_denumire_curs, v_nume_instructor, v_prenume_instructor;
			IF v_semafor ='rosu' THEN 
				LEAVE informatii;
			ELSE
				SET v_informatii = concat_ws('-', v_denumire_curs,v_nume_instructor, v_prenume_instructor);
			END IF;
		END LOOP;
    CLOSE c;
    
    return v_informatii;
END;
//
DELIMITER ;

SELECT afla_informatii('Cucu');


#Sa se scrie un trigger care se declanseaza dupa fiecare adaugare a unui nou curs si populeaza tabela cursant 
DELIMITER //
CREATE TRIGGER after_curs_insert AFTER INSERT ON curs
FOR EACH ROW
BEGIN
	INSERT INTO cursant VALUES (NULL, user(), user(), NEW.id_curs);
END;
//
DELIMITER ;

insert into curs values(null, 'Tan Da',50,curdate(),5000);
select * from curs;
select * from cursant;

#Sa se scrie un trigger care se declanseaza inainte de fiecare adaugare a unui nou instructor

DELIMITER //
CREATE TRIGGER before_insert_instructor BEFORE INSERT ON instructor
FOR EACH ROW
BEGIN

    IF NEW.tarif > 4000 THEN
        SET NEW.tarif = 4000;
    END IF;
    
    SET NEW.nume_instructor = TRIM(upper(NEW.nume_instructor));
    
    SET NEW.data_disponibilitate = DATE_ADD(curdate(), INTERVAL -2 MONTH); 

END;
//
DELIMITER ;

insert into instructor values(null, 'Popescu', 'Marian', '0778964123', 5500, '2021-09-18', 'Da');
select * from instructor;


#Sa se scrie un trigger dupa fiecare adaugare si schimbare a pretului sau denumire curs acolo unde pretul sau denumirea sunt modificate
DELIMITER //
CREATE TRIGGER after_curs_update AFTER UPDATE ON curs
FOR EACH ROW
BEGIN
	
    IF OLD.pret!= NEW.pret THEN 
		INSERT INTO instructor VALUES(null, user(), user(), '', NEW.pret, curdate(), 'Nu');
    END IF;

END;
//
DELIMITER ;

select * from curs;
update curs set pret = '5000' where id_curs = 4;
select * from instructor;
