USE [ProjectBuilderData]
GO
ALTER TABLE [dbo].[Properties] DROP CONSTRAINT [FK_NodeProperty]
GO
ALTER TABLE [dbo].[ProjectNodes] DROP CONSTRAINT [FK_ProjectProjectNode]
GO
ALTER TABLE [dbo].[ProjectNodes] DROP CONSTRAINT [FK_ProjectNodeParentChildren]
GO
ALTER TABLE [dbo].[ProjectNodes] DROP CONSTRAINT [FK_NodeProjectNode]
GO
ALTER TABLE [dbo].[ProjectNodeProperties] DROP CONSTRAINT [FK_PropertyProjectNodeProperty]
GO
ALTER TABLE [dbo].[ProjectNodeProperties] DROP CONSTRAINT [FK_ProjectNodeProjectNodeProperty]
GO
ALTER TABLE [dbo].[Nodes] DROP CONSTRAINT [FK_ParentChildren]
GO
/****** Object:  Index [IX_FK_NodeProperty]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP INDEX [IX_FK_NodeProperty] ON [dbo].[Properties]
GO
/****** Object:  Index [IX_FK_ProjectProjectNode]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP INDEX [IX_FK_ProjectProjectNode] ON [dbo].[ProjectNodes]
GO
/****** Object:  Index [IX_FK_ProjectNodeParentChildren]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP INDEX [IX_FK_ProjectNodeParentChildren] ON [dbo].[ProjectNodes]
GO
/****** Object:  Index [IX_FK_NodeProjectNode]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP INDEX [IX_FK_NodeProjectNode] ON [dbo].[ProjectNodes]
GO
/****** Object:  Index [IX_FK_PropertyProjectNodeProperty]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP INDEX [IX_FK_PropertyProjectNodeProperty] ON [dbo].[ProjectNodeProperties]
GO
/****** Object:  Index [IX_FK_ProjectNodeProjectNodeProperty]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP INDEX [IX_FK_ProjectNodeProjectNodeProperty] ON [dbo].[ProjectNodeProperties]
GO
/****** Object:  Index [IX_FK_ParentChildren]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP INDEX [IX_FK_ParentChildren] ON [dbo].[Nodes]
GO
/****** Object:  Table [dbo].[Properties]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP TABLE [dbo].[Properties]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP TABLE [dbo].[Projects]
GO
/****** Object:  Table [dbo].[ProjectNodes]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP TABLE [dbo].[ProjectNodes]
GO
/****** Object:  Table [dbo].[ProjectNodeProperties]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP TABLE [dbo].[ProjectNodeProperties]
GO
/****** Object:  Table [dbo].[Nodes]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP TABLE [dbo].[Nodes]
GO
USE [master]
GO
/****** Object:  Database [ProjectBuilderData]    Script Date: 12/30/2012 5:46:57 PM ******/
DROP DATABASE [ProjectBuilderData]
GO
/****** Object:  Database [ProjectBuilderData]    Script Date: 12/30/2012 5:46:57 PM ******/
CREATE DATABASE [ProjectBuilderData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectBuilderData', FILENAME = N'C:\Users\Andrew\ProjectBuilderData.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProjectBuilderData_log', FILENAME = N'C:\Users\Andrew\ProjectBuilderData_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProjectBuilderData] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectBuilderData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectBuilderData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectBuilderData] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectBuilderData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectBuilderData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectBuilderData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectBuilderData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectBuilderData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectBuilderData] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectBuilderData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectBuilderData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectBuilderData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectBuilderData] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ProjectBuilderData]
GO
/****** Object:  Table [dbo].[Nodes]    Script Date: 12/30/2012 5:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Parent_Id] [int] NULL,
 CONSTRAINT [PK_Nodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectNodeProperties]    Script Date: 12/30/2012 5:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectNodeProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Property_Id] [int] NOT NULL,
	[ProjectNode_Id] [int] NOT NULL,
 CONSTRAINT [PK_ProjectNodeProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectNodes]    Script Date: 12/30/2012 5:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectNodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Order] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Project_Id] [int] NOT NULL,
	[Node_Id] [int] NOT NULL,
	[Parent_Id] [int] NULL,
 CONSTRAINT [PK_ProjectNodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 12/30/2012 5:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Properties]    Script Date: 12/30/2012 5:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Properties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[PropertyType] [smallint] NOT NULL,
	[Node_Id] [int] NOT NULL,
 CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Nodes] ON 

GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (31, N'call', N'Calls an NAnt target in the current project', CAST(0x0000A137011E8AF4 AS DateTime), CAST(0x0000A137011E8AF4 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (32, N'choose', N'Executes an alternate set of task or type definition depending on conditions that are individually set on each group', CAST(0x0000A137011EAC99 AS DateTime), CAST(0x0000A137011EAC99 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (33, N'copy', N'Copies a file, a directory, or set of files to a new file or directory.', CAST(0x0000A137011EC28C AS DateTime), CAST(0x0000A137011EC28C AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (34, N'delete', N'Deletes a file, fileset or directory.', CAST(0x0000A137011EDA0B AS DateTime), CAST(0x0000A137011EDA0B AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (35, N'description', N'An empty task that allows a build file to contain a description.', CAST(0x0000A137011F1F3F AS DateTime), CAST(0x0000A137011F1F3F AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (36, N'echo', N'Writes a message to the build log or a specified file', CAST(0x0000A137011F2FC6 AS DateTime), CAST(0x0000A137011F2FC6 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (37, N'exec', N'Executes a system command.', CAST(0x0000A137011F3D64 AS DateTime), CAST(0x0000A137011F3D64 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (38, N'fail', N'Exits the current build by throwing a BuildException, optionally printing additional information', CAST(0x0000A137011F5547 AS DateTime), CAST(0x0000A137011F5547 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (39, N'foreach', N'Loops over a set of items.', CAST(0x0000A137011F6271 AS DateTime), CAST(0x0000A137011F6271 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (40, N'get', N'Gets a particular file from a URL source.', CAST(0x0000A137011F74BE AS DateTime), CAST(0x0000A137011F74BE AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (41, N'if', N'Checks the conditional attributes and executes the children if true.', CAST(0x0000A137011F95FD AS DateTime), CAST(0x0000A137011F95FD AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (42, N'ifnot', N'The opposite of the if task.', CAST(0x0000A137011FA7DF AS DateTime), CAST(0x0000A137011FA7DF AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (43, N'mkdir', N'Creates a directory and any non-existent parent directory if necessary.', CAST(0x0000A137011FD2A8 AS DateTime), CAST(0x0000A137011FD2A8 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (44, N'move', N'Moves a file, a directory, or set of files to a new file or directory', CAST(0x0000A137011FE7DD AS DateTime), CAST(0x0000A137011FE7DD AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (45, N'nant', N'Runs NAnt on a supplied build file, or a set of build files.', CAST(0x0000A137011FF846 AS DateTime), CAST(0x0000A137011FF846 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (46, N'nunit2', N'Runs tests using the NUnit v2.6 framework.', CAST(0x0000A13701200FB9 AS DateTime), CAST(0x0000A13701200FB9 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (47, N'property', N'Sets a property in the current project.', CAST(0x0000A13701201D8D AS DateTime), CAST(0x0000A13701201D8D AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (48, N'regex', N'Sets project properties based on the evaluation of a regular expression.', CAST(0x0000A13701203BAB AS DateTime), CAST(0x0000A13701203BAB AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (49, N'script', N'Executes the code contained within the task.', CAST(0x0000A13701204E19 AS DateTime), CAST(0x0000A13701204E19 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (50, N'setenv', N'Sets an environment variable or a whole collection of them. Use an empty value attribute to clear a variable.', CAST(0x0000A137012066E8 AS DateTime), CAST(0x0000A137012066E8 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (51, N'sleep', N'A task for sleeping a specified period of time, useful when a build or deployment process requires an interval between tasks.', CAST(0x0000A13701208113 AS DateTime), CAST(0x0000A13701208113 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (52, N'solution', N'Compiles VS.NET solutions (or sets of projects), automatically determining project dependencies from inter-project references.', CAST(0x0000A1370120A32C AS DateTime), CAST(0x0000A1370120A32C AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (53, N'touch', N'Touches a file or set of files. Corresponds to the Unix touch command.', CAST(0x0000A1370120C1A6 AS DateTime), CAST(0x0000A1370120C1A6 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (54, N'trycatch', N'Executes a set of tasks, and optionally catches a build exception to allow recovery or rollback steps to be taken, or to define some steps to be taken regardless if the tasks succeed or fail, or both.', CAST(0x0000A1370120F047 AS DateTime), CAST(0x0000A1370120F047 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (55, N'unzip', N'Extracts files from a zip archive.', CAST(0x0000A1370120FFF4 AS DateTime), CAST(0x0000A1370120FFF4 AS DateTime), NULL)
GO
INSERT [dbo].[Nodes] ([Id], [Name], [Description], [DateCreated], [DateModified], [Parent_Id]) VALUES (56, N'zip', N'Creates a zip file from the specified filesets.', CAST(0x0000A137012114E1 AS DateTime), CAST(0x0000A137012114E1 AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Nodes] OFF
GO
/****** Object:  Index [IX_FK_ParentChildren]    Script Date: 12/30/2012 5:46:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ParentChildren] ON [dbo].[Nodes]
(
	[Parent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProjectNodeProjectNodeProperty]    Script Date: 12/30/2012 5:46:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProjectNodeProjectNodeProperty] ON [dbo].[ProjectNodeProperties]
(
	[ProjectNode_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PropertyProjectNodeProperty]    Script Date: 12/30/2012 5:46:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PropertyProjectNodeProperty] ON [dbo].[ProjectNodeProperties]
(
	[Property_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_NodeProjectNode]    Script Date: 12/30/2012 5:46:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_NodeProjectNode] ON [dbo].[ProjectNodes]
(
	[Node_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProjectNodeParentChildren]    Script Date: 12/30/2012 5:46:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProjectNodeParentChildren] ON [dbo].[ProjectNodes]
(
	[Parent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProjectProjectNode]    Script Date: 12/30/2012 5:46:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProjectProjectNode] ON [dbo].[ProjectNodes]
(
	[Project_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_NodeProperty]    Script Date: 12/30/2012 5:46:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_NodeProperty] ON [dbo].[Properties]
(
	[Node_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Nodes]  WITH CHECK ADD  CONSTRAINT [FK_ParentChildren] FOREIGN KEY([Parent_Id])
REFERENCES [dbo].[Nodes] ([Id])
GO
ALTER TABLE [dbo].[Nodes] CHECK CONSTRAINT [FK_ParentChildren]
GO
ALTER TABLE [dbo].[ProjectNodeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProjectNodeProjectNodeProperty] FOREIGN KEY([ProjectNode_Id])
REFERENCES [dbo].[ProjectNodes] ([Id])
GO
ALTER TABLE [dbo].[ProjectNodeProperties] CHECK CONSTRAINT [FK_ProjectNodeProjectNodeProperty]
GO
ALTER TABLE [dbo].[ProjectNodeProperties]  WITH CHECK ADD  CONSTRAINT [FK_PropertyProjectNodeProperty] FOREIGN KEY([Property_Id])
REFERENCES [dbo].[Properties] ([Id])
GO
ALTER TABLE [dbo].[ProjectNodeProperties] CHECK CONSTRAINT [FK_PropertyProjectNodeProperty]
GO
ALTER TABLE [dbo].[ProjectNodes]  WITH CHECK ADD  CONSTRAINT [FK_NodeProjectNode] FOREIGN KEY([Node_Id])
REFERENCES [dbo].[Nodes] ([Id])
GO
ALTER TABLE [dbo].[ProjectNodes] CHECK CONSTRAINT [FK_NodeProjectNode]
GO
ALTER TABLE [dbo].[ProjectNodes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectNodeParentChildren] FOREIGN KEY([Parent_Id])
REFERENCES [dbo].[ProjectNodes] ([Id])
GO
ALTER TABLE [dbo].[ProjectNodes] CHECK CONSTRAINT [FK_ProjectNodeParentChildren]
GO
ALTER TABLE [dbo].[ProjectNodes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectProjectNode] FOREIGN KEY([Project_Id])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[ProjectNodes] CHECK CONSTRAINT [FK_ProjectProjectNode]
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_NodeProperty] FOREIGN KEY([Node_Id])
REFERENCES [dbo].[Nodes] ([Id])
GO
ALTER TABLE [dbo].[Properties] CHECK CONSTRAINT [FK_NodeProperty]
GO
USE [master]
GO
ALTER DATABASE [ProjectBuilderData] SET  READ_WRITE 
GO
