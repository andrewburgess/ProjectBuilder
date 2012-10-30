
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/30/2012 14:11:07
-- Generated from EDMX file: C:\Projects\ProjectBuilder\ProjectBuilder\Models\Generated\ProjectBuilderDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ProjectBuilderData];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Nodes'
CREATE TABLE [dbo].[Nodes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [DateModified] datetime  NOT NULL,
    [Parent_Id] int  NULL
);
GO

-- Creating table 'Properties'
CREATE TABLE [dbo].[Properties] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [DateModified] datetime  NOT NULL,
    [PropertyType] nvarchar(max)  NOT NULL,
    [Node_Id] int  NOT NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [DateModified] datetime  NOT NULL
);
GO

-- Creating table 'ProjectNodes'
CREATE TABLE [dbo].[ProjectNodes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Order] int  NOT NULL,
    [DateCreated] nvarchar(max)  NOT NULL,
    [DateModified] nvarchar(max)  NOT NULL,
    [Project_Id] int  NOT NULL,
    [Node_Id] int  NOT NULL,
    [Parent_Id] int  NULL
);
GO

-- Creating table 'ProjectNodeProperties'
CREATE TABLE [dbo].[ProjectNodeProperties] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Value] nvarchar(max)  NOT NULL,
    [DateCreated] nvarchar(max)  NOT NULL,
    [DateModified] nvarchar(max)  NOT NULL,
    [Property_Id] int  NOT NULL,
    [ProjectNode_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Nodes'
ALTER TABLE [dbo].[Nodes]
ADD CONSTRAINT [PK_Nodes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Properties'
ALTER TABLE [dbo].[Properties]
ADD CONSTRAINT [PK_Properties]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProjectNodes'
ALTER TABLE [dbo].[ProjectNodes]
ADD CONSTRAINT [PK_ProjectNodes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProjectNodeProperties'
ALTER TABLE [dbo].[ProjectNodeProperties]
ADD CONSTRAINT [PK_ProjectNodeProperties]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Parent_Id] in table 'Nodes'
ALTER TABLE [dbo].[Nodes]
ADD CONSTRAINT [FK_ParentChildren]
    FOREIGN KEY ([Parent_Id])
    REFERENCES [dbo].[Nodes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ParentChildren'
CREATE INDEX [IX_FK_ParentChildren]
ON [dbo].[Nodes]
    ([Parent_Id]);
GO

-- Creating foreign key on [Node_Id] in table 'Properties'
ALTER TABLE [dbo].[Properties]
ADD CONSTRAINT [FK_NodeProperty]
    FOREIGN KEY ([Node_Id])
    REFERENCES [dbo].[Nodes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_NodeProperty'
CREATE INDEX [IX_FK_NodeProperty]
ON [dbo].[Properties]
    ([Node_Id]);
GO

-- Creating foreign key on [Project_Id] in table 'ProjectNodes'
ALTER TABLE [dbo].[ProjectNodes]
ADD CONSTRAINT [FK_ProjectProjectNode]
    FOREIGN KEY ([Project_Id])
    REFERENCES [dbo].[Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectProjectNode'
CREATE INDEX [IX_FK_ProjectProjectNode]
ON [dbo].[ProjectNodes]
    ([Project_Id]);
GO

-- Creating foreign key on [Node_Id] in table 'ProjectNodes'
ALTER TABLE [dbo].[ProjectNodes]
ADD CONSTRAINT [FK_NodeProjectNode]
    FOREIGN KEY ([Node_Id])
    REFERENCES [dbo].[Nodes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_NodeProjectNode'
CREATE INDEX [IX_FK_NodeProjectNode]
ON [dbo].[ProjectNodes]
    ([Node_Id]);
GO

-- Creating foreign key on [Property_Id] in table 'ProjectNodeProperties'
ALTER TABLE [dbo].[ProjectNodeProperties]
ADD CONSTRAINT [FK_PropertyProjectNodeProperty]
    FOREIGN KEY ([Property_Id])
    REFERENCES [dbo].[Properties]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PropertyProjectNodeProperty'
CREATE INDEX [IX_FK_PropertyProjectNodeProperty]
ON [dbo].[ProjectNodeProperties]
    ([Property_Id]);
GO

-- Creating foreign key on [ProjectNode_Id] in table 'ProjectNodeProperties'
ALTER TABLE [dbo].[ProjectNodeProperties]
ADD CONSTRAINT [FK_ProjectNodeProjectNodeProperty]
    FOREIGN KEY ([ProjectNode_Id])
    REFERENCES [dbo].[ProjectNodes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectNodeProjectNodeProperty'
CREATE INDEX [IX_FK_ProjectNodeProjectNodeProperty]
ON [dbo].[ProjectNodeProperties]
    ([ProjectNode_Id]);
GO

-- Creating foreign key on [Parent_Id] in table 'ProjectNodes'
ALTER TABLE [dbo].[ProjectNodes]
ADD CONSTRAINT [FK_ProjectNodeParentChildren]
    FOREIGN KEY ([Parent_Id])
    REFERENCES [dbo].[ProjectNodes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectNodeParentChildren'
CREATE INDEX [IX_FK_ProjectNodeParentChildren]
ON [dbo].[ProjectNodes]
    ([Parent_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------