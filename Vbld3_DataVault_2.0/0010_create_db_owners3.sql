-- Owners voor voorbeeld3

USE [master]
GO

CREATE LOGIN [myTestDBOwnerSource3]
WITH PASSWORD=N'Welkom01' 
     -- MUST_CHANGE
    ,DEFAULT_DATABASE=[master]
     --,CHECK_EXPIRATION=ON
     --,CHECK_POLICY=ON
GO

CREATE LOGIN [myTestDBOwnerStaging3]
WITH PASSWORD=N'Welkom01' 
     -- MUST_CHANGE
    ,DEFAULT_DATABASE=[master]
     --,CHECK_EXPIRATION=ON
     --,CHECK_POLICY=ON
GO

CREATE LOGIN [myTestDBOwnerIntegration3]
WITH PASSWORD=N'Welkom01' 
     -- MUST_CHANGE
    ,DEFAULT_DATABASE=[master]
     --,CHECK_EXPIRATION=ON
     --,CHECK_POLICY=ON
GO

CREATE LOGIN [myTestDBOwnerPresentation3]
WITH PASSWORD=N'Welkom01' 
     -- MUST_CHANGE
    ,DEFAULT_DATABASE=[master]
     --,CHECK_EXPIRATION=ON
     --,CHECK_POLICY=ON
GO