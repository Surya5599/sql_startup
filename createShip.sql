DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS  Cruise;
DROP TABLE IF EXISTS Schedule;
DROP TABLE IF EXISTS Ship ;
DROP TABLE IF EXISTS  Technician;
DROP TABLE IF EXISTS Captain;
DROP TABLE IF EXISTS Crew ;
DROP TABLE IF EXISTS  Reservation;
DROP TABLE IF EXISTS Waitlist;
DROP TABLE IF EXISTS Confirmed;
DROP TABLE IF EXISTS  Reservation;
DROP TABLE IF EXISTS Waitlist;
DROP TABLE IF EXISTS Confirmed;
DROP TABLE IF EXISTS  Reserved;
DROP TABLE IF EXISTS  Has;
DROP TABLE IF EXISTS  Works;
DROP TABLE IF EXISTS  Repairs;
DROP TABLE IF EXISTS Request;

CREATE TABLE  Customer ( first_name CHAR(30),
		Last_name CHAR(30),
		gender CHAR(30),
		date_of_birth CHAR(10),
		Address CHAR(30),
		Contact_num CHAR(13),
		ID INTEGER,
		ZIP_code CHAR(10),
		PRIMARY KEY(ID));
			    
CREATE TABLE Captain ( ID INTEGER,
		name char(30),
		PRIMARY KEY(ID));
			    
CREATE TABLE  Ship ( model CHAR(30),
		ID INTEGER,
		make CHAR(30),
		age INTEGER,
		seats INTEGER
		PRIMARY KEY(ID));
			    
CREATE TABLE Cruise ( c_num INTEGER,
		captain_ID INTEGER NOT NULL,
		ship_ID INTEGER NOT NULL,
		cost FLOAT,
		num_sold INTEGER,
		num_stops INTEGER,
		actual_arrive_date CHAR(10),
		actual_arrive_time CHAR(8),
		actual_depart_date CHAR(10),
		actual_depart_time CHAR(8),
		source CHAR(30), 
		destination CHAR(30),
		PRIMARY KEY(c_num) ,
		FOREIGN KEY(captain_ID) REFERENCES Captain(captain_ID),
		FOREIGN KEY(ship_ID) REFERENCES Ship(ship_ID));

CREATE TABLE Schedule (ID INTEGER,
		c_num INTEGER,
		day CHAR(10),
		depart_time CHAR(8),
		arrive_time CHAR(8),
		PRIMARY KEY(c_num, day),
		FOREIGN KEY(c_num) REFERENCES Cruise(c_num) ON DELETE CASCADE);



CREATE TABLE Technician ( ID INTEGER,
		PRIMARY KEY(ID));



CREATE TABLE Crew (ID INTEGER,
		name CHAR(30)
		PRIMARY KEY(ID));

	CREATE TABLE Reservation( Rnum INTEGER,
			PRIMARY KEY(Rnum));

CREATE TABLE Waitlist( W_Rnum INTEGER,
		PRIMARY KEY(W_Rnum), 
		FOREIGN KEY(W_Rnum) REFERENCES Reservation(Rnum));

CREATE TABLE Confirmed( C_Rnum INTEGER,
		PRIMARY KEY(C_Rnum), 
		FOREIGN KEY(C_Rnum) REFERENCES Reservation(Rnum));

CREATE TABLE Reserved( R_Rnum INTEGER,
		PRIMARY KEY(R_Rnum) ,
		FOREIGN KEY(R_Rnum) REFERENCES Reservation(Rnum));
CREATE TABLE Has (ID INTEGER,
		c_num INTEGER,
		Rnum INTEGER,
		PRIMARY KEY (ID, Rnum),
		FOREIGN KEY(c_num) REFERENCES Cruise(c_num),
		FOREIGN KEY(ID) REFERENCES Customer (ID),
		FOREIGN KEY(Rnum) REFERENCES Reservation(Rnum));

CREATE TABLE Works (ID INTEGER,
		c_num INTEGER,
		PRIMARY KEY(ID, c_num),
		FOREIGN KEY(c_num) REFERENCES Cruise(c_num),
		FOREIGN KEY(ID) REFERENCES Crew (ID));

CREATE TABLE Repairs (tech_ID INTEGER,
		ship_ID INTEGER,
		code INTEGER,
		date CHAR(10),
		PRIMARY KEY(tech_ID, ship_ID),
		FOREIGN KEY(tech_ID) REFERENCES Tech(tech_ID),
		FOREIGN KEY(ship_ID) REFERENCES Ship(ship_ID));

CREATE TABLE Request (tech_ID INTEGER,
		ship_ID INTEGER,
		ID INTEGER,
		PRIMARY KEY(ID),
		FOREIGN KEY(tech_ID) REFERENCES Tech(tech_ID),
		FOREIGN KEY(ship_ID) REFERENCES Ship(ship_ID));
