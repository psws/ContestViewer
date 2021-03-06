USE [master]
GO
/****** Object:  Database [logqso]    Script Date: 8/29/2015 2:03:58 PM ******/
CREATE DATABASE [logqso] ON  PRIMARY 
( NAME = N'logqso', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\logqso_data.mdf' , SIZE = 6336KB , MAXSIZE = 10238976KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'logqso_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\logqso_log.ldf' , SIZE = 6912KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [logqso] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [logqso].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [logqso] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [logqso] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [logqso] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [logqso] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [logqso] SET ARITHABORT OFF 
GO
ALTER DATABASE [logqso] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [logqso] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [logqso] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [logqso] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [logqso] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [logqso] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [logqso] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [logqso] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [logqso] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [logqso] SET  DISABLE_BROKER 
GO
ALTER DATABASE [logqso] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [logqso] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [logqso] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [logqso] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [logqso] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [logqso] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [logqso] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [logqso] SET RECOVERY FULL 
GO
ALTER DATABASE [logqso] SET  MULTI_USER 
GO
ALTER DATABASE [logqso] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [logqso] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'logqso', N'ON'
GO
USE [logqso]
GO
/****** Object:  User [jims9m8r]    Script Date: 8/29/2015 2:04:00 PM ******/
CREATE USER [jims9m8r] FOR LOGIN [jims9m8r] WITH DEFAULT_SCHEMA=[jims9m8r]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 8/29/2015 2:04:00 PM ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 8/29/2015 2:04:00 PM ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 8/29/2015 2:04:00 PM ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 8/29/2015 2:04:00 PM ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 8/29/2015 2:04:00 PM ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 8/29/2015 2:04:00 PM ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 8/29/2015 2:04:00 PM ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 8/29/2015 2:04:00 PM ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 8/29/2015 2:04:00 PM ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 8/29/2015 2:04:00 PM ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 8/29/2015 2:04:01 PM ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 8/29/2015 2:04:01 PM ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 8/29/2015 2:04:01 PM ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
ALTER ROLE [db_owner] ADD MEMBER [jims9m8r]
GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Membership_BasicAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 8/29/2015 2:04:01 PM ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 8/29/2015 2:04:02 PM ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Schema [jims9m8r]    Script Date: 8/29/2015 2:04:03 PM ******/
CREATE SCHEMA [jims9m8r]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Applications_Index]    Script Date: 8/29/2015 2:04:03 PM ******/
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications]
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL DEFAULT ((0)),
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Membership_index]    Script Date: 8/29/2015 2:04:03 PM ******/
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership]
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Paths_index]    Script Date: 8/29/2015 2:04:03 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths]
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [aspnet_PersonalizationPerUser_index1]    Script Date: 8/29/2015 2:04:03 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Roles_index1]    Script Date: 8/29/2015 2:04:03 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles]
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL DEFAULT (NULL),
	[IsAnonymous] [bit] NOT NULL DEFAULT ((0)),
	[LastActivityDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Users_Index]    Script Date: 8/29/2015 2:04:03 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Session]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Session](
	[UserIdentity] [varchar](50) NOT NULL,
	[ContestLogInfo1] [xml] NULL,
	[ContestLogInfo2] [xml] NULL,
	[ContestLogInfo3] [xml] NULL,
	[QSOLogFilter] [xml] NULL,
	[ContestViewFilter] [xml] NULL,
	[SubscriptionCredit] [smallmoney] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 8/29/2015 2:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'9b454b78-a8bf-4172-b60c-c62e3e13faf2', N'IQzwwIECHpWS/8e36HFOc/1crugeafW65zEqwP5sXB56HUTUFEEbjvjnewK6Ae1P', 2, N'svMlfy6lA2N+dV+ihIhTKA==', NULL, N'2014a1052@zfymail.com', N'2014a1052@zfymail.com', NULL, NULL, 1, 0, CAST(N'2014-06-05 16:36:43.000' AS DateTime), CAST(N'2014-06-05 16:36:43.000' AS DateTime), CAST(N'2014-06-05 16:36:43.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'af9bd053-cbd6-4ab0-99cf-669571d493cc', N'Cm83oQNMg6198ks9DQfWDQkssVCW47qKISi3ZZDfkvpDnB0an4pAqCRAxb48h5zo', 2, N'dSC4n6ZSitpcrAoEJOmVvg==', NULL, N'2014a505@zfymail.com', N'2014a505@zfymail.com', NULL, NULL, 1, 0, CAST(N'2014-05-07 13:56:02.000' AS DateTime), CAST(N'2014-05-07 13:56:03.893' AS DateTime), CAST(N'2014-05-07 13:56:02.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'42c23557-c927-4b28-8cdf-b18685467c0d', N'p5aAstEhPjwn31ewGW7ytny5k3vOTloSIPwaivIgo8qh54ptNMgqC38i17Bm/8Q6', 2, N'+nTaPM0kPfbpXGrweroYPA==', NULL, N'2014a742@zfymail.com', N'2014a742@zfymail.com', NULL, NULL, 1, 0, CAST(N'2014-05-23 16:02:20.000' AS DateTime), CAST(N'2014-05-23 16:02:20.000' AS DateTime), CAST(N'2014-05-23 16:02:20.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'62711f0c-9c98-4874-8da0-a369ac940619', N'ymcnIcENEhoNbEnAzSd70JDaCFUh6ZaOVj2LZJQ4FV8=', 2, N'5VdSKSWxSxG5S3krawQHKA==', NULL, N'5b4afm@gmail.com', N'5b4afm@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-05-05 16:33:05.000' AS DateTime), CAST(N'2013-05-05 16:33:05.000' AS DateTime), CAST(N'2013-05-05 16:33:05.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'8b212336-3115-4c92-bbed-e51d61be7f81', N'qu3TVGABiHC6Sfdkx5u+wfV+U/iXP/RS8pvQvGpkUXg=', 2, N'GcB5RzZz/P8T9TAYqyFY2w==', NULL, N'9a5adt@gmail.com', N'9a5adt@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-06 11:42:11.000' AS DateTime), CAST(N'2012-10-06 11:42:11.000' AS DateTime), CAST(N'2012-10-06 11:42:11.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'8b31a7fe-f0f2-4869-ba29-c8735cdee530', N'e/sOXTmBar9Zp9XuLcJrMTcXLd0mkVpJNObw8LLE1m88/rdQTekAPf+pHaqFSwL1', 2, N'9crZyBEHS2byV5CGD0UsUA==', NULL, N'AL7H@aol.com', N'al7h@aol.com', NULL, NULL, 1, 0, CAST(N'2012-10-05 23:47:12.000' AS DateTime), CAST(N'2014-08-18 16:51:41.257' AS DateTime), CAST(N'2012-10-05 23:47:12.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'c6475386-6392-4bad-8f12-6a8407de2a94', N'NEM3LbL5dTCjs0QLgjtU993SpC/Ds8aqCi33MUvJDfqtGwpOQ3KYHwdJGiI8222k', 2, N'BvNsRUXwB/AeDioxZDpLtA==', NULL, N'AL7H@aol.com', N'al7h@aol.com', NULL, NULL, 1, 0, CAST(N'2012-10-14 14:55:29.000' AS DateTime), CAST(N'2014-10-12 22:22:50.650' AS DateTime), CAST(N'2012-10-14 14:55:29.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'db0139b6-5431-43b3-bab3-8b01a32b0504', N'lqy4iD3KkJcwaRgoOvIWVq9sI08HrW3N2P+X7fwqlrI=', 2, N'7XP99kZA5J8une7/B/wevQ==', NULL, N'aperotto@gmail.com', N'aperotto@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-11-19 12:28:15.000' AS DateTime), CAST(N'2014-11-19 12:28:15.000' AS DateTime), CAST(N'2014-11-19 12:28:15.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'1793463b-5f73-4af0-aab5-4c4d0ac12c4d', N'YTheKUXeaVm31sggzeQQHI76dwqJ0mmLIbtF9AOUYge0oHP37ZoWLsZz1MKxoaO1', 2, N'KaN3yfMNKg1DJ7jOzajQow==', NULL, N'argentino.lu1qs@gmail.com', N'argentino.lu1qs@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-12 16:47:58.000' AS DateTime), CAST(N'2012-10-12 16:47:58.000' AS DateTime), CAST(N'2012-10-12 16:47:58.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'ee00d86a-0447-4890-96a7-bb4542e41fff', N'OEmbYTF2s54HWr4g8ITDLCoJsUXgPuHlaHYaakBC5jThkl+vEfgemQih52xaqPBq', 2, N'Mrz+bb0hSCssvpdMojwmTQ==', NULL, N'ashfetterhoffloq@yahoo.com', N'ashfetterhoffloq@yahoo.com', NULL, NULL, 1, 0, CAST(N'2015-08-13 13:43:48.000' AS DateTime), CAST(N'2015-08-13 13:43:48.000' AS DateTime), CAST(N'2015-08-13 13:43:48.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7d764d17-1db9-46e6-b6c4-64ddf9706f8b', N'O9DpsVjmMsszbVlRIklQ3hhm7zavksF9MNwREOIVbEZxJcKgJl3cdpb35CexRxNC', 2, N'9tJIkcOEKqrH6aT+vbI0fA==', NULL, N'baker@twinwood.me', N'baker@twinwood.me', NULL, NULL, 1, 0, CAST(N'2015-02-28 17:54:00.000' AS DateTime), CAST(N'2015-02-28 17:54:00.000' AS DateTime), CAST(N'2015-02-28 17:54:00.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'04cf2475-53ee-4cdd-bba7-d79e0101c378', N'Inek1VN8aIFjIzv98DxoXvGS2bn/+l7d51FhPCbVEAR41wgHamruBk03rWtoVni2', 2, N'+YbfJ0D2YtTX6IBYDfX+LA==', NULL, N'bobk8ia@aol.com', N'bobk8ia@aol.com', NULL, NULL, 1, 0, CAST(N'2012-10-11 10:40:21.000' AS DateTime), CAST(N'2012-10-12 08:58:04.203' AS DateTime), CAST(N'2012-10-11 10:40:21.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'287acffb-ce0e-4861-ab80-749760e96ccc', N'Z2aaExSwjD1ad3YiWa9u0ZaZ5aj82c1c6yFqPkjlUnydjR2ELfiSXX8gV+hwqKim', 2, N'i9rOZ1840/Pw9HWRgXoymw==', NULL, N'cirqtech@gmail.com', N'cirqtech@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-10 04:13:01.000' AS DateTime), CAST(N'2012-10-10 04:13:01.000' AS DateTime), CAST(N'2012-10-10 04:13:01.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'8dc21f86-11d9-4004-b79b-38ad5afffcdc', N'R9azpfULVDXORFEC/fw0HrxnYMHs0lG2P2QwjK+6f7Y4Vud2uuP3dYizB2UHtZ57', 2, N'sEMNjKwFPuDvpvEV7zuMQw==', NULL, N'cn8kd@hotmail.com', N'cn8kd@hotmail.com', NULL, NULL, 1, 0, CAST(N'2012-11-22 23:33:12.000' AS DateTime), CAST(N'2012-11-22 23:33:12.000' AS DateTime), CAST(N'2012-11-22 23:33:12.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'9f224c61-c0d6-48e8-ae2f-629e04a6367f', N'/aTpLaPPE//PDeJ/bEkMcmzl1jlrei6+GGWUrt//E3B5WIsFukqvKmPJuYUrvRSV', 2, N'Z4R89T65ujhXlBt2XeuQ5g==', NULL, N'colin.potter1@ntlworld.com', N'colin.potter1@ntlworld.com', NULL, NULL, 1, 0, CAST(N'2012-10-21 14:17:08.000' AS DateTime), CAST(N'2012-10-21 14:17:08.000' AS DateTime), CAST(N'2012-10-21 14:17:08.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'5343f596-5052-4311-aeb3-5e385019644e', N'DMWICck+EkH/l24QimXith5FnjpYn4Dv4wLSr8TYmeSFdS5Pwttcr/IpPnQ3v/Q7s6CNq/1odOKXtuY1elEIRQ==', 2, N'erqtahtTTioWaOzA3s9x5Q==', NULL, N'cqtestk4xs@aol.com', N'cqtestk4xs@aol.com', NULL, NULL, 1, 0, CAST(N'2012-10-13 23:16:20.000' AS DateTime), CAST(N'2012-10-13 23:16:20.000' AS DateTime), CAST(N'2012-10-13 23:16:20.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'e0ca8d52-73ed-4c68-83b3-f465f1143665', N'4GMj7BZfhM2hljrEkJjnG46o4lXXAJBCcXH4E5LvvTw=', 2, N'IvAHtpfR+a0npU549fa/Dg==', NULL, N'csaba.dh7ku@gmail.com', N'csaba.dh7ku@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-24 10:55:42.000' AS DateTime), CAST(N'2013-01-08 16:15:38.730' AS DateTime), CAST(N'2012-10-24 10:55:42.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd9d7ee09-42c1-4f00-b534-6b0c09574082', N'V2LmbdDz3hinOI192KoXQ8lHxSaJUAFVXYrEvRAFFQ0=', 2, N'odZCTKKQjiA6MMB4RA0eaA==', NULL, N'd.smicka@micronic.cz', N'd.smicka@micronic.cz', NULL, NULL, 1, 0, CAST(N'2012-10-23 19:41:19.000' AS DateTime), CAST(N'2012-10-23 19:41:19.000' AS DateTime), CAST(N'2012-10-23 19:41:19.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4713331c-80a2-4687-a237-ca1ee46d0701', N'aVtYXP+4lLOAzQijYfubNG9LnGRE+Oa1qRBG2ZvAimLA+w5Rnq32HuurHU+ybpsJ', 2, N'DZUCJ/6/ZRI58d4svp+/CQ==', NULL, N'david@va7dxc.com', N'david@va7dxc.com', NULL, NULL, 1, 0, CAST(N'2012-10-29 04:36:55.000' AS DateTime), CAST(N'2012-10-29 04:36:55.000' AS DateTime), CAST(N'2012-10-29 04:36:55.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'df0b54ed-fd91-4051-b080-b087b1856fac', N'w20L7V7Y6wHbwUW8YdP8dRxfhIpTy2AClz911eyJyI4=', 2, N'ugbB4Xs7dS1Y99ryPbCinQ==', NULL, N'dl5ant@darc.de', N'dl5ant@darc.de', NULL, NULL, 1, 0, CAST(N'2012-10-21 09:36:55.000' AS DateTime), CAST(N'2012-10-22 09:14:32.630' AS DateTime), CAST(N'2012-10-21 09:36:55.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd55f5733-b4cd-47db-bea0-68fed2ae1759', N'MNUf2t6+4jDiZ0w157LwHE4F4VF9zuusUA/qehXQaZif+LaECdvB8qynCPJjjxhu', 2, N'x7eKBErd+UWSoQuTDHSrQw==', NULL, N'dl8obf@yahoo.de', N'dl8obf@yahoo.de', NULL, NULL, 1, 0, CAST(N'2012-10-06 10:53:48.000' AS DateTime), CAST(N'2012-10-06 10:54:31.290' AS DateTime), CAST(N'2012-10-06 10:53:48.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'008670a8-c763-4ed5-b26e-aa163adabb2d', N'WICcQWyuPO9vOePFtFgTWJ9VAIzXac1bp4KJSaoh/Lw=', 2, N'rO9dfL9YDm5n1/C439D0gg==', NULL, N'dougk1dg@gmail.com', N'dougk1dg@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-09 01:13:32.000' AS DateTime), CAST(N'2012-10-20 02:11:40.847' AS DateTime), CAST(N'2012-10-09 01:13:32.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'25bc6fdd-f8ed-4e3d-ac30-af667ca27b67', N'4TF72L3FJHJITGOBLowiTJ9qZevUjkdCrHyXxH6jyDqQ3C3rxA4+gloPpsiE+0+f', 2, N'cD8t4OcuVURrKf2wqU15rw==', NULL, N'duoneud@gmail.com', N'duoneud@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-07-14 23:34:50.000' AS DateTime), CAST(N'2013-07-14 23:34:50.000' AS DateTime), CAST(N'2013-07-14 23:34:50.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a3de75cd-0b67-4eb8-a325-e8844d237afc', N'Fx1KKlXiD4IuWEPXO4aKAbVT1oRmAbz4P1oh5aZ7674DE7Vd8ifbaE+3e1GKoD3T', 2, N'jl2NrTRKhAZUKFQRyTItZQ==', NULL, N'ea2cw@gautxori.com', N'ea2cw@gautxori.com', NULL, NULL, 1, 0, CAST(N'2014-08-23 19:24:23.000' AS DateTime), CAST(N'2014-08-23 19:24:23.000' AS DateTime), CAST(N'2014-08-23 19:24:23.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a8061ad1-ba9f-4d73-8b4f-9ff568639a70', N'4H863kugKKAIV/YfEt0u/7W3vMnmN5yef+mNhq4yOBc=', 2, N'EVSsCxV0kj9ElhoaMB3X3Q==', NULL, N'ea4kd@ea4kd.com', N'ea4kd@ea4kd.com', NULL, NULL, 1, 0, CAST(N'2012-10-05 07:28:06.000' AS DateTime), CAST(N'2012-10-05 07:28:06.000' AS DateTime), CAST(N'2012-10-05 07:28:06.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'831d76a0-e021-4d85-abe6-8ebe4a2d4f43', N'5Z4AHPje43v0f8D0ekS9nbe/RSoYutCcFseBXf2vQD8=', 2, N'ih0JP7Vch9pnOn9RjS8nEg==', NULL, N'ea5fq@yahoo.es', N'ea5fq@yahoo.es', NULL, NULL, 1, 0, CAST(N'2013-10-31 16:09:02.000' AS DateTime), CAST(N'2013-10-31 16:09:02.000' AS DateTime), CAST(N'2013-10-31 16:09:02.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4c27612c-2d66-494d-9e70-d91b9a37ce6e', N'VDIskarji4hMkxHxj46j6TiunIV68o0+lLcsZiO02B4=', 2, N'fgT13TaU5rcGCVjs9/ma3w==', NULL, N'eleu9da@ciudad.com.ar', N'eleu9da@ciudad.com.ar', NULL, NULL, 1, 0, CAST(N'2012-10-29 15:10:53.000' AS DateTime), CAST(N'2012-10-29 15:10:53.000' AS DateTime), CAST(N'2012-10-29 15:10:53.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'586a7673-3230-449f-b5db-2da8fde49bf3', N'6mf8X4HmfAAnpG3oC1sMi6RDoWjH6w5O/fW85Vt0S80=', 2, N't+/P79YeVSgi8BWLPzaiMw==', NULL, N'ericvandervelde@hotmail.com', N'ericvandervelde@hotmail.com', NULL, NULL, 1, 0, CAST(N'2013-05-04 20:05:18.000' AS DateTime), CAST(N'2013-05-04 20:05:18.000' AS DateTime), CAST(N'2013-05-04 20:05:18.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'af37a765-0b05-4684-96df-4e5a1857edb1', N'H47WOOU9cxNtnMDDtQxL7Eqekv8VEVkRsTNQzQPgCUA=', 2, N'X0bCDfaEtoRd7wTjCqG+Hg==', NULL, N'F6ECB@windsat.com', N'f6ecb@windsat.com', NULL, NULL, 1, 0, CAST(N'2012-10-10 05:52:04.000' AS DateTime), CAST(N'2012-10-10 05:52:04.000' AS DateTime), CAST(N'2012-10-10 05:52:04.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'b6821fe2-4883-499d-b176-74cab6516d3a', N'DmkMKlBRwxJxPy9qF3nPijFs4fDY3zT8JJ0CLAVFNQE=', 2, N'z9Qt3DW3WQeBHoUskbIBoA==', NULL, N'f8bon@orange.fr', N'f8bon@orange.fr', NULL, NULL, 1, 0, CAST(N'2012-10-12 20:03:31.000' AS DateTime), CAST(N'2012-10-12 20:03:31.000' AS DateTime), CAST(N'2012-10-12 20:03:31.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'88a745ef-040d-4296-8104-0e6260a00108', N'T86gNHktKjIFi1TGaLPQLcnzTYsf9XcsYwI0/AdYXyYwbQV0X+PNC8nhOKFbKgtU', 2, N'1eWacxsc/F28hh1HgF7pfw==', NULL, N'fteston@gmail.com', N'fteston@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-07-14 13:51:03.000' AS DateTime), CAST(N'2013-07-14 13:51:03.000' AS DateTime), CAST(N'2013-07-14 13:51:03.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6f0a4ec0-e307-4ad4-9445-f93de97e58c8', N'qcZx9nlKpRZhOP06RiW76FWGI8xtRLarVPGdHxUVtU85WbIESwQvARUwu5y8947L', 2, N'r3yXMD8abM+voR/jIrMW1Q==', NULL, N'geirggj@haugnett.no', N'geirggj@haugnett.no', NULL, NULL, 1, 0, CAST(N'2013-03-01 08:50:16.000' AS DateTime), CAST(N'2013-03-01 08:50:16.000' AS DateTime), CAST(N'2013-03-01 08:50:16.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'e1f3956f-284f-4a67-90a0-c55c630cc075', N'jKfhdK2lshXpPljeMRjD70P4BUNvd49GbScygFLvHSqE06yshX/MBuMXfomwA9bt', 2, N'wBBK8B34xActWxiZXI1L5Q==', NULL, N'geneshea@gmail.com', N'geneshea@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-06 15:33:03.000' AS DateTime), CAST(N'2012-10-06 23:35:13.243' AS DateTime), CAST(N'2012-10-06 15:33:03.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd35274dd-e439-473c-9e34-10ff8fe9106d', N'369WSaLaI3Iao7D8mdZIcFKUtWpgf5yhGeXKlrw6FjzQNfVRSzNNoI6dd1Yl7OAu', 2, N'LZYCLVAP6jd6qpERpo0gdg==', NULL, N'ghays@cis-broadband.com', N'ghays@cis-broadband.com', NULL, NULL, 1, 0, CAST(N'2015-08-16 18:09:08.000' AS DateTime), CAST(N'2015-08-16 18:09:08.000' AS DateTime), CAST(N'2015-08-16 18:09:08.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'cbec1ae7-e6b1-43c1-9516-7ccba992694d', N'sk8W7bMQ+E9g2+KGXSGOEYnTBCNh4EKl+H6FTvkLC6xuSIrEb+rPIe7+xv/G9eQN', 2, N'cevqhfSgHcwSSP6sf2FAqA==', NULL, N'ham3radio@gmail.com', N'ham3radio@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-09-17 14:26:21.000' AS DateTime), CAST(N'2014-09-17 14:26:21.000' AS DateTime), CAST(N'2014-09-17 14:26:21.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'3428db84-2b18-44f7-9a28-1fc597d3dc4a', N'nKjoVb9qvbteUDw2zeMk8/cy91X8ixhFiBxbw4uF+5HhorYiz4MaoIMAjzfFMy8M', 2, N'p8TiE8vKUcHLFEjHU8GbeQ==', NULL, N'Hb9dur@gmail.com', N'hb9dur@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-14 04:11:20.000' AS DateTime), CAST(N'2012-10-14 04:11:20.000' AS DateTime), CAST(N'2012-10-14 04:11:20.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'9c0dcc67-a17a-4397-85d9-77d7ae98dccc', N'nTEvOSADJY8Ui0rYp0bhwKRqVzBs4qbLUZ44i8ezaLR4BgKq23FPG2IGb9tqOp+G', 2, N'ppDBRq0bhBMmW3C+Ix7t1A==', NULL, N'I2gpt@yahoo.it', N'i2gpt@yahoo.it', NULL, NULL, 1, 0, CAST(N'2012-10-07 19:48:10.000' AS DateTime), CAST(N'2012-10-07 19:48:10.000' AS DateTime), CAST(N'2012-10-07 19:48:10.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'fd30c2dd-16d9-4679-860b-507555a77971', N'5XJFNsq8q/dicLKZWRKdfO9SgOKC3Y4EfPTWzgI0XfIUQNLrOoYTyLHAQdIDpOsE', 2, N'Ul+7mc9mrZhvLMCOZlD7ng==', NULL, N'idigresve1978@hotmail.com', N'idigresve1978@hotmail.com', NULL, NULL, 1, 0, CAST(N'2012-11-07 10:02:23.000' AS DateTime), CAST(N'2012-11-07 10:02:23.000' AS DateTime), CAST(N'2012-11-07 10:02:23.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'5df08dc9-7f94-47d2-99bb-55dcb9d8a401', N'kFwpnoTtrIBpc0hk+xqUX5UCCSFBG5/VhC6XozivwF2EAiBtn+aD6eCn9CxFWqSt', 2, N'6XzasftbAWADkcS6fLS9cw==', NULL, N'ik7imo@libero.it', N'ik7imo@libero.it', NULL, NULL, 1, 0, CAST(N'2012-10-15 18:32:33.000' AS DateTime), CAST(N'2012-10-15 18:32:33.000' AS DateTime), CAST(N'2012-10-15 18:32:33.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd75d5bd7-ec97-44b7-a1f9-cb4773b1b334', N'1KMwRYnGsfMtRabXgY+XY4c/rayYcIlZKYHmc9pdHBm5KliG/952OWndaBjMXrPN', 2, N'U/j32GoPO3ItR/uTdVSVfg==', NULL, N'ik7jwy@alice.it', N'ik7jwy@alice.it', NULL, NULL, 1, 0, CAST(N'2013-10-23 20:33:39.000' AS DateTime), CAST(N'2013-10-23 20:33:39.000' AS DateTime), CAST(N'2013-10-23 20:33:39.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'94831b44-4cce-4232-8e1a-8a959d104555', N'qhgMHgQMOciYiKBeyaauQl1b2zeSQ8Vi8r9g0TKlT2fSTLwCiEvxCBycupOOLtjy', 2, N'f9At8z+y7nEDvlWoDL/SLg==', NULL, N'it9huv.sal@hotmail.it', N'it9huv.sal@hotmail.it', NULL, NULL, 1, 0, CAST(N'2012-11-16 09:58:47.000' AS DateTime), CAST(N'2012-11-16 09:58:47.000' AS DateTime), CAST(N'2012-11-16 09:58:47.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd54268ab-020b-4577-a5b8-c595686f5c02', N'pEbeaQZwlo9DivTLQcLH1sU2yeD7/SjQDRdTEMuhxgVo4J9Cc6Hq3VzmmCIUjZ4a', 2, N'PIZddkyAsADcmmJSy0MgWg==', NULL, N'IU3CIB@gmail.com', N'iu3cib@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-11-07 17:35:08.000' AS DateTime), CAST(N'2014-11-28 21:29:36.260' AS DateTime), CAST(N'2014-11-07 17:35:08.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7b9434f2-f6d7-4a7a-8fee-b33336a398b8', N'XfNjQ7lu2L1265xUaVt7dly4vLiHRTCdMf8Obd4V9euPlHbWEzuQOVQpYrUWyuTP', 2, N'LW+Td8GSZQLule079BNDug==', NULL, N'iz2wfl@gmail.com', N'iz2wfl@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-10-31 10:41:33.000' AS DateTime), CAST(N'2014-10-31 10:41:33.000' AS DateTime), CAST(N'2014-10-31 10:41:33.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'5d7bbe07-ca4a-456b-8db1-605cc91fa922', N'bNkd91YIsU09zg8JeI6RZZ351fwplfxC3Adgdew69Wk=', 2, N'0ikRrSDJwiGLKZw8PC+nuQ==', NULL, N'javi4dx@gmail.com', N'javi4dx@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-12 17:52:07.000' AS DateTime), CAST(N'2012-10-12 17:52:07.000' AS DateTime), CAST(N'2012-10-12 17:52:07.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'8b0827f7-aee8-4765-a5b3-51b2e68f701f', N'fYR5zSeyzHZ+NW1CXolIXFvRYLYS8xT65vII/YSr+q4=', 2, N'DH3WH5nOBKBRry3Yv+Scug==', NULL, N'jg1vgx@jarl.com', N'jg1vgx@jarl.com', NULL, NULL, 1, 0, CAST(N'2013-05-07 18:27:09.000' AS DateTime), CAST(N'2013-05-08 12:07:35.390' AS DateTime), CAST(N'2013-05-07 18:27:09.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'2e4de647-6abe-4b6a-9472-e0380151b18a', N'6yA7BD/Ohb8EaDNOgmTrfQgAHdLlHmCFVo9xn8IuPfdwTxTHUVL2DsDhW6NUmshn', 2, N'fbm3vChdJhsz8b8O9OpE6w==', NULL, N'jims@psws.com', N'jims@psws.com', NULL, NULL, 1, 0, CAST(N'2012-09-22 10:38:22.000' AS DateTime), CAST(N'2013-09-17 22:24:48.810' AS DateTime), CAST(N'2012-09-22 10:38:22.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'f55cdaa6-4391-46e8-b0f9-9c273341dd9a', N'LBTtSw9l8tjbFEloV3+GsxxthNXbO1Gbhp2Yvf9qKaiZ+WpyiUXo/d/OyrMXw+DT', 2, N'zFKymZGvnGWq4NUMHEMl/Q==', NULL, N'jjadarfah@yahoo.com', N'jjadarfah@yahoo.com', NULL, NULL, 1, 0, CAST(N'2013-04-04 09:13:38.000' AS DateTime), CAST(N'2013-04-04 09:13:38.000' AS DateTime), CAST(N'2013-04-04 09:13:38.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a001c63e-79c3-48e3-98ad-a3d9fcf548d9', N'b+uDHJRfcH8/Cadbel65Ng1KtvbegopdTGcd/uF8k6k=', 2, N'ZZbmFj6sHH2u+368LDrU5A==', NULL, N'joel.lobao@gmail.com', N'joel.lobao@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-05-04 17:04:57.000' AS DateTime), CAST(N'2013-05-04 17:04:57.000' AS DateTime), CAST(N'2013-05-04 17:04:57.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'ba300f3e-244a-458b-990a-b935ca4bd06c', N'IUEhFrQ8KIn9l4iItL6BWVReX5JLsw/DHqAyFPMHJyi1xAXMiFb3WAWu+Dz2vlQy', 2, N'dlV64R/ZUjfCtpr/D7XPfQ==', NULL, N'joriebedegov@yahoo.com', N'joriebedegov@yahoo.com', NULL, NULL, 1, 0, CAST(N'2015-08-19 23:27:31.000' AS DateTime), CAST(N'2015-08-19 23:27:31.000' AS DateTime), CAST(N'2015-08-19 23:27:31.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'9062a16c-9f7a-4e2d-928d-805b3bb5bc8b', N'tu95/wJqJP0TSefMqRL2rX4wrE9WThCIXWsWeWHOO3U=', 2, N'nKSS5vJUCCIHgEr3Sb3e8w==', NULL, N'jp_aju@gmx.com', N'jp_aju@gmx.com', NULL, NULL, 1, 0, CAST(N'2014-09-30 03:59:37.000' AS DateTime), CAST(N'2014-09-30 03:59:37.000' AS DateTime), CAST(N'2014-09-30 03:59:37.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6c5c48b1-cb26-4de8-9090-36511139fb26', N'ENyDX+sMNJltwxmQuWM/NmDK/z9DrpQU37orfXk8S2J92bQo/uG5QtFrRbiapLc0', 2, N'gSSCpPHBSK/A7UdtfBRSdg==', NULL, N'k3ww@fast.net', N'k3ww@fast.net', NULL, NULL, 1, 0, CAST(N'2013-05-06 11:21:48.000' AS DateTime), CAST(N'2013-05-06 11:21:48.000' AS DateTime), CAST(N'2013-05-06 11:21:48.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'1e8b0a09-0eaa-4722-81c7-ca99ce50f7fd', N'BfYjZ/4dovvla7pzryq2HTPPoSAzI7z1phwqGbvuqSRfKSZz40aEMeLVT32IawUR', 2, N'DDYs5I8EgSIqZZ5fEwLSSQ==', NULL, N'k4wi@earthlink.et', N'k4wi@earthlink.et', NULL, NULL, 1, 0, CAST(N'2013-05-04 23:44:06.000' AS DateTime), CAST(N'2013-05-04 23:44:06.000' AS DateTime), CAST(N'2013-05-04 23:44:06.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'66cfec90-300a-43c3-9e17-0f9688193358', N'N+9d52qaMfrdQ97l8DVy1/iAq1+JIRn0WVNiO1UGXs2CbzU3LzRR3Gzo+T1CeF1G', 2, N'BtmE32/7iX0jsvfRZWlmOA==', NULL, N'kaleybomn@outlook.com', N'kaleybomn@outlook.com', NULL, NULL, 1, 0, CAST(N'2015-04-09 16:56:24.000' AS DateTime), CAST(N'2015-04-10 00:48:46.713' AS DateTime), CAST(N'2015-04-09 16:56:24.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'69dc0016-c11e-497d-ad05-bb6dfe01e430', N'Q6UAuHy93r7eBjEfEP60euMkdWIdVxAXkdCKNnN2H4/UGj6pXq06PctzHNmDau8Y', 2, N'lghRx6Fk59Raq1R1kXKxBQ==', NULL, N'kelsygremer@outlook.com', N'kelsygremer@outlook.com', NULL, NULL, 1, 0, CAST(N'2015-07-30 04:36:42.000' AS DateTime), CAST(N'2015-07-30 04:36:42.000' AS DateTime), CAST(N'2015-07-30 04:36:42.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'0ef54a3f-800e-46af-bc48-34f64dfcb468', N'tbvRy9dBIVXCOlCgSnJ9S94pZBQ+jUBCLtDTfPOUFjWrJSL475NjBNhrH47oRqNm', 2, N'dAV1do8D8lK2DmjFVmnXcw==', NULL, N'KI6SEJ@arrl.net', N'ki6sej@arrl.net', NULL, NULL, 1, 0, CAST(N'2013-07-05 08:25:35.000' AS DateTime), CAST(N'2013-07-05 08:25:35.000' AS DateTime), CAST(N'2013-07-05 08:25:35.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'282ae536-ace5-4d44-af41-080b41ca351e', N'6uhj0V8mqA0gF7793D4pJyv0SZmP3qry6AhCdoc9gGizyUPG/TaAP7AnC8j/DES6', 2, N'F1r62pBO8jUKrSHFtGWGLg==', NULL, N'krzysztof.mieloszyk@gmail.com', N'krzysztof.mieloszyk@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-06-18 13:48:32.000' AS DateTime), CAST(N'2014-06-18 15:53:34.053' AS DateTime), CAST(N'2014-06-18 13:48:32.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'45fb30de-f986-48a4-a932-149f6cbdbda3', N'MCoRWRvY3LwiKsWaypD/ZhdrXFAWeHjitCwhgyWxZRCBbm39hETdYkR+QSsSVjsY', 2, N'9OJo6+xo4TyS0peJXkGvfw==', NULL, N'kt4xa@yahoo.com', N'kt4xa@yahoo.com', NULL, NULL, 1, 0, CAST(N'2012-10-06 18:20:29.000' AS DateTime), CAST(N'2012-10-06 18:20:29.000' AS DateTime), CAST(N'2012-10-06 18:20:29.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'02f30a64-fac4-4cfb-a79b-42b9dcf43253', N'isP5b46YNczmdJRM1S+DC4qys9BU2E1e8294Hd5PqhvwfmJGjDAbnnqg2QOjaZOu', 2, N'YFOUHPBQvd6Z2g6vwJ/xJQ==', NULL, N'ky4f@arrl.net', N'ky4f@arrl.net', NULL, NULL, 1, 0, CAST(N'2012-10-06 12:58:16.000' AS DateTime), CAST(N'2012-10-15 20:17:12.003' AS DateTime), CAST(N'2012-10-06 12:58:16.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4f72a227-d032-4bd1-9910-f022809c6a16', N'uUys9CRoh7eWi9jd1s6JqrJtU1n7E6NimQz8ckx11zuP7sgflxarGCwM6uLv0Y+t', 2, N'BTwy4zH/ojCq7i7K9ie8TQ==', NULL, N'ky5rtim@gmail.com', N'ky5rtim@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-06 15:28:04.000' AS DateTime), CAST(N'2012-10-06 15:28:04.000' AS DateTime), CAST(N'2012-10-06 15:28:04.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a99053c3-4cd2-4f42-ac12-db74e33c4ec7', N'ES/wKBioZxg5WUuq0U1vp5I839lo2Nrr0ztGZHBJpBVC6db3jspPi6GXa2cpDZK5', 2, N'QpzY3q0NvBvbQ6w/SUehKQ==', NULL, N'lb1gb@la8w.com', N'lb1gb@la8w.com', NULL, NULL, 1, 0, CAST(N'2012-11-14 06:34:49.000' AS DateTime), CAST(N'2012-11-14 06:34:49.000' AS DateTime), CAST(N'2012-11-14 06:34:49.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'abfdc462-d635-4bdc-b29c-206f26903012', N'kBwUNiKQinicxHySQXz2zyBl+MfzKPoCG/CiwglAp3kybxz9QCLNyCTehYi5cSRK', 2, N'yqp8pq4V9Eg6MyoMU+FSqw==', NULL, N'loudx59@virgilio.it', N'loudx59@virgilio.it', NULL, NULL, 1, 0, CAST(N'2013-02-08 10:22:08.000' AS DateTime), CAST(N'2013-02-08 10:22:08.000' AS DateTime), CAST(N'2013-02-08 10:22:08.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'eff88fe2-6f7d-401f-9508-1162743d5781', N'AeGpifcr6Pl8iYDxPNwx5edCS9lWdM/He9j1mW+3gT2PnNN/Typ9dx5vJkAZn/+f', 2, N'DI+67X4+DLbt7zpMwijzig==', NULL, N'lu1aee@lucg.com.ar', N'lu1aee@lucg.com.ar', NULL, NULL, 1, 0, CAST(N'2013-05-04 22:23:39.000' AS DateTime), CAST(N'2013-05-04 22:45:12.860' AS DateTime), CAST(N'2013-05-04 22:23:39.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4a0b105f-ab81-4032-9930-660b1e7b5637', N'DrOL+NJccIbiONvEtYAphOPnhWBbvEopWU+bNRI9ER1fBCWEAL+7+L6lNRW4KkEs', 2, N'l6T4XfA5w0smCTclXOcARg==', NULL, N'lu2dt@hotmail.com', N'lu2dt@hotmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-01 22:50:23.000' AS DateTime), CAST(N'2012-10-01 22:50:23.000' AS DateTime), CAST(N'2012-10-01 22:50:23.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'289c2105-a8fd-4070-8995-caeafc7d31df', N'6AatLsGQxVmhQtBRZGjssg1rinu6E2HtiiU6BJ1gNh3+/tqSYL627cHnedIsT8jY', 2, N'hon0thQQUZGCxGbMB44Pww==', NULL, N'lu7fts@hotmail.com', N'lu7fts@hotmail.com', NULL, NULL, 1, 0, CAST(N'2012-12-04 03:20:09.000' AS DateTime), CAST(N'2012-12-04 03:20:09.000' AS DateTime), CAST(N'2012-12-04 03:20:09.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'0066b486-cbc2-4497-b1c8-a07507618b88', N'xbgRNE30ZkeF2Utwh0Y4CFlJQ/YiHBgsdurtOKlYMC9RBAqt3Y9ergtPgIVm9fiA', 2, N'mWWwMQqrYKzHlbgTQdiM0g==', NULL, N'luba@psws.com', N'luba@psws.com', NULL, NULL, 1, 0, CAST(N'2013-12-15 21:03:29.000' AS DateTime), CAST(N'2013-12-15 21:03:29.000' AS DateTime), CAST(N'2013-12-15 21:03:29.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'207f723b-9232-4189-8512-ebf1ce8d4c60', N'WJrqE5RvVXXp3dj5Kgm6pwCjWMck2zoHoOJE4XPsQfo=', 2, N'RVs0QtsEG0UE6eMWA3Y28Q==', NULL, N'ly2bfn@gmail.com', N'ly2bfn@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-03-29 16:10:03.000' AS DateTime), CAST(N'2013-03-29 16:10:03.000' AS DateTime), CAST(N'2013-03-29 16:10:03.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'b8992984-bce5-4384-9dd3-4b0593bf1d22', N'lCVfzhzNEMPVyeuMlEpJy6duRBrF1PI/ncTHPX2oSVM=', 2, N'quBlfEDEnt9oYtrMJGpmOA==', NULL, N'ly2w@zebra.lt', N'ly2w@zebra.lt', NULL, NULL, 1, 0, CAST(N'2013-11-11 09:39:37.000' AS DateTime), CAST(N'2013-11-11 09:39:37.000' AS DateTime), CAST(N'2013-11-11 09:39:37.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7a1482c6-7703-45da-ae38-89ae6ff88602', N'BTCYUN6JQQ3aBxvZYDWCYs0nnItECQZB30OWeDRWTJw=', 2, N'c/afOsonxFoTmymV3G63eg==', NULL, N'lz2sx@abv.bg', N'lz2sx@abv.bg', NULL, NULL, 1, 0, CAST(N'2013-11-25 15:15:50.000' AS DateTime), CAST(N'2013-11-25 15:15:50.000' AS DateTime), CAST(N'2013-11-25 15:15:50.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'10f754e4-8f53-4e37-98af-bebe27c387aa', N'f2561FYmNQcbnL/XFuxtxbKhhL+rZcQjyMCLdcIWUWE=', 2, N'3AmhGT2UMfCzXdgBXA0zhQ==', NULL, N'marianwag@gmail.com', N'marianwag@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-16 15:05:48.000' AS DateTime), CAST(N'2015-03-05 12:05:14.467' AS DateTime), CAST(N'2012-10-16 15:05:48.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'39eeae5b-ba7d-4e28-9aa1-2f3315acfcf6', N'xGXJghQcAqcE8odvI0OmVKk4tCcGJlQZBnx++4SHmGL138AtanuRYHJwD1Gu1Pz5', 2, N'Vf0DlZD79NEgP2kfS4CWcA==', NULL, N'n2tta@yahoo.com', N'n2tta@yahoo.com', NULL, NULL, 1, 0, CAST(N'2013-05-05 00:39:21.000' AS DateTime), CAST(N'2013-05-05 00:39:21.000' AS DateTime), CAST(N'2013-05-05 00:39:21.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'20a942c5-8b92-45ed-aee3-fa1f9c6de00d', N'uKUiMNtzh9IYgR5x1oQNEQM9+FcvR8fAsG/iDOiHovBDrONDTvnK4mfTM8zOmIP7', 2, N'Q56490z5FUxeixiRazOAxA==', NULL, N'n4bp@bellsouth.net', N'n4bp@bellsouth.net', NULL, NULL, 1, 0, CAST(N'2014-12-28 12:03:12.000' AS DateTime), CAST(N'2014-12-28 12:03:12.000' AS DateTime), CAST(N'2014-12-28 12:03:12.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'e32c5f6b-fb16-4b44-9b8f-141be4e988f7', N'lreZkr4069bGSLRjaXev9WMC6n/bpBSR+1BcKQVTk9YF/KFfVB+HnYwoWe+hcivS', 2, N'5uyXmy2OXMgcBoaYTT5xIA==', NULL, N'n8hm@arrl.net', N'n8hm@arrl.net', NULL, NULL, 1, 0, CAST(N'2012-11-26 03:33:32.000' AS DateTime), CAST(N'2012-11-26 03:33:32.000' AS DateTime), CAST(N'2012-11-26 03:33:32.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'bd2b3335-774d-4abd-a287-406cee5bcaed', N'VWwIFELZDfXAlUxOgI4O2dGYrU/Ct35e/G75YgNBtMZgNPxHKAFzbCXsME5wFvVm', 2, N'5UMe5hAqmVhvkpndzErqqg==', NULL, N'nm57ordinaryband587@outlook.com', N'nm57ordinaryband587@outlook.com', NULL, NULL, 1, 0, CAST(N'2015-08-07 02:43:09.000' AS DateTime), CAST(N'2015-08-07 02:43:09.000' AS DateTime), CAST(N'2015-08-07 02:43:09.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'56381983-e53a-4cd5-a9a7-751de38b83bf', N'e0+3i2laKGd04TbtQkeNWIFNgXnPe3uJ2GAsTggSLEL7PdHwWywyjdV3N7xhoaa8', 2, N'dnSZojF6ofDx+TIBZA9tgA==', NULL, N'ok4pa@seznam.cz', N'ok4pa@seznam.cz', NULL, NULL, 1, 0, CAST(N'2012-10-05 16:41:05.000' AS DateTime), CAST(N'2014-07-25 17:37:04.933' AS DateTime), CAST(N'2012-10-05 16:41:05.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6ce58a82-ee82-4400-9b6b-38afae6653d7', N'NHXAFkE6F35P7PbTsxMpoPaZmzPvxHQ05jCH1HdXx2Pa1+BK7xsw6hYFhLObyoKv', 2, N'WVKxqdD4MntoAetyIxYpUA==', NULL, N'oliviawab@outlook.com', N'oliviawab@outlook.com', NULL, NULL, 1, 0, CAST(N'2015-07-06 19:07:49.000' AS DateTime), CAST(N'2015-07-06 19:07:49.000' AS DateTime), CAST(N'2015-07-06 19:07:49.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6ff940d6-2fed-4ef9-9740-0d8a7012bfed', N'pxLxEuufInxZDTT48pos5mqKlX5PK8RUv8DcGYlDDL0=', 2, N'W+BsrJEwgFIk5IYhd5E+mQ==', NULL, N'om3rm@om-power.com', N'om3rm@om-power.com', NULL, NULL, 1, 0, CAST(N'2012-10-11 16:29:15.000' AS DateTime), CAST(N'2012-10-11 19:37:30.250' AS DateTime), CAST(N'2012-10-11 16:29:15.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'f5cfeaaa-9d57-45b9-a346-176af25a1b1e', N'n9nbSRX68Eh7e6ffBids1Jrb7tajTzsfRufegKG6MRo=', 2, N'9zc5kQ90BQl1VYUHOM6Zlw==', NULL, N'osvaldo.peralta@gmail.com', N'osvaldo.peralta@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-05-04 16:08:00.000' AS DateTime), CAST(N'2013-05-04 16:08:00.000' AS DateTime), CAST(N'2013-05-04 16:08:00.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'3cd8ea0c-f9d0-4c21-8bdf-189534e382e8', N'UqrotRVGukjL6GMPFt4+4PO9ULuHgW1APeVhqLesdFE=', 2, N'61fLn4K/T24JeJ9JxvELwg==', NULL, N'petar.bojovic.paxy@gmail.com', N'petar.bojovic.paxy@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-06-25 09:10:32.000' AS DateTime), CAST(N'2014-06-25 09:10:32.000' AS DateTime), CAST(N'2014-06-25 09:10:32.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'01e62a69-1f30-4a9d-9338-03be1ad6f2fa', N'vR40hISkjiq9YAnwBZDFMheLrexIQ97UPpbRtTvySPpEJvEovWOxM6UHbbJ3oM0z', 2, N'vYsFd1n33mE+BaxASirWmw==', NULL, N'pp2bt@dxbrasil.net', N'pp2bt@dxbrasil.net', NULL, NULL, 1, 0, CAST(N'2013-10-17 14:29:40.000' AS DateTime), CAST(N'2013-10-17 14:29:40.000' AS DateTime), CAST(N'2013-10-17 14:29:40.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7be2ed8e-dcf5-46c4-a5cd-07a748f755a6', N'834A7zb8nrrDBJwpdL2qVSvbeZ6UHv2zW7TmzG2WGx7UxtIzFXmt2406GelRga7e', 2, N'qq93NtXxK8lB63D2jT2mOA==', NULL, N'py2sex@gmail.com', N'py2sex@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-05-04 17:30:16.000' AS DateTime), CAST(N'2013-05-04 17:30:16.000' AS DateTime), CAST(N'2013-05-04 17:30:16.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'51618a6c-6fa5-4c7a-bb6e-1e39e0859fa5', N'3nZ4g3Xaf4qShAuI2vlKtBV+onEVtICn1/ZSv+jymlAq5+VfMg7Wc9sY8khZGAyv', 2, N'IuPcc4EuWWv+aTlMCD96+g==', NULL, N'py5eg@iesa.com.br', N'py5eg@iesa.com.br', NULL, NULL, 1, 0, CAST(N'2012-10-17 19:24:32.000' AS DateTime), CAST(N'2012-10-18 15:04:59.550' AS DateTime), CAST(N'2012-10-17 19:24:32.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'54ce7199-ee03-4170-93fe-e665d6ca0cce', N'oPeThkQJe3hFZm8XllxdUxOXQxqCgUKmLKejOQE/wXk=', 2, N'mNq8Dl/h1evrfuHwpduAxg==', NULL, N'r3km@yandex.ru', N'r3km@yandex.ru', NULL, NULL, 1, 0, CAST(N'2012-09-25 15:32:07.000' AS DateTime), CAST(N'2012-09-25 15:32:07.000' AS DateTime), CAST(N'2012-09-25 15:32:07.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd2210799-7119-4882-a469-e96127f38ff5', N'czhpNfVFCRBLLRrQUeF5Ah+N2aoax+vh2zeLsaQwYLWerO4KxB+E3d6zopF8W1ye', 2, N'YCu+bJWJiZTc8ZpcljLytA==', NULL, N'r5ga@ya.ru', N'r5ga@ya.ru', NULL, NULL, 1, 0, CAST(N'2013-11-11 06:05:56.000' AS DateTime), CAST(N'2013-11-11 06:05:56.000' AS DateTime), CAST(N'2013-11-11 06:05:56.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6c643baa-8a35-4a2c-a233-e523efa53807', N'Ku4MDzYWUxTfxZ2XQmLDby2HLXkNM56Pmx0gYqd9PCo=', 2, N'2WJY62ALHUo0OS1Md0nHtQ==', NULL, N'ra9aa@yandex.ru', N'ra9aa@yandex.ru', NULL, NULL, 1, 0, CAST(N'2012-09-26 03:11:09.000' AS DateTime), CAST(N'2012-09-26 03:11:09.000' AS DateTime), CAST(N'2012-09-26 03:11:09.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7c06c9de-812a-4ab9-8282-94a6086eba4f', N'eow6fH3EdsfFrUvSgbLc1vixKKd95bhwvROUZ+3heLBTWuZ+8YaNerDmAJgoQdW7', 2, N'Na7fi2UmjDkVXzBhwrNKUg==', NULL, N'rbs2013188@gmail.com', N'rbs2013188@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-07-23 12:59:30.000' AS DateTime), CAST(N'2013-07-23 12:59:30.000' AS DateTime), CAST(N'2013-07-23 12:59:30.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd4b2840f-234d-4146-ac20-e9f2f706c756', N'gBvnuIkhzGg8QlmJpQxedStqfATmSzweygCy5OKNY1aBTEFvKpdbWnmllbpsXIut', 2, N'L5PbDnEUlqrBL5laiKw9rw==', NULL, N'rcrgs@verizon.net', N'rcrgs@verizon.net', NULL, NULL, 1, 0, CAST(N'2012-12-07 17:17:38.000' AS DateTime), CAST(N'2012-12-07 17:17:38.000' AS DateTime), CAST(N'2012-12-07 17:17:38.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd20bb35e-7d58-461d-8c69-ab02662bbb4e', N'CpxupoFewuZ1fZumeb192H+plOWzH5OxhQZV2pB66g6CRErwxrjfCmpVirkW4OR1', 2, N'w0QbRqP3a2iV/irSDV06fA==', NULL, N'rick@nq4i.com', N'rick@nq4i.com', NULL, NULL, 1, 0, CAST(N'2012-10-06 13:47:25.000' AS DateTime), CAST(N'2012-10-06 13:47:25.000' AS DateTime), CAST(N'2012-10-06 13:47:25.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'0c734179-9b22-4606-9ad0-f3b641669886', N'QEkCcMnGqAYTNzrTSrhEcATaglfRfzvaKGtZt7PhLlE=', 2, N'8J38Rpx4DvbBlDy53lVSCA==', NULL, N'riki.zd@gmail.com', N'riki.zd@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-10-31 20:10:14.000' AS DateTime), CAST(N'2013-10-31 20:10:14.000' AS DateTime), CAST(N'2013-10-31 20:10:14.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4a47bc64-c74f-4540-b82c-23a017ae6bf6', N'mwbKejPWAj3OX7ydq657nphtHmJN8lNzfgLRjevcdKUHQX29cZHA/NRrBhG6JVh/', 2, N'JYggIen5Pbm7GYqtP0HNuw==', NULL, N'rockfolyle1987@hotmail.com', N'rockfolyle1987@hotmail.com', NULL, NULL, 1, 0, CAST(N'2012-11-07 09:27:41.000' AS DateTime), CAST(N'2012-11-07 09:27:41.000' AS DateTime), CAST(N'2012-11-07 09:27:41.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'49a2871c-bd4e-4906-9a4e-7689006f53cf', N'+6YQ8Ie7jiaFBQZvV483xv68KdyOk0oLR3wJhM9XlYdI+IxXEcU+N1FhirS3t1vq', 2, N'WqEyH2jShJFCQTl7oRc6nA==', NULL, N'rv1aw@inbox.ru', N'rv1aw@inbox.ru', NULL, NULL, 1, 0, CAST(N'2012-09-28 18:45:45.000' AS DateTime), CAST(N'2012-09-28 18:45:45.000' AS DateTime), CAST(N'2012-09-28 18:45:45.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'222d4c4c-83e4-47bd-9772-bbdc3924e5e9', N'4uoXbvvRYmmG+ClPSHdrFvT1goYFgWxWSAjI7Aghr0bTbXsduaHfFVd35XIjuEPw', 2, N'jSOfMcYwBuxqiruRyhigRA==', NULL, N'sarlabs sarlabs@gmail.com', N'sarlabs sarlabs@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-05-04 15:53:48.000' AS DateTime), CAST(N'2013-05-04 15:53:48.000' AS DateTime), CAST(N'2013-05-04 15:53:48.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'3cb7fc2e-c293-4b6d-b8c9-28abda041589', N'+NTO3/zBvO9/gN93WC1M9aehUWIXLZpQcg3/MaswfG03Rz4jr9KDnVuqB3g5TIKb', 2, N'TdH42lCSCm7MjUjY7ITsEw==', NULL, N'senkarepo1985@hotmail.com', N'senkarepo1985@hotmail.com', NULL, NULL, 1, 0, CAST(N'2012-11-07 08:38:11.000' AS DateTime), CAST(N'2012-11-07 08:38:11.000' AS DateTime), CAST(N'2012-11-07 08:38:11.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'c3f84ed7-817c-4bc4-844c-1e94e8f4b5d2', N'HcZU3UlT66dj7iltE2bPz71MdBvvrNn5ll/1g8wNnNo4S7rwPE95qEbKlKdlBUXZkx4qOB1WmFcrlKib4L5I0w==', 2, N'lY2Aax5iQueO1veJsZziSw==', NULL, N'sp5kp@wp.pl', N'sp5kp@wp.pl', NULL, NULL, 1, 0, CAST(N'2013-12-26 09:49:23.000' AS DateTime), CAST(N'2013-12-26 09:49:23.000' AS DateTime), CAST(N'2013-12-26 09:49:23.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'e22134a8-8364-431e-8acf-0cfd35f06026', N'5FMGznnPbvUC56BG+4febTT25A2QzlwE4YB274K35oUKufz+6DzVnT8+0PcKiR6h', 2, N'I+ksAANotV0QDxDkCWxT+w==', NULL, N'sp6fun@kk.pl', N'sp6fun@kk.pl', NULL, NULL, 1, 0, CAST(N'2014-11-09 15:45:31.000' AS DateTime), CAST(N'2014-11-09 15:45:31.000' AS DateTime), CAST(N'2014-11-09 15:45:31.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'97ddd825-4673-4405-9b20-4f1a6ab21503', N't6z8EvFfKsx/jCIVsgBYBOfFnR2JzjdCjThsSax2Yak=', 2, N'dOH3JSyNTd+Uwg63mTy/oQ==', NULL, N'sp6oje@interia.pl', N'sp6oje@interia.pl', NULL, NULL, 1, 0, CAST(N'2014-11-28 12:01:39.000' AS DateTime), CAST(N'2014-11-28 12:01:39.000' AS DateTime), CAST(N'2014-11-28 12:01:39.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'de958ba6-3f3f-43a1-93e6-e87000045c2d', N'KcNdyl+vSlHZuyxtMdVn1bjMCJ1h1/SYsj3S/6j5hvZg/33Z/jSM1BNz2Zf7qN2m', 2, N'8/FY9kqvQcbE0AvGTnHcWg==', NULL, N'steefpa3s@gmail.com', N'steefpa3s@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-05-07 13:20:27.000' AS DateTime), CAST(N'2013-05-07 13:20:27.000' AS DateTime), CAST(N'2013-05-07 13:20:27.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'bd4a59a8-ca27-44a4-8d5e-64acea25be98', N'yCXrkPTAtXpGAYi68xslo1BXWIQyKEO/B0SEdsyDKg4=', 2, N'DTbWggX0sN5SJbCJQ4ncyg==', NULL, N'stevewerner73@gmail.com', N'stevewerner73@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-07 00:22:41.000' AS DateTime), CAST(N'2012-10-07 00:22:41.000' AS DateTime), CAST(N'2012-10-07 00:22:41.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'634d6b51-23b5-4d42-8c83-d54d822107dc', N'4C6bvaXuYTkHO6D4U6GTZGNXfIzaMGUi/yx1HYkRiD4=', 2, N'ONtx11m8VYj+Z0uB6f1GwQ==', NULL, N'sv5dkl@rho.forthnet.gr', N'sv5dkl@rho.forthnet.gr', NULL, NULL, 1, 0, CAST(N'2012-10-29 08:31:13.000' AS DateTime), CAST(N'2012-10-29 08:31:13.000' AS DateTime), CAST(N'2012-10-29 08:31:13.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a35fab2d-59bd-40d3-bea0-f09f983fbea0', N'P+Wx/MMON0jZn+/l5TpclU8MQqRVtrbAYnj8EUpFSGZfGcbfCwUR1vaAHoZud6tM', 2, N'bIk58ZEZpj24qlQ8Ahdsvw==', NULL, N'ta1dx3@gmail.com', N'ta1dx3@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-20 21:53:42.000' AS DateTime), CAST(N'2012-10-20 21:53:42.000' AS DateTime), CAST(N'2012-10-20 21:53:42.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'30619efe-98d4-478d-a837-e2f410bbf8ad', N'aInItYWcopzI6dhbqX2lj2SIUZSVqJdzFPHUzYdCf2s2vDqfTnPpGQzrvyRPYB33', 2, N'Kq8TlQIBEJQ/l8B4LfbBWA==', NULL, N'teicocnera1983@hotmail.com', N'teicocnera1983@hotmail.com', NULL, NULL, 1, 0, CAST(N'2012-11-07 06:33:18.000' AS DateTime), CAST(N'2012-11-07 06:33:18.000' AS DateTime), CAST(N'2012-11-07 06:33:18.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd3d069ca-f0ef-42d9-a738-4974e6792b52', N'1m8uD9TSa0W54BWrr5g35Jt6uSIshKCfHt5nNUGHMFMVOjDz+CE5chD3V+EMzD3U', 2, N'z+05uF7eLgREShhltnWtXw==', NULL, N'tg9ajr@gmail.com', N'tg9ajr@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-08-01 15:30:18.000' AS DateTime), CAST(N'2014-08-01 15:30:18.000' AS DateTime), CAST(N'2014-08-01 15:30:18.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6fe00ed1-3f49-467f-b0e3-c988c44d2f9e', N'rWpI2rk4t3DQWsQcR0t/syXrEUCRL8nh47W52665NUHu2D9JOhjNim8lPLknRIxB', 2, N'vFgtUXW0TZkrkv4TDBzGMg==', NULL, N'ti2doa@yahoo.com', N'ti2doa@yahoo.com', NULL, NULL, 1, 0, CAST(N'2014-05-09 03:17:55.000' AS DateTime), CAST(N'2014-05-10 05:53:22.047' AS DateTime), CAST(N'2014-05-09 03:17:55.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'78c8103e-c9db-48f1-b4a7-f10682632e76', N'H4wlX2zyggH5+G7bZumxOvSfU60dyJObgdG4VITO5xDYUdf/oKOwzEQqwlevY+9m', 2, N'trL3ZbGsr6uKCdtL1zHyew==', NULL, N'tomas.kaplan@gmail.com', N'tomas.kaplan@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-15 08:20:08.000' AS DateTime), CAST(N'2012-10-15 08:20:08.000' AS DateTime), CAST(N'2012-10-15 08:20:08.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7e5b1285-cf26-484d-9557-25eeee5fc232', N'1CXTK+ccRtQjAAhLjK7a6zC/GxP+tl+4WLAZGSAl3YHQ6cK89BlcMZcHvYvPsZAG', 2, N'fdHme3NbjZ0yv+TNVRxajQ==', NULL, N'us5loc@mail.ru', N'us5loc@mail.ru', NULL, NULL, 1, 0, CAST(N'2012-10-10 12:07:36.000' AS DateTime), CAST(N'2012-10-10 12:07:36.000' AS DateTime), CAST(N'2012-10-10 12:07:36.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'5ea9a9ef-3550-4262-b6d0-dfa67093c7ea', N'CmRNiyF69bfnRgcD1E1wSHk95U9la4cAaIszcGlrLwBBk7FmsKeYMDsM3PQiR7vi', 2, N'JR9X9yqyOd7pF4Aq30ucug==', NULL, N've6jy.1@gmail.com', N've6jy.1@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-08 03:20:37.000' AS DateTime), CAST(N'2012-10-08 03:20:37.000' AS DateTime), CAST(N'2012-10-08 03:20:37.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'1812d673-2439-4955-bef3-bfbf4b052c62', N'v4EyxyvKclJhLrAvhG2+8xqh94sRRRXtbopNvGLRF7s=', 2, N'Su6gbdqdAOnVHu1pAbfr3g==', NULL, N've7zo@hotmail.com', N've7zo@hotmail.com', NULL, NULL, 1, 0, CAST(N'2012-10-05 09:37:44.000' AS DateTime), CAST(N'2013-02-13 05:23:16.867' AS DateTime), CAST(N'2012-10-05 09:37:44.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'c6f26e8a-4511-4fb6-a5a3-d5d4b850484e', N'Flb9diK0s6XEbqXQCdafpLSMFn/gtFExjaIhFqggDdDXy8VKv5a6/H2tOXkvOegM', 2, N'L2lTEP/4YkpUwa9SJbtsjQ==', NULL, N'vk2im9@gmail.com', N'vk2im9@gmail.com', NULL, NULL, 1, 0, CAST(N'2012-09-27 03:48:32.000' AS DateTime), CAST(N'2012-09-27 03:48:32.000' AS DateTime), CAST(N'2012-09-27 03:48:32.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'21158b39-484c-4108-bfcd-b3a809388ab2', N'G2ubHimrpf7MEi5lWkUsfq7P7t+XkVCORSEn/jY/vwc/E17H0vFjQspsdhJw1dDG', 2, N'+wWV5Cc7BSuq6gOC7xztHw==', NULL, N'vk9dx@hmamail.com', N'vk9dx@hmamail.com', NULL, NULL, 1, 0, CAST(N'2014-11-29 10:33:34.000' AS DateTime), CAST(N'2014-11-29 10:33:34.000' AS DateTime), CAST(N'2014-11-29 10:33:34.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'986629a8-f1e9-4635-906a-b48264c5eda6', N'0/Tls9+mA9EAgC53dJJ4d5xyH8BTuHiNYawzLRTJivu0hq7Uw4g4Fc090em9buq/', 2, N'UFZv7/JRfWdeH0vyDK41Xg==', NULL, N'w5tm001@gmail.com', N'w5tm001@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-11-05 03:57:19.000' AS DateTime), CAST(N'2013-11-05 03:57:19.000' AS DateTime), CAST(N'2013-11-05 03:57:19.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'51fb1bb9-a125-45ec-b8ce-7b2af922d42d', N'1hZF6IUl5izej1Bpo7Ly5ErbEDxjSWfV9ZZ1lvaySCmPs2ToCztpZr0MbWjpCdTL', 2, N'cI4AoF1bqBwgIRppOFXdoA==', NULL, N'w9gru@hmamail.com', N'w9gru@hmamail.com', NULL, NULL, 1, 0, CAST(N'2014-11-14 19:01:00.000' AS DateTime), CAST(N'2014-11-14 19:01:00.000' AS DateTime), CAST(N'2014-11-14 19:01:00.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'220779fa-0e2a-49c2-954f-6f1abd622009', N'ag8ZJmoax9CqH5V0sGYfIkkoKaAX29TSso72GSmHxRgcmZDisoNX8BpCqilitfqM', 2, N'xhrHVOfpMv2ouVrrOIhVUA==', NULL, N'wb4omm!@arrl.net', N'wb4omm!@arrl.net', NULL, NULL, 1, 0, CAST(N'2013-10-05 16:38:39.000' AS DateTime), CAST(N'2013-10-05 16:38:39.000' AS DateTime), CAST(N'2013-10-05 16:38:39.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'674629b2-2e6d-477d-91ad-ac6433fc0c3d', N'hKNKHIU47vSVWUzwDdrgymoI9DR2FZAvm3LYYk5D5Ro=', 2, N'ndSV3bSMoaTurp2NZcAKqQ==', NULL, N'WP4DT@HOTMAIL.COM', N'wp4dt@hotmail.com', NULL, NULL, 1, 0, CAST(N'2014-03-18 18:12:10.000' AS DateTime), CAST(N'2014-03-18 18:12:10.000' AS DateTime), CAST(N'2014-03-18 18:12:10.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'ccd3fa0e-69ee-40aa-9076-ac1c0b1cf6e9', N'h6tR7LCccaPQsVhYKbdM52tJ0o8N3QGCUp2d38Nef9o6HCvMgpY6j6kxQmpqol+n', 2, N'VtQLa3fHm2k+9V06o+BJFw==', NULL, N'xe1ct@yahoo.com.mx', N'xe1ct@yahoo.com.mx', NULL, NULL, 1, 0, CAST(N'2014-07-14 02:46:19.000' AS DateTime), CAST(N'2014-07-14 02:46:19.000' AS DateTime), CAST(N'2014-07-14 02:46:19.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'b96b1f06-8e98-443c-a927-ae4d5385d01d', N'FZWPv5K0R3N/cSQg+Abo/EEHiMoJRhpY+Hh6ES5sRaPc4WN3+3WD9q5yYRJHQKqc', 2, N'kjgH66J/nLW6if17UZy1+w==', NULL, N'yc6jrt@yahoo.co.id', N'yc6jrt@yahoo.co.id', NULL, NULL, 1, 0, CAST(N'2012-10-06 04:11:14.000' AS DateTime), CAST(N'2012-10-06 04:11:14.000' AS DateTime), CAST(N'2012-10-06 04:11:14.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4631f8d7-9d1d-4a26-8186-28e134a62892', N'5vr0PEshZJhwGAh1vhJ6qV8A5JZn6CWXIDrYSRUFysG/RlFzYWBZ5QPtikz1exce', 2, N'wr+6oImqazBcnusiEP6fmQ==', NULL, N'yinliu204@hotmail.com', N'yinliu204@hotmail.com', NULL, NULL, 1, 0, CAST(N'2013-05-11 00:58:54.000' AS DateTime), CAST(N'2013-05-11 00:59:03.560' AS DateTime), CAST(N'2013-05-11 00:58:54.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a2a48883-2734-4dc0-9315-cba0b1ffd65e', N'1rBdypJSGKFX2NBQmlUHoEKNvVHaZEqHXfyp6ARuYrA=', 2, N'1z95CvZopvpes9IliTMgHw==', NULL, N'yl2qn.andy@gmail.com', N'yl2qn.andy@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-01-23 00:17:43.000' AS DateTime), CAST(N'2014-04-10 22:45:33.510' AS DateTime), CAST(N'2014-01-23 00:17:43.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'bb2c1fdb-c778-471a-a239-0ac5fb884917', N'P4AAfbSiqk7U8G9qrCEyi3erNsCKGe3F9BDV9Ig2+eE=', 2, N'Yo0ZlFqoRKundEzmUEJg6w==', NULL, N'yu2fg@startcom.co.rs', N'yu2fg@startcom.co.rs', NULL, NULL, 1, 0, CAST(N'2012-10-08 11:13:18.000' AS DateTime), CAST(N'2012-10-08 11:13:18.000' AS DateTime), CAST(N'2012-10-08 11:13:18.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'44d8a84b-b671-4c5c-8986-20392021e9d1', N'rXcL1wx8TEK3Xjt+H7MWYiHuLiaeciD+aCzBViNybeFE3uaC7rx7sHW5aUnzUUvf', 2, N'T395kxnNNpGZEfCzJcaJfg==', NULL, N'yu6dx@yahoo.com', N'yu6dx@yahoo.com', NULL, NULL, 1, 0, CAST(N'2014-08-06 21:24:44.000' AS DateTime), CAST(N'2014-08-06 21:24:44.000' AS DateTime), CAST(N'2014-08-06 21:24:44.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'bb8896fd-1939-4858-b785-eca272aa5317', N'xZ6dGW9hCo4dPwSVVhSTTqTfUiVpN4aw9hpOb5qHjydr9XueVByk2uAVpx+0YQkc', 2, N'A5qCm6s9/Pbcd/9SaFEd4w==', NULL, N'YY4DNN@GMAIL.COM', N'yy4dnn@gmail.com', NULL, NULL, 1, 0, CAST(N'2013-04-22 16:17:55.000' AS DateTime), CAST(N'2014-08-11 16:33:48.253' AS DateTime), CAST(N'2013-04-22 16:17:55.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'62711f0c-9c98-4874-8da0-a369ac940619', N'5B4AFM', N'5b4afm', NULL, 0, CAST(N'2013-05-05 16:33:05.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'0c734179-9b22-4606-9ad0-f3b641669886', N'9a3w', N'9a3w', NULL, 0, CAST(N'2013-10-31 20:10:14.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'8b212336-3115-4c92-bbed-e51d61be7f81', N'9a5adt', N'9a5adt', NULL, 0, CAST(N'2012-10-06 11:42:11.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'bd2b3335-774d-4abd-a287-406cee5bcaed', N'AbbiFece', N'abbifece', NULL, 0, CAST(N'2015-08-07 02:43:09.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'bd4a59a8-ca27-44a4-8d5e-64acea25be98', N'ag4w', N'ag4w', NULL, 0, CAST(N'2012-10-07 00:22:41.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'c6475386-6392-4bad-8f12-6a8407de2a94', N'Alan_K0AV', N'alan_k0av', NULL, 0, CAST(N'2014-10-12 22:22:50.650' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'ba300f3e-244a-458b-990a-b935ca4bd06c', N'alexigot', N'alexigot', NULL, 0, CAST(N'2015-08-19 23:27:31.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'ee00d86a-0447-4890-96a7-bb4542e41fff', N'briettaNulk', N'briettanulk', NULL, 0, CAST(N'2015-08-13 13:43:48.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4631f8d7-9d1d-4a26-8186-28e134a62892', N'carson', N'carson', NULL, 0, CAST(N'2013-05-11 00:59:03.560' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'fd30c2dd-16d9-4679-860b-507555a77971', N'cliccatttorke', N'cliccatttorke', NULL, 0, CAST(N'2012-11-07 10:02:23.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'2e4de647-6abe-4b6a-9472-e0380151b18a', N'cn2r', N'cn2r', NULL, 0, CAST(N'2013-09-17 22:24:48.810' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'8dc21f86-11d9-4004-b79b-38ad5afffcdc', N'CN8KD', N'cn8kd', NULL, 0, CAST(N'2012-11-22 23:33:12.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a001c63e-79c3-48e3-98ad-a3d9fcf548d9', N'ct1hxb', N'ct1hxb', NULL, 0, CAST(N'2013-05-04 17:04:57.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'e0ca8d52-73ed-4c68-83b3-f465f1143665', N'DH7KU', N'dh7ku', NULL, 0, CAST(N'2013-01-08 16:15:38.730' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'df0b54ed-fd91-4051-b080-b087b1856fac', N'dl5ant', N'dl5ant', NULL, 0, CAST(N'2012-10-22 09:14:32.630' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd55f5733-b4cd-47db-bea0-68fed2ae1759', N'DL8OBF', N'dl8obf', NULL, 0, CAST(N'2012-10-06 10:54:31.290' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'af9bd053-cbd6-4ab0-99cf-669571d493cc', N'dqjyzflohi', N'dqjyzflohi', NULL, 0, CAST(N'2014-05-07 13:56:03.893' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'25bc6fdd-f8ed-4e3d-ac30-af667ca27b67', N'DV1UD', N'dv1ud', NULL, 0, CAST(N'2013-07-14 23:34:50.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a3de75cd-0b67-4eb8-a325-e8844d237afc', N'ea2cw', N'ea2cw', NULL, 0, CAST(N'2014-08-23 19:24:23.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a8061ad1-ba9f-4d73-8b4f-9ff568639a70', N'EA4KD', N'ea4kd', NULL, 0, CAST(N'2012-10-05 07:28:06.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'831d76a0-e021-4d85-abe6-8ebe4a2d4f43', N'ea5fq', N'ea5fq', NULL, 0, CAST(N'2013-10-31 16:09:02.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'5d7bbe07-ca4a-456b-8db1-605cc91fa922', N'EC4DX', N'ec4dx', NULL, 0, CAST(N'2012-10-12 17:52:07.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'66cfec90-300a-43c3-9e17-0f9688193358', N'EdwardMare', N'edwardmare', NULL, 0, CAST(N'2015-04-10 00:48:46.713' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'af37a765-0b05-4684-96df-4e5a1857edb1', N'F6ECB', N'f6ecb', NULL, 0, CAST(N'2012-10-10 05:52:04.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'b6821fe2-4883-499d-b176-74cab6516d3a', N'F8BON', N'f8bon', NULL, 0, CAST(N'2012-10-12 20:03:31.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'9b454b78-a8bf-4172-b60c-c62e3e13faf2', N'fahmykjtcr', N'fahmykjtcr', NULL, 0, CAST(N'2014-06-05 16:36:43.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7d764d17-1db9-46e6-b6c4-64ddf9706f8b', N'G3RXQ', N'g3rxq', NULL, 0, CAST(N'2015-02-28 17:54:00.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'3428db84-2b18-44f7-9a28-1fc597d3dc4a', N'Hb9dur', N'hb9dur', NULL, 0, CAST(N'2012-10-14 04:11:20.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'9c0dcc67-a17a-4397-85d9-77d7ae98dccc', N'I2gpt', N'i2gpt', NULL, 0, CAST(N'2012-10-07 19:48:10.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'5df08dc9-7f94-47d2-99bb-55dcb9d8a401', N'ik7imo', N'ik7imo', NULL, 0, CAST(N'2012-10-15 18:32:33.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd75d5bd7-ec97-44b7-a1f9-cb4773b1b334', N'IK7JWY', N'ik7jwy', NULL, 0, CAST(N'2013-10-23 20:33:39.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'abfdc462-d635-4bdc-b29c-206f26903012', N'IK8HCG', N'ik8hcg', NULL, 0, CAST(N'2013-02-08 10:22:08.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7b9434f2-f6d7-4a7a-8fee-b33336a398b8', N'it9huv', N'it9huv', NULL, 0, CAST(N'2014-10-31 10:41:33.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd54268ab-020b-4577-a5b8-c595686f5c02', N'IU3CIB', N'iu3cib', NULL, 0, CAST(N'2014-11-28 21:29:36.260' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'94831b44-4cce-4232-8e1a-8a959d104555', N'IZ2WFL', N'iz2wfl', NULL, 0, CAST(N'2012-11-16 09:58:47.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'8b0827f7-aee8-4765-a5b3-51b2e68f701f', N'JG1VGX', N'jg1vgx', NULL, 0, CAST(N'2013-05-08 12:07:35.390' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'8b31a7fe-f0f2-4869-ba29-c8735cdee530', N'K0AV', N'k0av', NULL, 0, CAST(N'2014-08-18 16:51:41.257' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'008670a8-c763-4ed5-b26e-aa163adabb2d', N'K1DG', N'k1dg', NULL, 0, CAST(N'2012-10-20 02:11:40.847' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6c5c48b1-cb26-4de8-9090-36511139fb26', N'K3WW', N'k3ww', NULL, 0, CAST(N'2013-05-06 11:21:48.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'1e8b0a09-0eaa-4722-81c7-ca99ce50f7fd', N'K4WI', N'k4wi', NULL, 0, CAST(N'2013-05-04 23:44:06.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'5343f596-5052-4311-aeb3-5e385019644e', N'k4xs', N'k4xs', NULL, 0, CAST(N'2012-10-13 23:16:20.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'04cf2475-53ee-4cdd-bba7-d79e0101c378', N'K8IA', N'k8ia', NULL, 0, CAST(N'2012-10-12 08:58:04.203' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'222d4c4c-83e4-47bd-9772-bbdc3924e5e9', N'K9CHP', N'k9chp', NULL, 0, CAST(N'2013-05-04 15:53:48.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'e1f3956f-284f-4a67-90a0-c55c630cc075', N'KB7Q', N'kb7q', NULL, 0, CAST(N'2012-10-06 23:35:13.243' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'0066b486-cbc2-4497-b1c8-a07507618b88', N'kb7wtm', N'kb7wtm', NULL, 0, CAST(N'2013-12-15 21:03:29.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd4b2840f-234d-4146-ac20-e9f2f706c756', N'ke2wy', N'ke2wy', NULL, 0, CAST(N'2012-12-07 17:17:38.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6fe00ed1-3f49-467f-b0e3-c988c44d2f9e', N'KE5RRN', N'ke5rrn', NULL, 0, CAST(N'2014-05-10 05:53:22.047' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'69dc0016-c11e-497d-ad05-bb6dfe01e430', N'KelsyFece', N'kelsyfece', NULL, 0, CAST(N'2015-07-30 04:36:42.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'0ef54a3f-800e-46af-bc48-34f64dfcb468', N'KI6SEJ', N'ki6sej', NULL, 0, CAST(N'2013-07-05 08:25:35.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4f72a227-d032-4bd1-9910-f022809c6a16', N'KT4TX', N'kt4tx', NULL, 0, CAST(N'2012-10-06 15:28:04.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'02f30a64-fac4-4cfb-a79b-42b9dcf43253', N'KY4F', N'ky4f', NULL, 0, CAST(N'2012-10-15 20:17:12.003' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6f0a4ec0-e307-4ad4-9445-f93de97e58c8', N'LA2VG', N'la2vg', NULL, 0, CAST(N'2013-03-01 08:50:16.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a99053c3-4cd2-4f42-ac12-db74e33c4ec7', N'LB1GB', N'lb1gb', NULL, 0, CAST(N'2012-11-14 06:34:49.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4a0b105f-ab81-4032-9930-660b1e7b5637', N'LT5D', N'lt5d', NULL, 0, CAST(N'2012-10-01 22:50:23.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'eff88fe2-6f7d-401f-9508-1162743d5781', N'LU1AEE', N'lu1aee', NULL, 0, CAST(N'2013-05-04 22:45:12.860' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'1793463b-5f73-4af0-aab5-4c4d0ac12c4d', N'LU1QS', N'lu1qs', NULL, 0, CAST(N'2012-10-12 16:47:58.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'f5cfeaaa-9d57-45b9-a346-176af25a1b1e', N'lu3mam', N'lu3mam', NULL, 0, CAST(N'2013-05-04 16:08:00.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'289c2105-a8fd-4070-8995-caeafc7d31df', N'lu7fts', N'lu7fts', NULL, 0, CAST(N'2012-12-04 03:20:09.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4c27612c-2d66-494d-9e70-d91b9a37ce6e', N'lu9da', N'lu9da', NULL, 0, CAST(N'2012-10-29 15:10:53.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'cbec1ae7-e6b1-43c1-9516-7ccba992694d', N'LY2BMX', N'ly2bmx', NULL, 0, CAST(N'2014-09-17 14:26:21.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'207f723b-9232-4189-8512-ebf1ce8d4c60', N'ly2fn', N'ly2fn', NULL, 0, CAST(N'2013-03-29 16:10:03.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'b8992984-bce5-4384-9dd3-4b0593bf1d22', N'ly2w', N'ly2w', NULL, 0, CAST(N'2013-11-11 09:39:37.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7a1482c6-7703-45da-ae38-89ae6ff88602', N'lz2sx', N'lz2sx', NULL, 0, CAST(N'2013-11-25 15:15:50.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'9f224c61-c0d6-48e8-ae2f-629e04a6367f', N'm0ddt', N'm0ddt', NULL, 0, CAST(N'2012-10-21 14:17:08.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'39eeae5b-ba7d-4e28-9aa1-2f3315acfcf6', N'n2tta', N'n2tta', NULL, 0, CAST(N'2013-05-05 00:39:21.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'20a942c5-8b92-45ed-aee3-fa1f9c6de00d', N'N4BP', N'n4bp', NULL, 0, CAST(N'2014-12-28 12:03:12.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'e32c5f6b-fb16-4b44-9b8f-141be4e988f7', N'N8HM', N'n8hm', NULL, 0, CAST(N'2012-11-26 03:33:32.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd20bb35e-7d58-461d-8c69-ab02662bbb4e', N'NQ4I', N'nq4i', NULL, 0, CAST(N'2012-10-06 13:47:25.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'45fb30de-f986-48a4-a932-149f6cbdbda3', N'nv4b', N'nv4b', NULL, 0, CAST(N'2012-10-06 18:20:29.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'78c8103e-c9db-48f1-b4a7-f10682632e76', N'ok1xoe', N'ok1xoe', NULL, 0, CAST(N'2012-10-15 08:20:08.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'56381983-e53a-4cd5-a9a7-751de38b83bf', N'ok4pa', N'ok4pa', NULL, 0, CAST(N'2014-07-25 17:37:04.933' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd9d7ee09-42c1-4f00-b534-6b0c09574082', N'OL7T', N'ol7t', NULL, 0, CAST(N'2012-10-23 19:41:19.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6ce58a82-ee82-4400-9b6b-38afae6653d7', N'Oliviacap', N'oliviacap', NULL, 0, CAST(N'2015-07-06 19:07:49.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'10f754e4-8f53-4e37-98af-bebe27c387aa', N'OM0MW', N'om0mw', NULL, 0, CAST(N'2015-03-05 12:05:14.467' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6ff940d6-2fed-4ef9-9740-0d8a7012bfed', N'om3rm', N'om3rm', NULL, 0, CAST(N'2012-10-11 19:37:30.250' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'de958ba6-3f3f-43a1-93e6-e87000045c2d', N'pa3s', N'pa3s', NULL, 0, CAST(N'2013-05-07 13:20:27.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'586a7673-3230-449f-b5db-2da8fde49bf3', N'PE3V', N'pe3v', NULL, 0, CAST(N'2013-05-04 20:05:18.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'01e62a69-1f30-4a9d-9338-03be1ad6f2fa', N'PP2BT', N'pp2bt', NULL, 0, CAST(N'2013-10-17 14:29:40.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'db0139b6-5431-43b3-bab3-8b01a32b0504', N'PT2CM', N'pt2cm', NULL, 0, CAST(N'2014-11-19 12:28:15.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'9062a16c-9f7a-4e2d-928d-805b3bb5bc8b', N'PU6ABE', N'pu6abe', NULL, 0, CAST(N'2014-09-30 03:59:37.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'88a745ef-040d-4296-8104-0e6260a00108', N'PY2MTI', N'py2mti', NULL, 0, CAST(N'2013-07-14 13:51:03.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7be2ed8e-dcf5-46c4-a5cd-07a748f755a6', N'PY2SEX', N'py2sex', NULL, 0, CAST(N'2013-05-04 17:30:16.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'51618a6c-6fa5-4c7a-bb6e-1e39e0859fa5', N'PY5EG', N'py5eg', NULL, 0, CAST(N'2012-10-18 15:04:59.550' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'42c23557-c927-4b28-8cdf-b18685467c0d', N'qemxsrjgmh', N'qemxsrjgmh', NULL, 0, CAST(N'2014-05-23 16:02:20.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'54ce7199-ee03-4170-93fe-e665d6ca0cce', N'R3KM', N'r3km', NULL, 0, CAST(N'2012-09-25 15:32:07.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd2210799-7119-4882-a469-e96127f38ff5', N'R5GA', N'r5ga', NULL, 0, CAST(N'2013-11-11 06:05:56.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'6c643baa-8a35-4a2c-a233-e523efa53807', N'ra9aa', N'ra9aa', NULL, 0, CAST(N'2012-09-26 03:11:09.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'30619efe-98d4-478d-a837-e2f410bbf8ad', N'ranboressio', N'ranboressio', NULL, 0, CAST(N'2012-11-07 06:33:18.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4a47bc64-c74f-4540-b82c-23a017ae6bf6', N'reirejacksa', N'reirejacksa', NULL, 0, CAST(N'2012-11-07 09:27:41.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'49a2871c-bd4e-4906-9a4e-7689006f53cf', N'RV1AW', N'rv1aw', NULL, 0, CAST(N'2012-09-28 18:45:45.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'282ae536-ace5-4d44-af41-080b41ca351e', N'SP2GEO', N'sp2geo', NULL, 0, CAST(N'2014-06-18 15:53:34.053' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'c3f84ed7-817c-4bc4-844c-1e94e8f4b5d2', N'SP5KP', N'sp5kp', NULL, 0, CAST(N'2013-12-26 09:49:23.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'e22134a8-8364-431e-8acf-0cfd35f06026', N'sp6fun', N'sp6fun', NULL, 0, CAST(N'2014-11-09 15:45:31.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'97ddd825-4673-4405-9b20-4f1a6ab21503', N'sp6oje', N'sp6oje', NULL, 0, CAST(N'2014-11-28 12:01:39.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'3cb7fc2e-c293-4b6d-b8c9-28abda041589', N'specdingconlea', N'specdingconlea', NULL, 0, CAST(N'2012-11-07 08:38:11.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'634d6b51-23b5-4d42-8c83-d54d822107dc', N'SV5DKL', N'sv5dkl', NULL, 0, CAST(N'2012-10-29 08:31:13.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a35fab2d-59bd-40d3-bea0-f09f983fbea0', N'TA1DX', N'ta1dx', NULL, 0, CAST(N'2012-10-20 21:53:42.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd3d069ca-f0ef-42d9-a738-4974e6792b52', N'TG9AJR', N'tg9ajr', NULL, 0, CAST(N'2014-08-01 15:30:18.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7c06c9de-812a-4ab9-8282-94a6086eba4f', N'trumousty', N'trumousty', NULL, 0, CAST(N'2013-07-23 12:59:30.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'7e5b1285-cf26-484d-9557-25eeee5fc232', N'US5LOC', N'us5loc', NULL, 0, CAST(N'2012-10-10 12:07:36.000' AS DateTime))
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'4713331c-80a2-4687-a237-ca1ee46d0701', N'VA7DXC', N'va7dxc', NULL, 0, CAST(N'2012-10-29 04:36:55.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'5ea9a9ef-3550-4262-b6d0-dfa67093c7ea', N've6jy', N've6jy', NULL, 0, CAST(N'2012-10-08 03:20:37.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'1812d673-2439-4955-bef3-bfbf4b052c62', N'VE7ZO', N've7zo', NULL, 0, CAST(N'2013-02-13 05:23:16.867' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'21158b39-484c-4108-bfcd-b3a809388ab2', N'vk9dx', N'vk9dx', NULL, 0, CAST(N'2014-11-29 10:33:34.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'c6f26e8a-4511-4fb6-a5a3-d5d4b850484e', N'Vlad', N'vlad', NULL, 0, CAST(N'2012-09-27 03:48:32.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'287acffb-ce0e-4861-ab80-749760e96ccc', N'vu3vbn', N'vu3vbn', NULL, 0, CAST(N'2012-10-10 04:13:01.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'986629a8-f1e9-4635-906a-b48264c5eda6', N'w5tm', N'w5tm', NULL, 0, CAST(N'2013-11-05 03:57:19.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'51fb1bb9-a125-45ec-b8ce-7b2af922d42d', N'w9gru', N'w9gru', NULL, 0, CAST(N'2014-11-14 19:01:00.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'220779fa-0e2a-49c2-954f-6f1abd622009', N'wb4omm', N'wb4omm', NULL, 0, CAST(N'2013-10-05 16:38:39.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'd35274dd-e439-473c-9e34-10ff8fe9106d', N'wb6ots', N'wb6ots', NULL, 0, CAST(N'2015-08-16 18:09:08.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'674629b2-2e6d-477d-91ad-ac6433fc0c3d', N'WP4DT', N'wp4dt', NULL, 0, CAST(N'2014-03-18 18:12:10.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'ccd3fa0e-69ee-40aa-9076-ac1c0b1cf6e9', N'xe1ct', N'xe1ct', NULL, 0, CAST(N'2014-07-14 02:46:19.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'b96b1f06-8e98-443c-a927-ae4d5385d01d', N'yc6jrt', N'yc6jrt', NULL, 0, CAST(N'2012-10-06 04:11:14.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'f55cdaa6-4391-46e8-b0f9-9c273341dd9a', N'YC8GRM', N'yc8grm', NULL, 0, CAST(N'2013-04-04 09:13:38.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'a2a48883-2734-4dc0-9315-cba0b1ffd65e', N'YL2QN', N'yl2qn', NULL, 0, CAST(N'2014-04-10 22:45:33.510' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'3cd8ea0c-f9d0-4c21-8bdf-189534e382e8', N'YU1PXA', N'yu1pxa', NULL, 0, CAST(N'2014-06-25 09:10:32.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'bb2c1fdb-c778-471a-a239-0ac5fb884917', N'YU2FG', N'yu2fg', NULL, 0, CAST(N'2012-10-08 11:13:18.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'44d8a84b-b671-4c5c-8986-20392021e9d1', N'YU6DX', N'yu6dx', NULL, 0, CAST(N'2014-08-06 21:24:44.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'ebf88e3f-bbfa-44b9-8114-008c7e43baa6', N'bb8896fd-1939-4858-b785-eca272aa5317', N'YY4DNN', N'yy4dnn', NULL, 0, CAST(N'2014-08-11 16:33:48.253' AS DateTime))
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'cn2r', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N've6jy', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'Hb9dur', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'ly2fn', NULL, NULL, NULL, N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>5</QBndID><QConID>2</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'YC8GRM', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>4</QBndID><QConID>0</QConID><QCouID>YB</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'K4WI', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>158</LogCalcZones><LogCalcCountries>560</LogCalcCountries><LogCalcScore>16797610</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>6</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'KI6SEJ', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>158</LogCalcZones><LogCalcCountries>560</LogCalcCountries><LogCalcScore>16797610</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'Vlad ', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>310</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>143</LogCalcZones><LogCalcCountries>464</LogCalcCountries><LogCalcScore>9886816</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>149</LogCalcZones><LogCalcCountries>589</LogCalcCountries><LogCalcScore>18942246</LogCalcScore><LogEntryClass>M2</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>4745</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'RV1AW', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>143</LogCalcZones><LogCalcCountries>464</LogCalcCountries><LogCalcScore>9886816</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>149</LogCalcZones><LogCalcCountries>589</LogCalcCountries><LogCalcScore>18942246</LogCalcScore><LogEntryClass>M2</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>177</LogCalcZones><LogCalcCountries>586</LogCalcCountries><LogCalcScore>12066082</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'w5tm', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'kb7wtm', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>158</LogCalcZones><LogCalcCountries>560</LogCalcCountries><LogCalcScore>16797610</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>310</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>VE2IM</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ve2im.mdb</LogDBName><LogCallID>7454</LogCallID><LogCtyID>284</LogCtyID><LogCalcZones>161</LogCalcZones><LogCalcCountries>553</LogCalcCountries><LogCalcScore>14943306</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>1</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'KE5RRN', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'YU6DX', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>YU5R</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>yu5r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>327</LogCtyID><LogCalcZones>178</LogCalcZones><LogCalcCountries>646</LogCalcCountries><LogCalcScore>10585104</LogCalcScore><LogEntryClass>M2</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>HG7T</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>hg7t.mdb</LogDBName><LogCallID>5598</LogCallID><LogCtyID>149</LogCtyID><LogCalcZones>199</LogCalcZones><LogCalcCountries>735</LogCalcCountries><LogCalcScore>15029928</LogCalcScore><LogEntryClass>M2</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>10</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'w9gru', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EI1Y</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EI7M</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ei7m.mdb</LogDBName><LogCallID>936</LogCallID><LogCtyID>106</LogCtyID><LogCalcZones>174</LogCalcZones><LogCalcCountries>654</LogCalcCountries><LogCalcScore>11000808</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>TM6M</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>6</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>tm6m.mdb</LogDBName><LogCallID>3654</LogCallID><LogCtyID>117</LogCtyID><LogCalcZones>39</LogCalcZones><LogCalcCountries>161</LogCalcCountries><LogCalcScore>1151600</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'sp6oje', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>SP6OJE</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>4</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>sp6oje.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>240</LogCtyID><LogCalcZones>33</LogCalcZones><LogCalcCountries>122</LogCalcCountries><LogCalcScore>269855</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', NULL, N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>10</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'n2tta', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>KP2MM</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>kp2mm.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>200</LogCtyID><LogCalcZones>102</LogCalcZones><LogCalcCountries>266</LogCalcCountries><LogCalcScore>3192768</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>kp2m.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>200</LogCtyID><LogCalcZones>155</LogCalcZones><LogCalcCountries>516</LogCalcCountries><LogCalcScore>15221635</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>UP2L</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>up2l.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>274</LogCtyID><LogCalcZones>153</LogCalcZones><LogCalcCountries>529</LogCalcCountries><LogCalcScore>12689292</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', NULL, N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'W7EJ', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>12</DDLVStartID><DDLVHoursID>5</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'K0AV', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>PZ5T</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>pz5t.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>231</LogCtyID><LogCalcZones>158</LogCalcZones><LogCalcCountries>522</LogCalcCountries><LogCalcScore>14006640</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>K1TO</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>k1to.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>157</LogCalcZones><LogCalcCountries>498</LogCalcCountries><LogCalcScore>7335345</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>P40F</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>p40f.mdb</LogDBName><LogCallID>20636</LogCallID><LogCtyID>221</LogCtyID><LogCalcZones>165</LogCalcZones><LogCalcCountries>513</LogCalcCountries><LogCalcScore>14482080</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'EA4KD', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EC2DX</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ec2dx.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>102</LogCtyID><LogCalcZones>174</LogCalcZones><LogCalcCountries>627</LogCalcCountries><LogCalcScore>8835831</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EB3CW</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>eb3cw.mdb</LogDBName><LogCallID>18230</LogCallID><LogCtyID>102</LogCtyID><LogCalcZones>158</LogCalcZones><LogCalcCountries>568</LogCalcCountries><LogCalcScore>7386324</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EA4KD</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ea4kd.mdb</LogDBName><LogCallID>806</LogCallID><LogCtyID>102</LogCtyID><LogCalcZones>144</LogCalcZones><LogCalcCountries>499</LogCalcCountries><LogCalcScore>5145286</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'VE7ZO', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>W3LPL</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>w3lpl.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>211</LogCalcZones><LogCalcCountries>861</LogCalcCountries><LogCalcScore>35288096</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>NR4M</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>nr4m.mdb</LogDBName><LogCallID>11202</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>198</LogCalcZones><LogCalcCountries>762</LogCalcCountries><LogCalcScore>24847680</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>NQ4I</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>nq4i.mdb</LogDBName><LogCallID>2641</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>207</LogCalcZones><LogCalcCountries>835</LogCalcCountries><LogCalcScore>27242048</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>7</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'dl8obf', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CR3L</Call><ContestInfo><startTime>2010-10-30T00:00:00</startTime><endTime>2010-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2010</ContestName><ContestID>CQWWSSB2010</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2010Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cr3l.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>87</LogCtyID><LogCalcZones>121</LogCalcZones><LogCalcCountries>418</LogCalcCountries><LogCalcScore>9386146</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'ok4pa', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CT1JLZ</Call><ContestInfo><startTime>2009-10-24T00:00:00</startTime><endTime>2009-10-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2009</ContestName><ContestID>CQWWSSB2009</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2009Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>5</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ct1jlz.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>780</LogCtyID><LogCalcZones>38</LogCalcZones><LogCalcCountries>146</LogCalcCountries><LogCalcScore>1138408</LogCalcScore><LogEntryClass>SOSB 14</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>F1AKK</Call><ContestInfo><startTime>2010-10-30T00:00:00</startTime><endTime>2010-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2010</ContestName><ContestID>CQWWSSB2010</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2010Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>5</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>f1akk.mdb</LogDBName><LogCallID>13761</LogCallID><LogCtyID>117</LogCtyID><LogCalcZones>40</LogCalcZones><LogCalcCountries>143</LogCalcCountries><LogCalcScore>1686528</LogCalcScore><LogEntryClass>SOSB 14</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>TM9R</Call><ContestInfo><startTime>2009-10-24T00:00:00</startTime><endTime>2009-10-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2009</ContestName><ContestID>CQWWSSB2009</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2009Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>5</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>tm9r.mdb</LogDBName><LogCallID>3656</LogCallID><LogCtyID>811</LogCtyID><LogCalcZones>37</LogCalcZones><LogCalcCountries>142</LogCalcCountries><LogCalcScore>1468516</LogCalcScore><LogEntryClass>SOSB 14</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>5</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>1</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'9a5adt', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>9a8m</Call><ContestInfo><startTime>2009-10-24T00:00:00</startTime><endTime>2009-10-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2009</ContestName><ContestID>CQWWSSB2009</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2009Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>5</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>9a8m.mdb</LogDBName><LogCallID>79</LogCallID><LogCtyID>741</LogCtyID><LogCalcZones>36</LogCalcZones><LogCalcCountries>109</LogCalcCountries><LogCalcScore>511415</LogCalcScore><LogEntryClass>SOSB 14</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>9a8m</Call><ContestInfo><startTime>2010-10-30T00:00:00</startTime><endTime>2010-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2010</ContestName><ContestID>CQWWSSB2010</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2010Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore><LogEntryClass>SOSB 14</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>9a8m</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>9a8m.mdb</LogDBName><LogCallID>79</LogCallID><LogCtyID>47</LogCtyID><LogCalcZones>167</LogCalcZones><LogCalcCountries>615</LogCalcCountries><LogCalcScore>10165218</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'K1DG', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>k1dg</Call><ContestInfo><startTime>2006-11-25T00:00:00</startTime><endTime>2006-11-26T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-CW</ContestType><ContestName>Cqww Cw 2006</ContestName><ContestID>CQWWCW2006</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2006Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>1</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>NN1N</Call><ContestInfo><startTime>2006-11-25T00:00:00</startTime><endTime>2006-11-26T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-CW</ContestType><ContestName>Cqww Cw 2006</ContestName><ContestID>CQWWCW2006</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2006Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>K5ZD</Call><ContestInfo><startTime>2006-11-25T00:00:00</startTime><endTime>2006-11-26T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-CW</ContestType><ContestName>Cqww Cw 2006</ContestName><ContestID>CQWWCW2006</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2006Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'vu3vbn', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>3</CatBndID><CatTxID>0</CatTxID><CategoryCBID>true</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>3</CatBndID><CatTxID>0</CatTxID><CategoryCBID>true</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>3</CatBndID><CatTxID>0</CatTxID><CategoryCBID>true</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>4</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'TA1DX', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'F6ECB', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>2</CatPwrID><CatAstID>2</CatAstID><CatBndID>4</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>2</CatPwrID><CatAstID>2</CatAstID><CatBndID>4</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>2</CatPwrID><CatAstID>2</CatAstID><CatBndID>4</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'K8IA', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>N7AT</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>n7at.mdb</LogDBName><LogCallID>2</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>169</LogCalcZones><LogCalcCountries>490</LogCalcCountries><LogCalcScore>4679559</LogCalcScore><LogEntryClass>M2</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>N7AT</Call><ContestInfo><startTime>2010-10-30T00:00:00</startTime><endTime>2010-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2010</ContestName><ContestID>CQWWSSB2010</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2010Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>n7at.mdb</LogDBName><LogCallID>6445</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>145</LogCalcZones><LogCalcCountries>386</LogCalcCountries><LogCalcScore>2594997</LogCalcScore><LogEntryClass>M2</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>N7AT</Call><ContestInfo><startTime>2009-10-24T00:00:00</startTime><endTime>2009-10-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2009</ContestName><ContestID>CQWWSSB2009</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2009Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>n7at.mdb</LogDBName><LogCallID>6445</LogCallID><LogCtyID>878</LogCtyID><LogCalcZones>127</LogCalcZones><LogCalcCountries>330</LogCalcCountries><LogCalcScore>1753509</LogCalcScore><LogEntryClass>M2</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>7</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'om3rm', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>OM8A</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>om8a.mdb</LogDBName><LogCallID>2</LogCallID><LogCtyID>215</LogCtyID><LogCalcZones>215</LogCalcZones><LogCalcCountries>835</LogCalcCountries><LogCalcScore>16711800</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>1</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>TM6M</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>tm6m.mdb</LogDBName><LogCallID>2</LogCallID><LogCtyID>117</LogCtyID><LogCalcZones>202</LogCalcZones><LogCalcCountries>815</LogCalcCountries><LogCalcScore>17375445</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>1</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>9A7A</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>9a7a.mdb</LogDBName><LogCallID>76</LogCallID><LogCtyID>47</LogCtyID><LogCalcZones>198</LogCalcZones><LogCalcCountries>775</LogCalcCountries><LogCalcScore>13306748</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>1</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'k4xs', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'ranboressio', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>LEIBALLTINGFITRI</Call><ContestInfo><startTime>2006-11-25T00:00:00</startTime><endTime>2006-11-26T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-CW</ContestType><ContestName>Cqww Cw 2006</ContestName><ContestID>CQWWCW2006</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2006Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>6</CatBndID><CatTxID>1</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>LEIBALLTINGFITRI</Call><ContestInfo><startTime>2010-10-30T00:00:00</startTime><endTime>2010-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2010</ContestName><ContestID>CQWWSSB2010</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2010Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>6</CatBndID><CatTxID>1</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>LEIBALLTINGFITRI</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>6</CatBndID><CatTxID>1</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>4</QBndID><QConID>2</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>5</ChartFuncDDLID><IntervalDDLID>1</IntervalDDLID><ViewDDLID>3</ViewDDLID><DDLVStartID>1</DDLVStartID><DDLVHoursID>1</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'cliccatttorke', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>XMENENMOITABHO</Call><ContestInfo><startTime>2004-10-30T00:00:00</startTime><endTime>2004-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2004</ContestName><ContestID>CQWWSSB2004</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2004Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>2</CatAstID><CatBndID>3</CatBndID><CatTxID>3</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>XMENENMOITABHO</Call><ContestInfo><startTime>2007-11-24T00:00:00</startTime><endTime>2007-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-CW</ContestType><ContestName>Cqww Cw 2007</ContestName><ContestID>CQWWCW2007</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2007Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>2</CatAstID><CatBndID>3</CatBndID><CatTxID>3</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>XMENENMOITABHO</Call><ContestInfo><startTime>2008-11-29T00:00:00</startTime><endTime>2008-11-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-CW</ContestType><ContestName>Cqww Cw 2008</ContestName><ContestID>CQWWCW2008</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2008Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>2</CatAstID><CatBndID>3</CatBndID><CatTxID>3</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>7</QBndID><QConID>5</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>6</ChartFuncDDLID><IntervalDDLID>1</IntervalDDLID><ViewDDLID>3</ViewDDLID><DDLVStartID>1</DDLVStartID><DDLVHoursID>7</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'LU1QS', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>310</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>5</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'ik7imo', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>IQ7AF</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>6</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>iq7af.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>166</LogCtyID><LogCalcZones>36</LogCalcZones><LogCalcCountries>116</LogCalcCountries><LogCalcScore>266912</LogCalcScore><LogEntryClass>SOSB 21</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>5</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>6</QBndID><QConID>2</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'EC4DX', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>ED1R</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>ed1r.mdb</LogDBName><LogCallID>14927</LogCallID><LogCtyID>102</LogCtyID><LogCalcZones>199</LogCalcZones><LogCalcCountries>760</LogCalcCountries><LogCalcScore>19648951</LogCalcScore><LogEntryClass>M2</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>IR4X</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>ir4x.mdb</LogDBName><LogCallID>1367</LogCallID><LogCtyID>166</LogCtyID><LogCalcZones>210</LogCalcZones><LogCalcCountries>836</LogCalcCountries><LogCalcScore>20559130</LogCalcScore><LogEntryClass>M2</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'Alan_K0AV', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>TI5A</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>3</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ti5a.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>260</LogCtyID><LogCalcZones>115</LogCalcZones><LogCalcCountries>346</LogCalcCountries><LogCalcScore>3451507</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>3</CatPwrID><CatAstID>2</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>PZ5T</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>pz5t.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>231</LogCtyID><LogCalcZones>158</LogCalcZones><LogCalcCountries>522</LogCalcCountries><LogCalcScore>14006640</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>3</CatPwrID><CatAstID>2</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>TI5A</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ti5a.mdb</LogDBName><LogCallID>11809</LogCallID><LogCtyID>260</LogCtyID><LogCalcZones>133</LogCalcZones><LogCalcCountries>414</LogCalcCountries><LogCalcScore>6523522</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>3</CatPwrID><CatAstID>2</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'm0ddt', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'OL7T', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>OL7T</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ol7t.mdb</LogDBName><LogCallID>2</LogCallID><LogCtyID>214</LogCtyID><LogCalcZones>155</LogCalcZones><LogCalcCountries>549</LogCalcCountries><LogCalcScore>5428544</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>OK7O</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ok7o.mdb</LogDBName><LogCallID>15697</LogCallID><LogCtyID>214</LogCtyID><LogCalcZones>131</LogCalcZones><LogCalcCountries>440</LogCalcCountries><LogCalcScore>4676490</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>OK5W</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ok5w.mdb</LogDBName><LogCallID>2766</LogCallID><LogCtyID>214</LogCtyID><LogCalcZones>191</LogCalcZones><LogCalcCountries>752</LogCalcCountries><LogCalcScore>13238777</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'DH7KU', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>310</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>143</LogCalcZones><LogCalcCountries>464</LogCalcCountries><LogCalcScore>9886816</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2010-11-27T00:00:00</startTime><endTime>2010-11-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2010</ContestName><ContestID>CQWWCW2010</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2010Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>14937</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>18</LogCalcZones><LogCalcCountries>54</LogCalcCountries><LogCalcScore>81504</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2009-11-28T00:00:00</startTime><endTime>2009-11-29T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-CW</ContestType><ContestName>Cqww Cw 2009</ContestName><ContestID>CQWWCW2009</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2009Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>4745</LogCallID><LogCtyID>1061</LogCtyID><LogCalcZones>173</LogCalcZones><LogCalcCountries>558</LogCalcCountries><LogCalcScore>8444512</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'CN8KD', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>5C5W</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>7</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>5c5w.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>37</LogCalcZones><LogCalcCountries>98</LogCalcCountries><LogCalcScore>781650</LogCalcScore><LogEntryClass>SOSB 28</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>2</CatPwrID><CatAstID>2</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>F5CQ</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>2</CatPwrID><CatAstID>2</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>1</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>2</CatPwrID><CatAstID>2</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>7</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'lu7fts', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>lo7h.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>204</LogCtyID><LogCalcZones>111</LogCalcZones><LogCalcCountries>267</LogCalcCountries><LogCalcScore>2533356</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ls1d.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>204</LogCtyID><LogCalcZones>140</LogCalcZones><LogCalcCountries>440</LogCalcCountries><LogCalcScore>7567840</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>lp1h.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>204</LogCtyID><LogCalcZones>163</LogCalcZones><LogCalcCountries>530</LogCalcCountries><LogCalcScore>20537748</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'YY4DNN', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>YY4DNN</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>14937</LogCallID><LogCtyID>105</LogCtyID><LogCalcZones>116</LogCalcZones><LogCalcCountries>368</LogCalcCountries><LogCalcScore>6756640</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>6</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'K9CHP', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>K9CHP</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>k9chp.mdb</LogDBName><LogCallID>6045</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>36</LogCalcZones><LogCalcCountries>73</LogCalcCountries><LogCalcScore>36733</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>K9CHP</Call><ContestInfo><startTime>2010-10-30T00:00:00</startTime><endTime>2010-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2010</ContestName><ContestID>CQWWSSB2010</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2010Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>k9chp.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>26</LogCalcZones><LogCalcCountries>46</LogCalcCountries><LogCalcScore>13752</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>K9CHP</Call><ContestInfo><startTime>2009-10-24T00:00:00</startTime><endTime>2009-10-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2009</ContestName><ContestID>CQWWSSB2009</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2009Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>k9chp.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>878</LogCtyID><LogCalcZones>39</LogCalcZones><LogCalcCountries>106</LogCalcCountries><LogCalcScore>88305</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'OM0MW', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'VA7DXC', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>VE7NSR</Call><ContestInfo><startTime>2009-10-24T00:00:00</startTime><endTime>2009-10-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2009</ContestName><ContestID>CQWWSSB2009</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2009Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ve7nsr.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>975</LogCtyID><LogCalcZones>45</LogCalcZones><LogCalcCountries>57</LogCalcCountries><LogCalcScore>54366</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'lu9da', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'ok1xoe', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>310</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>UT5UUV</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>3</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ut5uuv.mdb</LogDBName><LogCallID>3881</LogCallID><LogCtyID>276</LogCtyID><LogCalcZones>48</LogCalcZones><LogCalcCountries>180</LogCalcCountries><LogCalcScore>165984</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'PY5EG', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>PT5T</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>pt5t.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>227</LogCtyID><LogCalcZones>173</LogCalcZones><LogCalcCountries>565</LogCalcCountries><LogCalcScore>14925312</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>true</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>ZX5J</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>7</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>zx5j.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>227</LogCtyID><LogCalcZones>39</LogCalcZones><LogCalcCountries>160</LogCalcCountries><LogCalcScore>3084301</LogCalcScore><LogEntryClass>SOSB 28</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>true</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>true</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'dl5ant', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>DR1A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>dr1a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>95</LogCtyID><LogCalcZones>197</LogCalcZones><LogCalcCountries>826</LogCalcCountries><LogCalcScore>35418306</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>DF0HQ</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>df0hq.mdb</LogDBName><LogCallID>384</LogCallID><LogCtyID>95</LogCtyID><LogCalcZones>198</LogCalcZones><LogCalcCountries>768</LogCalcCountries><LogCalcScore>20818266</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>OT5A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>ot5a.mdb</LogDBName><LogCallID>2834</LogCallID><LogCtyID>216</LogCtyID><LogCalcZones>184</LogCalcZones><LogCalcCountries>715</LogCalcCountries><LogCalcScore>22601759</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>2</QBndID><QConID>3</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>9</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>2</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'specdingconlea', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>REITRIFOVTICOM</Call><ContestInfo><startTime>2004-10-30T00:00:00</startTime><endTime>2004-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2004</ContestName><ContestID>CQWWSSB2004</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2004Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>3</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>6</CatBndID><CatTxID>1</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>REITRIFOVTICOM</Call><ContestInfo><startTime>2009-11-28T00:00:00</startTime><endTime>2009-11-29T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-CW</ContestType><ContestName>Cqww Cw 2009</ContestName><ContestID>CQWWCW2009</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2009Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>3</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>6</CatBndID><CatTxID>1</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>REITRIFOVTICOM</Call><ContestInfo><startTime>2009-11-28T00:00:00</startTime><endTime>2009-11-29T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-CW</ContestType><ContestName>Cqww Cw 2009</ContestName><ContestID>CQWWCW2009</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2009Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>3</CatOprID><CatPwrID>1</CatPwrID><CatAstID>1</CatAstID><CatBndID>6</CatBndID><CatTxID>1</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>3</QBndID><QConID>2</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>6</ChartFuncDDLID><IntervalDDLID>4</IntervalDDLID><ViewDDLID>5</ViewDDLID><DDLVStartID>1</DDLVStartID><DDLVHoursID>8</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'LB1GB', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>LN8W</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ln8w.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>203</LogCtyID><LogCalcZones>129</LogCalcZones><LogCalcCountries>432</LogCalcCountries><LogCalcScore>4530636</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>ED8A</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ed8a.mdb</LogDBName><LogCallID>13755</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>97</LogCalcZones><LogCalcCountries>289</LogCalcCountries><LogCalcScore>5470778</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>LN3Z</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ln3z.mdb</LogDBName><LogCallID>2223</LogCallID><LogCtyID>203</LogCtyID><LogCalcZones>190</LogCalcZones><LogCalcCountries>716</LogCalcCountries><LogCalcScore>9915264</LogCalcScore><LogEntryClass>MS</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>5</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'ke2wy', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>KE2WY</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>W2BC</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>W2XL</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>w2xl.mdb</LogDBName><LogCallID>4190</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>135</LogCalcZones><LogCalcCountries>409</LogCalcCountries><LogCalcScore>3657856</LogCalcScore><LogEntryClass>M2</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>7</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>18</DDLVStartID><DDLVHoursID>5</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'PE3V', NULL, NULL, NULL, NULL, N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>3</ChartFuncDDLID><IntervalDDLID>3</IntervalDDLID><ViewDDLID>3</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'ly2w', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>LY2W</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>ly2w.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>206</LogCtyID><LogCalcZones>192</LogCalcZones><LogCalcCountries>703</LogCalcCountries><LogCalcScore>11814000</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>TM6M</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>6</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>tm6m.mdb</LogDBName><LogCallID>3654</LogCallID><LogCtyID>117</LogCtyID><LogCalcZones>39</LogCalcZones><LogCalcCountries>161</LogCalcCountries><LogCalcScore>1151600</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>LY7A</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>ly7a.mdb</LogDBName><LogCallID>2303</LogCallID><LogCtyID>206</LogCtyID><LogCalcZones>180</LogCalcZones><LogCalcCountries>689</LogCalcCountries><LogCalcScore>11948750</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>11</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>3</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'lz2sx', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>LZ0M</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>3</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>lz0m.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>207</LogCtyID><LogCalcZones>105</LogCalcZones><LogCalcCountries>313</LogCalcCountries><LogCalcScore>1060466</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>E77TA</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>3</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>e77ta.mdb</LogDBName><LogCallID>20189</LogCallID><LogCtyID>101</LogCtyID><LogCalcZones>85</LogCalcZones><LogCalcCountries>254</LogCalcCountries><LogCalcScore>523077</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>YU0W</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>3</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>yu0w.mdb</LogDBName><LogCallID>17722</LogCallID><LogCtyID>327</LogCtyID><LogCalcZones>96</LogCalcZones><LogCalcCountries>278</LogCalcCountries><LogCalcScore>994092</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'PY2SEX', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>PY2SEX</Call><ContestInfo><startTime>2010-10-30T00:00:00</startTime><endTime>2010-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2010</ContestName><ContestID>CQWWSSB2010</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2010Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>py2sex.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>227</LogCtyID><LogCalcZones>126</LogCalcZones><LogCalcCountries>307</LogCalcCountries><LogCalcScore>2638269</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>8P5A</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>8p5a.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>44</LogCtyID><LogCalcZones>156</LogCalcZones><LogCalcCountries>519</LogCalcCountries><LogCalcScore>16745400</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>UP2L</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>up2l.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>274</LogCtyID><LogCalcZones>153</LogCalcZones><LogCalcCountries>529</LogCalcCountries><LogCalcScore>12689292</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'LU1AEE', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>LS1D</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>LP1H</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>lp1h.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>204</LogCtyID><LogCalcZones>151</LogCalcZones><LogCalcCountries>486</LogCalcCountries><LogCalcScore>12996711</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>LT1F</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>lt1f.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>204</LogCtyID><LogCalcZones>138</LogCalcZones><LogCalcCountries>390</LogCalcCountries><LogCalcScore>9098496</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>3</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>1</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'5B4AFM', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2004-10-30T00:00:00</startTime><endTime>2004-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2004</ContestName><ContestID>CQWWSSB2004</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2004Contest.mdb</DBName></ContestInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>0</CatAstID><CatBndID>4</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EY8MM</Call><ContestInfo><startTime>2004-10-30T00:00:00</startTime><endTime>2004-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2004</ContestName><ContestID>CQWWSSB2004</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2004Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>0</CatAstID><CatBndID>4</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>C40M</Call><ContestInfo><startTime>2004-10-30T00:00:00</startTime><endTime>2004-10-31T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2004</ContestName><ContestID>CQWWSSB2004</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2004Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>0</CatAstID><CatBndID>4</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>5</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'K3WW', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>K3WW</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>k3ww.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>163</LogCalcZones><LogCalcCountries>548</LogCalcCountries><LogCalcScore>7904898</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>NN3W</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>nn3w.mdb</LogDBName><LogCallID>2632</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>129</LogCalcZones><LogCalcCountries>389</LogCalcCountries><LogCalcScore>3491320</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>K5ZD</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>k5zd.mdb</LogDBName><LogCallID>1910</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>138</LogCalcZones><LogCalcCountries>443</LogCalcCountries><LogCalcScore>5653130</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'pa3s', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>ON4IA</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>on4ia.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>216</LogCtyID><LogCalcZones>154</LogCalcZones><LogCalcCountries>505</LogCalcCountries><LogCalcScore>5511876</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EA1FDI</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ea1fdi.mdb</LogDBName><LogCallID>749</LogCallID><LogCtyID>103</LogCtyID><LogCalcZones>116</LogCalcZones><LogCalcCountries>376</LogCalcCountries><LogCalcScore>4185444</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>PI4CG</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>pi4cg.mdb</LogDBName><LogCallID>6735</LogCallID><LogCtyID>223</LogCtyID><LogCalcZones>140</LogCalcZones><LogCalcCountries>425</LogCalcCountries><LogCalcScore>4328465</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>7</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>2</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>19</DDLVStartID><DDLVHoursID>4</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'JG1VGX', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>JM1LPN</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>jm1lpn.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>176</LogCtyID><LogCalcZones>147</LogCalcZones><LogCalcCountries>430</LogCalcCountries><LogCalcScore>4494830</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>JH4UYB</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>jh4uyb.mdb</LogDBName><LogCallID>1649</LogCallID><LogCtyID>176</LogCtyID><LogCalcZones>139</LogCalcZones><LogCalcCountries>353</LogCalcCountries><LogCalcScore>6349752</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>JS3CTQ</Call><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>js3ctq.mdb</LogDBName><LogCallID>1722</LogCallID><LogCtyID>176</LogCtyID><LogCalcZones>153</LogCalcZones><LogCalcCountries>419</LogCalcCountries><LogCalcScore>5429424</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'wb4omm', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>WB4OMM</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>wb4omm.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>65</LogCalcZones><LogCalcCountries>148</LogCalcCountries><LogCalcScore>142923</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'ea5fq', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EA1WX</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ea1wx.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>102</LogCtyID><LogCalcZones>71</LogCalcZones><LogCalcCountries>170</LogCalcCountries><LogCalcScore>264859</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>true</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>5</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'9a3w', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'WP4DT', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2012-10-27T00:00:00</startTime><endTime>2012-10-28T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2012</ContestName><ContestID>CQWWSSB2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2012Contest.mdb</DBName></ContestInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>2</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>2</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>2</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>KP4</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'SP2GEO', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>3</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>3</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>3</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'sp6fun', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatOprID>1</CatOprID><CatPwrID>3</CatPwrID><CatAstID>0</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>3</CatPwrID><CatAstID>0</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>3</CatPwrID><CatAstID>0</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>7</QBndID><QConID>1</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'iu3cib', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'N4BP', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>0</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'R5GA', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>PZ5T</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>pz5t.mdb</LogDBName><LogCallID>17244</LogCallID><LogCtyID>231</LogCtyID><LogCalcZones>158</LogCalcZones><LogCalcCountries>522</LogCalcCountries><LogCalcScore>14006640</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>P40F</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>p40f.mdb</LogDBName><LogCallID>20636</LogCallID><LogCtyID>221</LogCtyID><LogCalcZones>165</LogCalcZones><LogCalcCountries>513</LogCalcCountries><LogCalcScore>14482080</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>P40W</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>p40w.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>221</LogCtyID><LogCalcZones>143</LogCalcZones><LogCalcCountries>460</LogCalcCountries><LogCalcScore>11736189</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', NULL, N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>3</ChartFuncDDLID><IntervalDDLID>5</IntervalDDLID><ViewDDLID>3</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'ra9aa', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>rl3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>271</LogCtyID><LogCalcZones>210</LogCalcZones><LogCalcCountries>820</LogCalcCountries><LogCalcScore>14817580</LogCalcScore></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>149</LogCalcZones><LogCalcCountries>589</LogCalcCountries><LogCalcScore>18942246</LogCalcScore></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ra9a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>273</LogCtyID><LogCalcZones>104</LogCalcZones><LogCalcCountries>330</LogCalcCountries><LogCalcScore>2661722</LogCalcScore></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'SP5KP', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'KY4F', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>NQ4I</Call><ContestInfo><startTime>2009-11-28T00:00:00</startTime><endTime>2009-11-29T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-CW</ContestType><ContestName>Cqww Cw 2009</ContestName><ContestID>CQWWCW2009</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2009Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>nq4i.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>1225</LogCtyID><LogCalcZones>172</LogCalcZones><LogCalcCountries>655</LogCalcCountries><LogCalcScore>14365817</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', NULL, NULL, N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>5</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'NQ4I', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>nq4i</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>nq4i.mdb</LogDBName><LogCallID>2</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>207</LogCalcZones><LogCalcCountries>835</LogCalcCountries><LogCalcScore>27242048</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>3</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>w3lpl</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>w3lpl.mdb</LogDBName><LogCallID>2</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>211</LogCalcZones><LogCalcCountries>861</LogCalcCountries><LogCalcScore>35288096</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>3</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>k3lr</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>k3lr.mdb</LogDBName><LogCallID>2</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>209</LogCalcZones><LogCalcCountries>848</LogCalcCountries><LogCalcScore>35686434</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>3</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>7</QBndID><QConID>3</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'KB7Q', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CR3L</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>cr3l.mdb</LogDBName><LogCallID>2</LogCallID><LogCtyID>87</LogCtyID><LogCalcZones>194</LogCalcZones><LogCalcCountries>774</LogCalcCountries><LogCalcScore>39275632</LogCalcScore><LogEntryClass>M2</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>2</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>3</LogCatTxID><LogDBName>c5a.mdb</LogDBName><LogCallID>2</LogCallID><LogCtyID>75</LogCtyID><LogCalcZones>209</LogCalcZones><LogCalcCountries>804</LogCalcCountries><LogCalcScore>59261513</LogCalcScore><LogEntryClass>MM</LogEntryClass></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>2</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>2</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>2</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>2</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>9</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>3</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'US5LOC', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>1</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>1</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>0</LogCatOprID><LogCatPwrID>0</LogCatPwrID><LogCatAstID>0</LogCatAstID><LogCatBndID>0</LogCatBndID><LogCatTxID>0</LogCatTxID><LogCallID>1</LogCallID><LogCtyID>0</LogCtyID><LogCalcZones>0</LogCalcZones><LogCalcCountries>0</LogCalcCountries><LogCalcScore>0</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID /><QZoneID>0</QZoneID><QsoCB>true</QsoCB></QSOLogFilter>', NULL, NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'KT4TX', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>N9RV</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>6</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>n9rv.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>37</LogCalcZones><LogCalcCountries>138</LogCalcCountries><LogCalcScore>1087275</LogCalcScore></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>2</CatAstID><CatBndID>5</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>WA3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>6</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>wa3a.mdb</LogDBName><LogCallID>19833</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>37</LogCalcZones><LogCalcCountries>133</LogCalcCountries><LogCalcScore>868020</LogCalcScore><LogEntryClass>SOSB 21</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>2</CatAstID><CatBndID>5</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>WA7LT</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>6</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>wa7lt.mdb</LogDBName><LogCallID>7708</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>33</LogCalcZones><LogCalcCountries>107</LogCalcCountries><LogCalcScore>358960</LogCalcScore><LogEntryClass>SOSB 21</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>1</CatPwrID><CatAstID>2</CatAstID><CatBndID>5</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>6</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>1</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'ea2cw', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EA2BNU</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ea2bnu.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>102</LogCtyID><LogCalcZones>70</LogCalcZones><LogCalcCountries>248</LogCalcCountries><LogCalcScore>713274</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EA2BNU</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ea2bnu.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>102</LogCtyID><LogCalcZones>80</LogCalcZones><LogCalcCountries>280</LogCalcCountries><LogCalcScore>819000</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>1</IntervalDDLID><ViewDDLID>2</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'nv4b', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>NV4B</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>nv4b.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>98</LogCalcZones><LogCalcCountries>281</LogCalcCountries><LogCalcScore>855782</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>AD4Z</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ad4z.mdb</LogDBName><LogCallID>17835</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>128</LogCalcZones><LogCalcCountries>371</LogCalcCountries><LogCalcScore>2182626</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>K7SV</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>k7sv.mdb</LogDBName><LogCallID>6025</LogCallID><LogCtyID>184</LogCtyID><LogCalcZones>123</LogCalcZones><LogCalcCountries>352</LogCalcCountries><LogCalcScore>1130025</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'ag4w', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>CN2R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>cn2r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>84</LogCtyID><LogCalcZones>168</LogCalcZones><LogCalcCountries>603</LogCalcCountries><LogCalcScore>19627347</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>1</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'YU2FG', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>YU2FG</Call><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>2</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>7</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>yu2fg.mdb</LogDBName><LogCallID>1</LogCallID><LogCtyID>327</LogCtyID><LogCalcZones>39</LogCalcZones><LogCalcCountries>151</LogCalcCountries><LogCalcScore>555180</LogCalcScore><LogEntryClass>SOSB 28</LogEntryClass></CatLogInfo><CatOprID>1</CatOprID><CatPwrID>2</CatPwrID><CatAstID>0</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatOprID>1</CatOprID><CatPwrID>2</CatPwrID><CatAstID>0</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call /><ContestInfo><startTime>2011-11-26T00:00:00</startTime><endTime>2011-11-27T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2011</ContestName><ContestID>CQWWCW2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2011Contest.mdb</DBName></ContestInfo><CatOprID>1</CatOprID><CatPwrID>2</CatPwrID><CatAstID>0</CatAstID><CatBndID>6</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>7</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'vk9dx', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EI7M</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ei7m.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>106</LogCtyID><LogCalcZones>174</LogCalcZones><LogCalcCountries>654</LogCalcCountries><LogCalcScore>11000808</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', NULL, N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>0</DDLVStartID><DDLVHoursID>0</DDLVHoursID></ContestViewFilter>', NULL)
INSERT [dbo].[Session] ([UserIdentity], [ContestLogInfo1], [ContestLogInfo2], [ContestLogInfo3], [QSOLogFilter], [ContestViewFilter], [SubscriptionCredit]) VALUES (N'PT2CM', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>PT2CM</Call><ContestInfo><startTime>2012-11-24T00:00:00</startTime><endTime>2012-11-25T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CW-WW-CW</ContestType><ContestName>Cqww Cw 2012</ContestName><ContestID>CQWWCW2012</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwCw2012Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>2</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>1</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>2</LogCatTxID><LogDBName>pt2cm.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>227</LogCtyID><LogCalcZones>152</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>12548696</LogCalcScore></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>4O3A</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>4o3a.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>20</LogCtyID><LogCalcZones>187</LogCalcZones><LogCalcCountries>665</LogCalcCountries><LogCalcScore>15394788</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>true</CBCall></ContestLogInfo>', N'<QSOLogFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><QBndID>7</QBndID><QConID>0</QConID><QCouID>0</QCouID><QZoneID>0</QZoneID><QsoCB>false</QsoCB></QSOLogFilter>', N'<ContestViewFilter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ChartFuncDDLID>0</ChartFuncDDLID><IntervalDDLID>0</IntervalDDLID><ViewDDLID>0</ViewDDLID><DDLVStartID>2</DDLVStartID><DDLVHoursID>8</DDLVHoursID></ContestViewFilter>', NULL)
/****** Object:  Index [PK__aspnet_Applicati__1273C1CD]    Script Date: 8/29/2015 2:04:04 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_Applicati__1367E606]    Script Date: 8/29/2015 2:04:04 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_Applicati__145C0A3F]    Script Date: 8/29/2015 2:04:04 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_Membershi__276EDEB3]    Script Date: 8/29/2015 2:04:04 PM ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_Paths__59063A47]    Script Date: 8/29/2015 2:04:04 PM ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_Personali__619B8048]    Script Date: 8/29/2015 2:04:04 PM ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_ncindex2]    Script Date: 8/29/2015 2:04:04 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_Roles__45F365D3]    Script Date: 8/29/2015 2:04:04 PM ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_Users__173876EA]    Script Date: 8/29/2015 2:04:04 PM ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_Users_Index2]    Script Date: 8/29/2015 2:04:04 PM ******/
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_UsersInRoles_index]    Script Date: 8/29/2015 2:04:04 PM ******/
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 8/29/2015 2:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
USE [master]
GO
ALTER DATABASE [logqso] SET  READ_WRITE 
GO
