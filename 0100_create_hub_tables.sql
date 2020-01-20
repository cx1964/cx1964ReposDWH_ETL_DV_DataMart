use [myTestDB]
go

-- create Hubs


-- *** Begin Organisatie_Eenheid *** --
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[h_Organisatie_Eenheid]') AND type in (N'U'))
DROP TABLE [dbo].[h_Organisatie_Eenheid]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[h_Organisatie_Eenheid]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[h_Organisatie_Eenheid](
	 [h_Organisatie_EenheidHashkey] [varchar](32) NOT NULL  --tbv hashkey op kolom code
	,[code] [varchar](25)  NOT NULL
	,[meta_record_source] [varchar](255) NULL
	,[meta_load_date] [date] NULL
	,[meta_create_time] [time] NULL
 CONSTRAINT [PK_h_Organisatie_Eenheid] PRIMARY KEY CLUSTERED 
(
	[h_Organisatie_EenheidHashkey] ASC
) ON [PRIMARY],
CONSTRAINT UK_H_Organisatie_EenheidCode unique nonclustered
(
  Code
)
) ON [PRIMARY]
END
GO


SET ANSI_PADDING OFF
GO

-- *** Begin Medewerker *** --
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[H_Medewerker]') AND type in (N'U'))
DROP TABLE [dbo].[H_Medewerker]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[H_Medewerker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[H_Medewerker](
	 [H_MedewerkerHashkey] [varchar](32) NOT NULL
    ,[nr] [varchar](6) NOT NULL
	,[meta_record_source] [varchar](255) NULL
	,[meta_load_date] [date] NULL
	,[meta_create_time] [time] NULL
 CONSTRAINT [PK_H_Medewerker] PRIMARY KEY CLUSTERED 
(
	[H_MedewerkerHashkey] ASC
) ON [PRIMARY],
CONSTRAINT UK_H_MedewerkerNr unique nonclustered
(
  Nr
)
) ON [PRIMARY]
END
GO


SET ANSI_PADDING OFF
GO


