
-----------------------------------PART 1-------------------------------
DROP TABLE IF EXISTS advise CASCADE;
DROP TABLE IF EXISTS work_proj CASCADE;
DROP TABLE IF EXISTS work_in CASCADE;
DROP TABLE IF EXISTS work_dept CASCADE;
DROP TABLE IF EXISTS Graduate CASCADE;
DROP TABLE IF EXISTS Project CASCADE;
DROP TABLE IF EXISTS Dept CASCADE;
DROP TABLE IF EXISTS Professor CASCADE;

CREATE TABLE Professor(ssn CHAR(11) NOT NULL,
			name CHAR(30) NOT NULL,
			age INTEGER,
			rank CHAR(30) NOT NULL,
			speciality CHAR(30) NOT NULL,
			PRIMARY KEY(ssn));

--Added runs relationship by giving reference of ssn
CREATE TABLE Dept (dno INTEGER,
		dname CHAR(30) NOT NULL,
		office CHAR(30) NOT NULL,
		ssn CHAR(11),
		PRIMARY KEY(dno),
		FOREIGN KEY (ssn) REFERENCES Professor(ssn));

-- Added manage relationship by giving reference of ssn
CREATE TABLE Project 	(pno INTEGER,
			sponsor CHAR(30) NOT NULL,
			start_date CHAR(10) NOT NULL,
			end_date CHAR(10) NOT NULL,
			budget INTEGER,
			ssn CHAR(11),
			PRIMARY KEY(pno),
			FOREIGN KEY (ssn) REFERENCES Professor(ssn));

--Adde major relationship by giving reference of dno
CREATE TABLE Graduate	(SSN CHAR(11) NOT NULL,
                        name CHAR(30) NOT NULL,
                        age INTEGER,
                        deg_pg CHAR(30) NOT NULL,
			dno INTEGER,
                        PRIMARY KEY(SSN),
			FOREIGN KEY (dno) REFERENCES Dept(dno));

CREATE TABLE work_dept	(time_pc INTEGER,
			ssn CHAR(11),
			dno INTEGER,
			PRIMARY KEY (ssn, dno),
			FOREIGN KEY (ssn) REFERENCES Professor(ssn),
			FOREIGN KEY (dno) REFERENCES Dept(dno));

CREATE TABLE work_in	(pno INTEGER,
			ssn CHAR(11),
			PRIMARY KEY (ssn, pno),
			FOREIGN KEY (ssn) REFERENCES Professor(ssn),
			FOREIGN KEY (pno) REFERENCES Project(pno));

--Added supervise relationship using reference to ssn
CREATE TABLE work_proj	(since CHAR(10) NOT NULL,
			pno INTEGER,
			g_SSN CHAR(11),
			e_ssn CHAR(11),
			PRIMARY KEY (g_SSN, pno),
			FOREIGN KEY (e_ssn) REFERENCES Professor(ssn),
			FOREIGN KEY (g_SSN) REFERENCES Graduate(SSN),
                        FOREIGN KEY (pno) REFERENCES Project(pno));
		
CREATE TABLE advise	(g_SSN CHAR(11),
			s_SSN CHAR(11),
			PRIMARY KEY(g_SSN, s_SSN),
			FOREIGN KEY (g_SSN) REFERENCES Graduate(SSN),
			FOREIGN KEY (s_SSN) REFERENCES Graduate(SSN));

---------------------------------PART 2----------------------------------------


CREATE TABLE Musicians	(ssn CHAR(11) NOT NULL;
			name 








