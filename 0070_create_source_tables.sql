-- Documentatie clustered en nonclusterd indexes
-- Zie https://docs.microsoft.com/en-us/sql/relational-databases/indexes/clustered-and-nonclustered-indexes-described?view=sql-server-ver15

use [TestSourceDB]
go

-- *** Begin Organisatie_Eenheid *** --
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Organisatie_Eenheid]') AND type in (N'U'))
DROP TABLE [dbo].[Organisatie_Eenheid]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Organisatie_Eenheid]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Organisatie_Eenheid](
	 [id] [int] NOT NULL IDENTITY(1,1)
	,[code] [varchar](25) NOT NULL
	,[naam] [varchar](80) NOT NULL

CONSTRAINT [PK_Organisatie_Eenheid] PRIMARY KEY nonclustered 
(
	[id] ASC
) ON [PRIMARY],

CONSTRAINT UK_Organisatie_EenheidCode unique nonclustered
(
  Code
)

) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

-- *** Begin Medewerker *** --
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medewerker]') AND type in (N'U'))
DROP TABLE [dbo].[Medewerker]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medewerker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Medewerker](
	  [id] [int] NOT NULL IDENTITY(1,1)
   ,[nr] [varchar](6) NOT NULL
   ,[voorletters] [varchar](20) NOT NULL
   ,[voorvoegsel] [varchar](10) NULL
   ,[achternaam] [varchar](40) NOT NULL
   ,[geboortedatum] [date] not null
   ,[aow_datum] [date] not null
   ,[werkt_voor_org_eenheid] [int] not null

CONSTRAINT [PK_Medewerker] PRIMARY KEY nonclustered
(
	[id] ASC
) ON [PRIMARY],

CONSTRAINT UK_MedewerkerNr unique nonclustered
(
  Nr
),

CONSTRAINT FK_Medewerker_Organisatie_Eenheid FOREIGN KEY (werkt_voor_org_eenheid)
           REFERENCES Organisatie_Eenheid (id)


) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO
-- *** Einde Medewerker *** --

