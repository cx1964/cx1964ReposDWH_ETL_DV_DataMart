USE [master]
GO
CREATE LOGIN [myTestDBOwner]
WITH PASSWORD=N'Welkom01' 
     -- MUST_CHANGE
    ,DEFAULT_DATABASE=[master]
     --,CHECK_EXPIRATION=ON
     --,CHECK_POLICY=ON
GO
