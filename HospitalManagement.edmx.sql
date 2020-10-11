
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/06/2017 09:19:37
-- Generated from EDMX file: D:\Junaid\Github\HospitalManagement\HospitalManagement.edmx
-- --------------------------------------------------

USE master
GO

--Create a database
IF EXISTS(SELECT name FROM sys.databases
    WHERE name = 'HospitalManagement')
    DROP DATABASE HospitalManagement
GO

CREATE DATABASE HospitalManagement
GO

SET QUOTED_IDENTIFIER OFF;
GO
USE [HospitalManagement];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserPatient]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Patients] DROP CONSTRAINT [FK_UserPatient];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCaregiver]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Caregivers] DROP CONSTRAINT [FK_UserCaregiver];
GO
IF OBJECT_ID(N'[dbo].[FK_UserDoctor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Doctors] DROP CONSTRAINT [FK_UserDoctor];
GO
IF OBJECT_ID(N'[dbo].[FK_PatientCaregiver]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Caregivers] DROP CONSTRAINT [FK_PatientCaregiver];
GO
IF OBJECT_ID(N'[dbo].[FK_UserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_UserRole];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorMessage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Messages] DROP CONSTRAINT [FK_DoctorMessage];
GO
IF OBJECT_ID(N'[dbo].[FK_PatientMessage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Messages] DROP CONSTRAINT [FK_PatientMessage];
GO
IF OBJECT_ID(N'[dbo].[FK_UserEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_UserEvent];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Patients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Patients];
GO
IF OBJECT_ID(N'[dbo].[Caregivers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Caregivers];
GO
IF OBJECT_ID(N'[dbo].[Doctors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Doctors];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[Messages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Messages];
GO
IF OBJECT_ID(N'[dbo].[Events]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Events];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NULL,
    [Password] nvarchar(max)  NULL,
    [UserName] nvarchar(max)  NULL,
    [Age] bigint  NULL,
    [Gender] nvarchar(max)  NULL,
    [NRIC] nvarchar(max)  NULL,
    [Comments] nvarchar(max)  NULL,
    [Address] nvarchar(max)  NULL,
    [ContactNo] nvarchar(max)  NULL,
    [FullName] nvarchar(max)  NULL,
    [Role_Id] bigint  NOT NULL
);
GO

-- Creating table 'Patients'
CREATE TABLE [dbo].[Patients] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Disease] nvarchar(max)  NULL,
    [Occupation] nvarchar(max)  NULL,
    [EntryDate] datetime  NULL,
    [EntryTime] time  NULL,
    [EntryDateStr] nvarchar(max)  NULL,
    [Status] nvarchar(max)  NULL,
    [User_Id] bigint  NOT NULL
);
GO

-- Creating table 'Caregivers'
CREATE TABLE [dbo].[Caregivers] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [User_Id] bigint  NOT NULL,
    [Patient_Id] bigint  NULL
);
GO

-- Creating table 'Doctors'
CREATE TABLE [dbo].[Doctors] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Designation] nvarchar(max)  NULL,
    [Specialization] nvarchar(max)  NULL,
    [User_Id] bigint  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL
);
GO

-- Creating table 'Messages'
CREATE TABLE [dbo].[Messages] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NULL,
    [DoctorId] bigint  NOT NULL,
    [PatientId] bigint  NOT NULL,
    [FromPatient] bit  NULL
);
GO

-- Creating table 'Events'
CREATE TABLE [dbo].[Events] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Start] datetime  NULL,
    [End] datetime  NULL,
    [allDay] bit  NULL,
    [UserId] bigint  NOT NULL,
    [Name] nvarchar(max)  NULL,
    [Description] nvarchar(max)  NULL,
    [Status] bit  NULL,
    [StartDateStr] nvarchar(max)  NULL,
    [StartTime] time  NULL,
    [EndDateStr] nvarchar(max)  NULL,
    [EndTime] time  NULL,
    [URL] nvarchar(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Patients'
ALTER TABLE [dbo].[Patients]
ADD CONSTRAINT [PK_Patients]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Caregivers'
ALTER TABLE [dbo].[Caregivers]
ADD CONSTRAINT [PK_Caregivers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Doctors'
ALTER TABLE [dbo].[Doctors]
ADD CONSTRAINT [PK_Doctors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Messages'
ALTER TABLE [dbo].[Messages]
ADD CONSTRAINT [PK_Messages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [PK_Events]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [User_Id] in table 'Patients'
ALTER TABLE [dbo].[Patients]
ADD CONSTRAINT [FK_UserPatient]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPatient'
CREATE INDEX [IX_FK_UserPatient]
ON [dbo].[Patients]
    ([User_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Caregivers'
ALTER TABLE [dbo].[Caregivers]
ADD CONSTRAINT [FK_UserCaregiver]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCaregiver'
CREATE INDEX [IX_FK_UserCaregiver]
ON [dbo].[Caregivers]
    ([User_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Doctors'
ALTER TABLE [dbo].[Doctors]
ADD CONSTRAINT [FK_UserDoctor]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserDoctor'
CREATE INDEX [IX_FK_UserDoctor]
ON [dbo].[Doctors]
    ([User_Id]);
GO

-- Creating foreign key on [Patient_Id] in table 'Caregivers'
ALTER TABLE [dbo].[Caregivers]
ADD CONSTRAINT [FK_PatientCaregiver]
    FOREIGN KEY ([Patient_Id])
    REFERENCES [dbo].[Patients]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PatientCaregiver'
CREATE INDEX [IX_FK_PatientCaregiver]
ON [dbo].[Caregivers]
    ([Patient_Id]);
GO

-- Creating foreign key on [Role_Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserRole]
    FOREIGN KEY ([Role_Id])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRole'
CREATE INDEX [IX_FK_UserRole]
ON [dbo].[Users]
    ([Role_Id]);
GO

-- Creating foreign key on [DoctorId] in table 'Messages'
ALTER TABLE [dbo].[Messages]
ADD CONSTRAINT [FK_DoctorMessage]
    FOREIGN KEY ([DoctorId])
    REFERENCES [dbo].[Doctors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorMessage'
CREATE INDEX [IX_FK_DoctorMessage]
ON [dbo].[Messages]
    ([DoctorId]);
GO

-- Creating foreign key on [PatientId] in table 'Messages'
ALTER TABLE [dbo].[Messages]
ADD CONSTRAINT [FK_PatientMessage]
    FOREIGN KEY ([PatientId])
    REFERENCES [dbo].[Patients]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PatientMessage'
CREATE INDEX [IX_FK_PatientMessage]
ON [dbo].[Messages]
    ([PatientId]);
GO

-- Creating foreign key on [UserId] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_UserEvent]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserEvent'
CREATE INDEX [IX_FK_UserEvent]
ON [dbo].[Events]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------