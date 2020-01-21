CREATE DATABASE [TestSourceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
(  NAME = N'TestSourceDB'
  ,FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.TEST_C1Z68Y2\MSSQL\DATA\TestSourceDB.mdf'
  ,SIZE = 8192KB
  ,FILEGROWTH = 65536KB
)
LOG ON 
(  NAME = N'TestSourceDB_log'
  ,FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.TEST_C1Z68Y2\MSSQL\DATA\TestSourceDB_log.ldf'
  ,SIZE = 8192KB
  ,FILEGROWTH = 65536KB
)
GO
ALTER DATABASE [TestSourceDB] SET COMPATIBILITY_LEVEL = 130
GO
ALTER DATABASE [TestSourceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestSourceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestSourceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestSourceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestSourceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestSourceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestSourceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestSourceDB] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [TestSourceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestSourceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestSourceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestSourceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestSourceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestSourceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestSourceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestSourceDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestSourceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestSourceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestSourceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestSourceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestSourceDB] SET  READ_WRITE 
GO
ALTER DATABASE [TestSourceDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TestSourceDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestSourceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestSourceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestSourceDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TestSourceDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [TestSourceDB]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [TestSourceDB] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
