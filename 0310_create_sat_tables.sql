-- Documentatie mbt gebruik van FKs op SATs
-- zie : https://danlinstedt.com/allposts/datavaultcat/foreign-keys-in-satellites/
-- Dwz doe het niet!

-- Documentatie clustered en nonclusterd indexes
-- Zie https://docs.microsoft.com/en-us/sql/relational-databases/indexes/clustered-and-nonclustered-indexes-described?view=sql-server-ver15


use [TestIntegrationDB]
go

-- create Sats


-- *** Begin Organisatie_Eenheid *** --
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[S_Organisatie_Eenheid]') AND type in (N'U'))
DROP TABLE [dbo].[S_Organisatie_Eenheid]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[S_Organisatie_Eenheid]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[S_Organisatie_Eenheid](
	 [H_Organisatie_EenheidHashkey] [varchar](32) NOT NULL 
	,[Naam] [varchar](80)  NOT NULL
	,[meta_record_source] [varchar](255) NOT NULL
	,[meta_load_date] [date] NOT NULL
	,[meta_create_time] [time] NOT NULL
	,[meta_load_end_date] [date] NOT NULL
	,[meta_create_end_time] [time] NOT NULL
	,[meta_IsCurrent] int NOT NULL
 CONSTRAINT [PK_S_Organisatie_Eenheid] PRIMARY KEY nonclustered 
(
	[H_Organisatie_EenheidHashkey] ASC
   ,[meta_create_time] ASC
   ,[meta_load_end_date] ASC
)
) ON [PRIMARY]
END
GO


SET ANSI_PADDING OFF
GO

-- *** Begin Medewerker *** --
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[S_Medewerker]') AND type in (N'U'))
DROP TABLE [dbo].[S_Medewerker]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[S_Medewerker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[S_Medewerker](
	 [H_MedewerkerHashkey] [varchar](32) NOT NULL
    ,[voorletters] [varchar](20) NOT NULL
    ,[voorvoegsel] [varchar](10) NULL
    ,[achternaam] [varchar](40) NOT NULL
    ,[geboortedatum] [date] not null
    ,[aow_datum] [date] not null
	,[meta_record_source] [varchar](255) NOT NULL
	,[meta_load_date] [date] NOT NULL
	,[meta_create_time] [time] NOT NULL
	,[meta_load_end_date] [date] NOT NULL
	,[meta_create_end_time] [time] NOT NULL
	,[meta_IsCurrent] int NOT NULL
 CONSTRAINT [PK_s_Medewerker] PRIMARY KEY nonclustered 
(
	[H_MedewerkerHashkey] ASC
   ,[meta_create_time] ASC
   ,[meta_load_end_date] ASC
)
) ON [PRIMARY]
END
GO


SET ANSI_PADDING OFF
GO


