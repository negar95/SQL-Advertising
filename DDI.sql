CREATE TABLE Ads
(
ID				int NOT NULL IDENTITY(1,1) PRIMARY KEY,
ProgramID		int FOREIGN KEY REFERENCES Programs(ID),
clickPrice		int,
visitPrice		int,
downloadPrice	int,
categoryID		int FOREIGN KEY REFERENCES Categories(ID),
date_			DATE
)
CREATE TABLE Categories
(
ID				int NOT NULL IDENTITY(1,1) PRIMARY KEY,
name			VARCHAR(255)
)
CREATE TABLE Programs
(
ID				int NOT NULL IDENTITY(1,1) PRIMARY KEY,
name			VARCHAR(255),
developer		VARCHAR(255)
)
CREATE TABLE ProgramsAds
(
ID				int NOT NULL IDENTITY(1,1) PRIMARY KEY,
ProgramID		FOREIGN KEY REFERENCES Programs(ID),
AdID			FOREIGN KEY REFERENCES Ads(ID)
)
CREATE TABLE Clicks
(
ID				int NOT NULL IDENTITY(1,1) PRIMARY KEY,
programAdID		FOREIGN KEY REFERENCES ProgramAds(ID),
date_			DATE
)
CREATE TABLE Views
(
ID				int NOT NULL IDENTITY(1,1) PRIMARY KEY,
programAdID		FOREIGN KEY REFERENCES ProgramAds(ID),
date_			DATE
)
CREATE TABLE Downloads
(
ID				int NOT NULL IDENTITY(1,1) PRIMARY KEY,
programAdID		FOREIGN KEY REFERENCES ProgramAds(ID),
date_			DATE
)