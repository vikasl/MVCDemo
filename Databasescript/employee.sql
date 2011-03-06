SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Project](
	[Pname] [varchar](15) NOT NULL,
	[Pnumber] [int] NOT NULL,
	[Plocation] [varchar](15) NULL,
	[Dnum] [int] NOT NULL,
 CONSTRAINT [Project_PK] PRIMARY KEY CLUSTERED 
(
	[Pnumber] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Works_On]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Works_On](
	[Essn] [char](9) NOT NULL,
	[Pno] [int] NOT NULL,
	[Hours] [int] NULL,
 CONSTRAINT [Works_On_PK] PRIMARY KEY CLUSTERED 
(
	[Essn] ASC,
	[Pno] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dependent]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dependent](
	[Essn] [char](9) NOT NULL,
	[Dependent_name] [varchar](15) NOT NULL,
	[Sex] [char](1) NULL,
	[Bdate] [datetime] NULL,
	[Relationship] [varchar](8) NULL,
 CONSTRAINT [Dependent_PK] PRIMARY KEY CLUSTERED 
(
	[Essn] ASC,
	[Dependent_name] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[Fname] [varchar](15) NOT NULL,
	[Minit] [char](1) NULL,
	[Lname] [varchar](15) NOT NULL,
	[Ssn] [char](9) NOT NULL,
	[Bdate] [datetime] NULL,
	[Address] [varchar](30) NULL,
	[Sex] [char](1) NULL,
	[Salary] [int] NULL,
	[Super_ssn] [char](9) NULL,
	[Dno] [int] NOT NULL,
 CONSTRAINT [Employee_PK] PRIMARY KEY CLUSTERED 
(
	[Ssn] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department](
	[Dname] [varchar](15) NOT NULL,
	[DNumber] [int] NOT NULL,
	[MgrSsn] [char](9) NOT NULL,
	[MgrStartDate] [datetime] NULL,
 CONSTRAINT [Department_PK] PRIMARY KEY CLUSTERED 
(
	[DNumber] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dept_Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dept_Locations](
	[Dnumber] [int] NOT NULL,
	[Dlocation] [varchar](15) NOT NULL,
 CONSTRAINT [Dept_Locations_PK] PRIMARY KEY CLUSTERED 
(
	[Dnumber] ASC,
	[Dlocation] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END

go

INSERT INTO Employee 
VALUES ('John','B','Smith',342342543, '1965-01-09','731 Fondren, Houston ,TX','M',30000,356743565,5);
  
INSERT INTO Employee 
VALUES ('Franklin','T','Wong',324567345,'1955-12-08','638 Voss, Houston ,TX','M',40000,356743565,5);

INSERT INTO Employee 
VALUES ('Alicia','J','Zelaya',432346342,'1968-01-19','3321 Castle, Spring ,TX','F',25000,256435684,4);

INSERT INTO Employee 
VALUES ('Jennifer','S','Wallace',423435234,'1941-06-20','291 Berry, Bellaire ,TX','F',43000,256435684,4);

INSERT INTO Employee 
VALUES ('Ramesh','K','Naraan',352345123,'1962-09-15','975 Fire Oak Humble,TX','M',38000,256435684,5);

INSERT INTO Employee 
VALUES ('Joyce','A','English',256435684,'1972-07-31','5631 Rice, Houston ,TX','F',25000,333445555,5);

INSERT INTO Employee 
VALUES ('Ahmad','V','Jabbar',254346245,'1969-03-29','980 Dallas, Houston ,TX','M',25000,356743565,4);

INSERT INTO Employee 
VALUES ('James','E','Borg',356743565,'1937-11-10','450 Stone, Houston ,TX','M',55000,NULL,1);
Go