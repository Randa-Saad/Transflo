--/****** Object:  Database [Transflo_DB]  ******/
--CREATE DATABASE [Transflo_DB]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'Transflo_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL_SERVER\MSSQL\DATA\Transflo_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'Transflo_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL_SERVER\MSSQL\DATA\Transflo_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
--GO

--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [Transflo_DB].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO

--ALTER DATABASE [Transflo_DB] SET ANSI_NULL_DEFAULT OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET ANSI_NULLS OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET ANSI_PADDING OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET ANSI_WARNINGS OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET ARITHABORT OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET AUTO_CLOSE OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET AUTO_SHRINK OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET AUTO_UPDATE_STATISTICS ON 
--GO

--ALTER DATABASE [Transflo_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET CURSOR_DEFAULT  GLOBAL 
--GO

--ALTER DATABASE [Transflo_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET NUMERIC_ROUNDABORT OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET QUOTED_IDENTIFIER OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET RECURSIVE_TRIGGERS OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET  ENABLE_BROKER 
--GO

--ALTER DATABASE [Transflo_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET TRUSTWORTHY OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET PARAMETERIZATION SIMPLE 
--GO

--ALTER DATABASE [Transflo_DB] SET READ_COMMITTED_SNAPSHOT OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET HONOR_BROKER_PRIORITY OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET RECOVERY FULL 
--GO

--ALTER DATABASE [Transflo_DB] SET  MULTI_USER 
--GO

--ALTER DATABASE [Transflo_DB] SET PAGE_VERIFY CHECKSUM  
--GO

--ALTER DATABASE [Transflo_DB] SET DB_CHAINING OFF 
--GO

--ALTER DATABASE [Transflo_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
--GO

--ALTER DATABASE [Transflo_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
--GO

--ALTER DATABASE [Transflo_DB] SET DELAYED_DURABILITY = DISABLED 
--GO

--ALTER DATABASE [Transflo_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
--GO

--ALTER DATABASE [Transflo_DB] SET QUERY_STORE = ON
--GO

--ALTER DATABASE [Transflo_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
--GO

--ALTER DATABASE [Transflo_DB] SET  READ_WRITE 
--GO



--USE [Transflo_DB]
--GO

--/****** Object:  Table [dbo].[Drivers] ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE TABLE [dbo].[Drivers](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[FirstName] [nvarchar](30) NULL,
--	[LastName] [nvarchar](30) NULL,
--	[Email] [nvarchar](30) NULL,
--	[PhoneNumber] [nvarchar](30) NULL,
--PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
--USE [Transflo_DB]
--GO

--/****** Object:  StoredProcedure [dbo].[usp_Delete_Driver]  ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE PROC [dbo].[usp_Delete_Driver]
--(
--	@Id INT
--)
--AS
--BEGIN
--Declare @RowCount INT = 0
--	BEGIN TRY
--	SET @RowCount = (SELECT COUNT(1) FROM DBO.Drivers WITH (NOLOCK) WHERE Id= @Id )

--	if(@RowCount >0)
--		BEGIN
--			BEGIN TRAN
--				DELETE FROM  DBO.Drivers
					
--					WHERE Id = @Id
--			COMMIT TRAN
--		END
--	END TRY
--BEGIN CATCH
--	ROLLBACK TRAN
--END CATCH
--END
--GO
--USE [Transflo_DB]
--GO

--/****** Object:  StoredProcedure [dbo].[usp_Get_DriverById]   ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE PROC [dbo].[usp_Get_DriverById]
--(
--	@Id INT
--)
--AS
--BEGIN
--SELECT Id,FirstName,LastName,Email,PhoneNumber from DBO.Drivers WITH (NOLOCK)
--	WHERE ID=@Id
--END
--GO
--USE [Transflo_DB]
--GO

--/****** Object:  StoredProcedure [dbo].[usp_Get_Drivers] ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE PROC [dbo].[usp_Get_Drivers]
--AS
--BEGIN
--	SELECT Id,FirstName,LastName,Email,PhoneNumber from DBO.Drivers WITH (NOLOCK)
--End
--GO
--USE [Transflo_DB]
--GO

--/****** Object:  StoredProcedure [dbo].[usp_Insert_Driver]  ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE PROC [dbo].[usp_Insert_Driver]
--(
--@FirstName NVARCHAR(20),
--@LastName NVARCHAR(20),
--@Email NVARCHAR(20),
--@PhoneNumber NVARCHAR(20)
--)
--AS 
--BEGIN

--BEGIN TRY
--	BEGIN TRAN
--	INSERT INTO DBO.Drivers(FirstName, LastName, Email, PhoneNumber)
--		VALUES
--		(
--			@FirstName,
--			@LastName,
--			@Email,
--			@PhoneNumber
--		)
--	COMMIT TRAN
--END TRY
--BEGIN CATCH
--	ROLLBACK TRAN
--END CATCH
--END
--GO
--USE [Transflo_DB]
--GO

--/****** Object:  StoredProcedure [dbo].[usp_Update_Driver]  ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE PROC [dbo].[usp_Update_Driver]
--(
--	@Id INT,
--	@FirstName NVARCHAR(20),
--	@LastName NVARCHAR(20),
--	@Email NVARCHAR(20),
--	@PhoneNumber NVARCHAR(20)
--)
--AS
--BEGIN
--Declare @RowCount INT = 0
--	BEGIN TRY
--	SET @RowCount = (SELECT COUNT(1) FROM DBO.Drivers WITH (NOLOCK) WHERE Id= @Id )

--	if(@RowCount >0)
--		BEGIN
--			BEGIN TRAN
--				UPDATE DBO.Drivers
--					SET 
--						FirstName = @FirstName, 
--						LastName= @LastName,
--						Email = @Email,
--						PhoneNumber = @PhoneNumber 
--						WHERE Id = @Id
--			COMMIT TRAN
--		END
--	END TRY
--BEGIN CATCH
--	ROLLBACK TRAN
--END CATCH
--END
--GO






