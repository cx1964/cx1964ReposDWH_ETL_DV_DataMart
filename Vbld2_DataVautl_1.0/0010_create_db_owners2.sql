-- Owners voor voorbeeld2

USE [master]
GO

CREATE LOGIN [myTestDBOwnerSource2]
WITH PASSWORD=N'Welkom01' 
     -- MUST_CHANGE
    ,DEFAULT_DATABASE=[master]
     --,CHECK_EXPIRATION=ON
     --,CHECK_POLICY=ON
GO

CREATE LOGIN [myTestDBOwnerStaging2]
WITH PASSWORD=N'Welkom01' 
     -- MUST_CHANGE
    ,DEFAULT_DATABASE=[master]
     --,CHECK_EXPIRATION=ON
     --,CHECK_POLICY=ON
GO

CREATE LOGIN [myTestDBOwnerIntegration2]
WITH PASSWORD=N'Welkom01' 
     -- MUST_CHANGE
    ,DEFAULT_DATABASE=[master]
     --,CHECK_EXPIRATION=ON
     --,CHECK_POLICY=ON
GO

CREATE LOGIN [myTestDBOwnerPresentation2]
WITH PASSWORD=N'Welkom01' 
     -- MUST_CHANGE
    ,DEFAULT_DATABASE=[master]
     --,CHECK_EXPIRATION=ON
     --,CHECK_POLICY=ON
GO