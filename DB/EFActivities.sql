USE [master]
GO
/****** Object:  Database [EFActivities]    Script Date: 2/21/2019 3:35:45 PM ******/
CREATE DATABASE [EFActivities]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EFActivities', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2K14\MSSQL\DATA\EFActivities.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EFActivities_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2K14\MSSQL\DATA\EFActivities_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EFActivities] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EFActivities].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EFActivities] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EFActivities] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EFActivities] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EFActivities] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EFActivities] SET ARITHABORT OFF 
GO
ALTER DATABASE [EFActivities] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EFActivities] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EFActivities] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EFActivities] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EFActivities] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EFActivities] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EFActivities] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EFActivities] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EFActivities] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EFActivities] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EFActivities] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EFActivities] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EFActivities] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EFActivities] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EFActivities] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EFActivities] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EFActivities] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EFActivities] SET RECOVERY FULL 
GO
ALTER DATABASE [EFActivities] SET  MULTI_USER 
GO
ALTER DATABASE [EFActivities] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EFActivities] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EFActivities] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EFActivities] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EFActivities] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EFActivities', N'ON'
GO
USE [EFActivities]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/21/2019 3:35:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/21/2019 3:35:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentNAme] [varchar](50) NULL,
	[Dob] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GEtStudentByID]    Script Date: 2/21/2019 3:35:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GEtStudentByID]
@studentID int 
as

Select *  from Student where StudentId=@studentID

 
GO
/****** Object:  StoredProcedure [dbo].[Student_Insert]    Script Date: 2/21/2019 3:35:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--==exec student_Insert 'israr' getdate()
CREATE PROCEDURE [dbo].[Student_Insert]
    @StudentName [nvarchar](max),
    @DoB [datetime]
AS
BEGIN
    INSERT [dbo].[Student]([StudentName], [DoB])
    VALUES (@StudentName, @DoB)
    
    DECLARE @StudentId int
    SELECT @StudentId = [StudentId]
    FROM [dbo].[Student]
    WHERE @@ROWCOUNT > 0 AND [StudentId] = scope_identity()
    
    SELECT t0.[StudentId]
    FROM [dbo].[Student] AS t0
    WHERE @@ROWCOUNT > 0 AND t0.[StudentId] = @StudentId
END
GO
/****** Object:  StoredProcedure [dbo].[Student_Update]    Script Date: 2/21/2019 3:35:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Student_Update]
    @StudentId [int],
    @StudentName [nvarchar](max),
    @DoB [datetime]
AS
BEGIN
    UPDATE [dbo].[Student]
    SET [StudentName] = @StudentName, [DoB] = @DoB
    WHERE ([StudentId] = @StudentId)
END
GO
USE [master]
GO
ALTER DATABASE [EFActivities] SET  READ_WRITE 
GO
