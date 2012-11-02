
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/02/2012 11:45:56
-- Generated from EDMX file: C:\Users\Lynart\Documents\Academics\Project LimitBreaker\App_Code\Layer2.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [tempdb];
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

-- Creating table 'Exercises'
CREATE TABLE [dbo].[Exercises] (
    [name] nvarchar(max)  NOT NULL,
    [equipment] nvarchar(max)  NOT NULL,
    [videoLink] nvarchar(max)  NULL,
    [rep] bit  NOT NULL,
    [weight] bit  NOT NULL,
    [distance] bit  NOT NULL,
    [time] bit  NOT NULL,
    [picture] tinyint  NULL,
    [enabled] bit  NOT NULL,
    [id] int IDENTITY(1,1) NOT NULL,
    [LoggedExercise_id] bigint  NOT NULL
);
GO

-- Creating table 'MuscleGroups'
CREATE TABLE [dbo].[MuscleGroups] (
    [name] nvarchar(max)  NOT NULL,
    [Exercise_id] int  NOT NULL,
    [SuggestedExercise_id] int  NOT NULL
);
GO

-- Creating table 'ScheduledExercises'
CREATE TABLE [dbo].[ScheduledExercises] (
    [startTime] datetime  NOT NULL,
    [NeedEmailNotification] nvarchar(max)  NOT NULL,
    [id] nvarchar(max)  NOT NULL,
    [Exercise_id] int  NOT NULL,
    [ScheduledReminders_Id] int  NOT NULL,
    [LimitBreakers_Id] int  NOT NULL
);
GO

-- Creating table 'LoggedExercises'
CREATE TABLE [dbo].[LoggedExercises] (
    [sets] smallint  NOT NULL,
    [timeLogged] datetime  NOT NULL,
    [note] nvarchar(max)  NULL,
    [id] bigint IDENTITY(1,1) NOT NULL,
    [Exercise_name] nvarchar(max)  NOT NULL,
    [Routine_id] int  NOT NULL,
    [LimitBreaker_Id] int  NOT NULL
);
GO

-- Creating table 'SetAttributes'
CREATE TABLE [dbo].[SetAttributes] (
    [id] int IDENTITY(1,1) NOT NULL,
    [weight] float  NULL,
    [distance] float  NULL,
    [time] smallint  NULL,
    [reps] smallint  NULL,
    [LoggedExercise_id] bigint  NOT NULL
);
GO

-- Creating table 'ExerciseGoals'
CREATE TABLE [dbo].[ExerciseGoals] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Routine_id] int  NOT NULL,
    [SetAttribute_id] int  NOT NULL
);
GO

-- Creating table 'Routines'
CREATE TABLE [dbo].[Routines] (
    [id] int IDENTITY(1,1) NOT NULL,
    [last_modified] datetime  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [LimitBreaker_Id] int  NOT NULL
);
GO

-- Creating table 'ScheduledRoutines'
CREATE TABLE [dbo].[ScheduledRoutines] (
    [id] int IDENTITY(1,1) NOT NULL,
    [NeedEmailNotification] nvarchar(max)  NOT NULL,
    [startTime] datetime  NOT NULL,
    [Routine_id] int  NOT NULL,
    [ScheduledReminders_Id] int  NOT NULL,
    [LimitBreaker_Id] int  NOT NULL
);
GO

-- Creating table 'LevelFormulas'
CREATE TABLE [dbo].[LevelFormulas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [maxLevel] int  NOT NULL,
    [expModifier] float  NOT NULL,
    [baseRequired] float  NOT NULL
);
GO

-- Creating table 'ExperienceAtrophies'
CREATE TABLE [dbo].[ExperienceAtrophies] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [graceDays] int  NOT NULL,
    [baseLoss] float  NOT NULL
);
GO

-- Creating table 'Notifications'
CREATE TABLE [dbo].[Notifications] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [dateCreated] datetime  NOT NULL,
    [dateToBeSent] datetime  NOT NULL,
    [userEmail] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Suggestions'
CREATE TABLE [dbo].[Suggestions] (
    [id] int IDENTITY(1,1) NOT NULL,
    [reason] nvarchar(max)  NOT NULL,
    [status] nvarchar(max)  NOT NULL,
    [expiryDate] nvarchar(max)  NOT NULL,
    [needuser] nvarchar(max)  NOT NULL,
    [SuggestedExercises_id] int  NOT NULL,
    [LimitBreakers_Id] int  NOT NULL
);
GO

-- Creating table 'SuggestedExercises'
CREATE TABLE [dbo].[SuggestedExercises] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [equipment] nvarchar(max)  NOT NULL,
    [videoLink] nvarchar(max)  NOT NULL,
    [rep] int  NOT NULL,
    [wieght] float  NOT NULL,
    [distance] int  NOT NULL,
    [time] int  NOT NULL,
    [picture] tinyint  NOT NULL
);
GO

-- Creating table 'LimitBreakers'
CREATE TABLE [dbo].[LimitBreakers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [username] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [gender] nvarchar(max)  NOT NULL,
    [dateOfBirth] datetime  NOT NULL,
    [verified] bit  NOT NULL,
    [deactivated] bit  NOT NULL,
    [role] nvarchar(max)  NOT NULL,
    [status] nvarchar(max)  NOT NULL,
    [lastTimeSuggestionMade] datetime  NOT NULL,
    [Statistics_Id] int  NOT NULL
);
GO

-- Creating table 'Statistics'
CREATE TABLE [dbo].[Statistics] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [level] int  NOT NULL,
    [experience] float  NOT NULL,
    [weight] float  NOT NULL,
    [height] float  NOT NULL,
    [rmr] float  NOT NULL,
    [bmr] float  NOT NULL,
    [vo2MAX] float  NOT NULL
);
GO

-- Creating table 'Notifications_ScheduledReminder'
CREATE TABLE [dbo].[Notifications_ScheduledReminder] (
    [message] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Notifications_EmailNotification'
CREATE TABLE [dbo].[Notifications_EmailNotification] (
    [message] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL,
    [LimitBreaker_Id] int  NOT NULL
);
GO

-- Creating table 'Exercises_ExerciseExperience'
CREATE TABLE [dbo].[Exercises_ExerciseExperience] (
    [baseExperiecne] nvarchar(max)  NOT NULL,
    [weightModifier] nvarchar(max)  NOT NULL,
    [heightModifier] nvarchar(max)  NOT NULL,
    [distanceModifier] nvarchar(max)  NOT NULL,
    [timeModifier] nvarchar(max)  NOT NULL,
    [id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'Exercises'
ALTER TABLE [dbo].[Exercises]
ADD CONSTRAINT [PK_Exercises]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [name] in table 'MuscleGroups'
ALTER TABLE [dbo].[MuscleGroups]
ADD CONSTRAINT [PK_MuscleGroups]
    PRIMARY KEY CLUSTERED ([name] ASC);
GO

-- Creating primary key on [id] in table 'ScheduledExercises'
ALTER TABLE [dbo].[ScheduledExercises]
ADD CONSTRAINT [PK_ScheduledExercises]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'LoggedExercises'
ALTER TABLE [dbo].[LoggedExercises]
ADD CONSTRAINT [PK_LoggedExercises]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'SetAttributes'
ALTER TABLE [dbo].[SetAttributes]
ADD CONSTRAINT [PK_SetAttributes]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'ExerciseGoals'
ALTER TABLE [dbo].[ExerciseGoals]
ADD CONSTRAINT [PK_ExerciseGoals]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Routines'
ALTER TABLE [dbo].[Routines]
ADD CONSTRAINT [PK_Routines]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'ScheduledRoutines'
ALTER TABLE [dbo].[ScheduledRoutines]
ADD CONSTRAINT [PK_ScheduledRoutines]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Id] in table 'LevelFormulas'
ALTER TABLE [dbo].[LevelFormulas]
ADD CONSTRAINT [PK_LevelFormulas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ExperienceAtrophies'
ALTER TABLE [dbo].[ExperienceAtrophies]
ADD CONSTRAINT [PK_ExperienceAtrophies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Notifications'
ALTER TABLE [dbo].[Notifications]
ADD CONSTRAINT [PK_Notifications]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [id] in table 'Suggestions'
ALTER TABLE [dbo].[Suggestions]
ADD CONSTRAINT [PK_Suggestions]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'SuggestedExercises'
ALTER TABLE [dbo].[SuggestedExercises]
ADD CONSTRAINT [PK_SuggestedExercises]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Id] in table 'LimitBreakers'
ALTER TABLE [dbo].[LimitBreakers]
ADD CONSTRAINT [PK_LimitBreakers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Statistics'
ALTER TABLE [dbo].[Statistics]
ADD CONSTRAINT [PK_Statistics]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Notifications_ScheduledReminder'
ALTER TABLE [dbo].[Notifications_ScheduledReminder]
ADD CONSTRAINT [PK_Notifications_ScheduledReminder]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Notifications_EmailNotification'
ALTER TABLE [dbo].[Notifications_EmailNotification]
ADD CONSTRAINT [PK_Notifications_EmailNotification]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [id] in table 'Exercises_ExerciseExperience'
ALTER TABLE [dbo].[Exercises_ExerciseExperience]
ADD CONSTRAINT [PK_Exercises_ExerciseExperience]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Exercise_id] in table 'MuscleGroups'
ALTER TABLE [dbo].[MuscleGroups]
ADD CONSTRAINT [FK_ExerciseMuscleGroup]
    FOREIGN KEY ([Exercise_id])
    REFERENCES [dbo].[Exercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ExerciseMuscleGroup'
CREATE INDEX [IX_FK_ExerciseMuscleGroup]
ON [dbo].[MuscleGroups]
    ([Exercise_id]);
GO

-- Creating foreign key on [LoggedExercise_id] in table 'SetAttributes'
ALTER TABLE [dbo].[SetAttributes]
ADD CONSTRAINT [FK_LoggedExerciseSetAttributes]
    FOREIGN KEY ([LoggedExercise_id])
    REFERENCES [dbo].[LoggedExercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LoggedExerciseSetAttributes'
CREATE INDEX [IX_FK_LoggedExerciseSetAttributes]
ON [dbo].[SetAttributes]
    ([LoggedExercise_id]);
GO

-- Creating foreign key on [Exercise_id] in table 'ScheduledExercises'
ALTER TABLE [dbo].[ScheduledExercises]
ADD CONSTRAINT [FK_ScheduledExerciseExercise]
    FOREIGN KEY ([Exercise_id])
    REFERENCES [dbo].[Exercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledExerciseExercise'
CREATE INDEX [IX_FK_ScheduledExerciseExercise]
ON [dbo].[ScheduledExercises]
    ([Exercise_id]);
GO

-- Creating foreign key on [SetAttribute_id] in table 'ExerciseGoals'
ALTER TABLE [dbo].[ExerciseGoals]
ADD CONSTRAINT [FK_ExerciseGoalSetAttributes]
    FOREIGN KEY ([SetAttribute_id])
    REFERENCES [dbo].[SetAttributes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ExerciseGoalSetAttributes'
CREATE INDEX [IX_FK_ExerciseGoalSetAttributes]
ON [dbo].[ExerciseGoals]
    ([SetAttribute_id]);
GO

-- Creating foreign key on [Routine_id] in table 'ExerciseGoals'
ALTER TABLE [dbo].[ExerciseGoals]
ADD CONSTRAINT [FK_RoutineExerciseGoal]
    FOREIGN KEY ([Routine_id])
    REFERENCES [dbo].[Routines]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RoutineExerciseGoal'
CREATE INDEX [IX_FK_RoutineExerciseGoal]
ON [dbo].[ExerciseGoals]
    ([Routine_id]);
GO

-- Creating foreign key on [Routine_id] in table 'ScheduledRoutines'
ALTER TABLE [dbo].[ScheduledRoutines]
ADD CONSTRAINT [FK_ScheduledRoutineRoutine]
    FOREIGN KEY ([Routine_id])
    REFERENCES [dbo].[Routines]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledRoutineRoutine'
CREATE INDEX [IX_FK_ScheduledRoutineRoutine]
ON [dbo].[ScheduledRoutines]
    ([Routine_id]);
GO

-- Creating foreign key on [SuggestedExercises_id] in table 'Suggestions'
ALTER TABLE [dbo].[Suggestions]
ADD CONSTRAINT [FK_SuggestionSuggestedExercise]
    FOREIGN KEY ([SuggestedExercises_id])
    REFERENCES [dbo].[SuggestedExercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SuggestionSuggestedExercise'
CREATE INDEX [IX_FK_SuggestionSuggestedExercise]
ON [dbo].[Suggestions]
    ([SuggestedExercises_id]);
GO

-- Creating foreign key on [ScheduledReminders_Id] in table 'ScheduledExercises'
ALTER TABLE [dbo].[ScheduledExercises]
ADD CONSTRAINT [FK_ScheduledExerciseScheduledReminder]
    FOREIGN KEY ([ScheduledReminders_Id])
    REFERENCES [dbo].[Notifications_ScheduledReminder]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledExerciseScheduledReminder'
CREATE INDEX [IX_FK_ScheduledExerciseScheduledReminder]
ON [dbo].[ScheduledExercises]
    ([ScheduledReminders_Id]);
GO

-- Creating foreign key on [ScheduledReminders_Id] in table 'ScheduledRoutines'
ALTER TABLE [dbo].[ScheduledRoutines]
ADD CONSTRAINT [FK_ScheduledRoutineScheduledReminder]
    FOREIGN KEY ([ScheduledReminders_Id])
    REFERENCES [dbo].[Notifications_ScheduledReminder]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledRoutineScheduledReminder'
CREATE INDEX [IX_FK_ScheduledRoutineScheduledReminder]
ON [dbo].[ScheduledRoutines]
    ([ScheduledReminders_Id]);
GO

-- Creating foreign key on [LimitBreakers_Id] in table 'ScheduledExercises'
ALTER TABLE [dbo].[ScheduledExercises]
ADD CONSTRAINT [FK_ScheduledExerciseLimitBreaker]
    FOREIGN KEY ([LimitBreakers_Id])
    REFERENCES [dbo].[LimitBreakers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledExerciseLimitBreaker'
CREATE INDEX [IX_FK_ScheduledExerciseLimitBreaker]
ON [dbo].[ScheduledExercises]
    ([LimitBreakers_Id]);
GO

-- Creating foreign key on [LimitBreaker_Id] in table 'Notifications_EmailNotification'
ALTER TABLE [dbo].[Notifications_EmailNotification]
ADD CONSTRAINT [FK_LimitBreakerEmailNotification]
    FOREIGN KEY ([LimitBreaker_Id])
    REFERENCES [dbo].[LimitBreakers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LimitBreakerEmailNotification'
CREATE INDEX [IX_FK_LimitBreakerEmailNotification]
ON [dbo].[Notifications_EmailNotification]
    ([LimitBreaker_Id]);
GO

-- Creating foreign key on [Statistics_Id] in table 'LimitBreakers'
ALTER TABLE [dbo].[LimitBreakers]
ADD CONSTRAINT [FK_LimitBreakerStatistics]
    FOREIGN KEY ([Statistics_Id])
    REFERENCES [dbo].[Statistics]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LimitBreakerStatistics'
CREATE INDEX [IX_FK_LimitBreakerStatistics]
ON [dbo].[LimitBreakers]
    ([Statistics_Id]);
GO

-- Creating foreign key on [LimitBreakers_Id] in table 'Suggestions'
ALTER TABLE [dbo].[Suggestions]
ADD CONSTRAINT [FK_SuggestionLimitBreaker]
    FOREIGN KEY ([LimitBreakers_Id])
    REFERENCES [dbo].[LimitBreakers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SuggestionLimitBreaker'
CREATE INDEX [IX_FK_SuggestionLimitBreaker]
ON [dbo].[Suggestions]
    ([LimitBreakers_Id]);
GO

-- Creating foreign key on [LimitBreaker_Id] in table 'Routines'
ALTER TABLE [dbo].[Routines]
ADD CONSTRAINT [FK_LimitBreakerRoutine]
    FOREIGN KEY ([LimitBreaker_Id])
    REFERENCES [dbo].[LimitBreakers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LimitBreakerRoutine'
CREATE INDEX [IX_FK_LimitBreakerRoutine]
ON [dbo].[Routines]
    ([LimitBreaker_Id]);
GO

-- Creating foreign key on [LimitBreaker_Id] in table 'ScheduledRoutines'
ALTER TABLE [dbo].[ScheduledRoutines]
ADD CONSTRAINT [FK_LimitBreakerScheduledRoutine]
    FOREIGN KEY ([LimitBreaker_Id])
    REFERENCES [dbo].[LimitBreakers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LimitBreakerScheduledRoutine'
CREATE INDEX [IX_FK_LimitBreakerScheduledRoutine]
ON [dbo].[ScheduledRoutines]
    ([LimitBreaker_Id]);
GO

-- Creating foreign key on [LimitBreaker_Id] in table 'LoggedExercises'
ALTER TABLE [dbo].[LoggedExercises]
ADD CONSTRAINT [FK_LimitBreakerLoggedExercise]
    FOREIGN KEY ([LimitBreaker_Id])
    REFERENCES [dbo].[LimitBreakers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LimitBreakerLoggedExercise'
CREATE INDEX [IX_FK_LimitBreakerLoggedExercise]
ON [dbo].[LoggedExercises]
    ([LimitBreaker_Id]);
GO

-- Creating foreign key on [Routine_id] in table 'LoggedExercises'
ALTER TABLE [dbo].[LoggedExercises]
ADD CONSTRAINT [FK_LoggedExerciseRoutine]
    FOREIGN KEY ([Routine_id])
    REFERENCES [dbo].[Routines]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LoggedExerciseRoutine'
CREATE INDEX [IX_FK_LoggedExerciseRoutine]
ON [dbo].[LoggedExercises]
    ([Routine_id]);
GO

-- Creating foreign key on [SuggestedExercise_id] in table 'MuscleGroups'
ALTER TABLE [dbo].[MuscleGroups]
ADD CONSTRAINT [FK_SuggestedExerciseMuscleGroup]
    FOREIGN KEY ([SuggestedExercise_id])
    REFERENCES [dbo].[SuggestedExercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SuggestedExerciseMuscleGroup'
CREATE INDEX [IX_FK_SuggestedExerciseMuscleGroup]
ON [dbo].[MuscleGroups]
    ([SuggestedExercise_id]);
GO

-- Creating foreign key on [LoggedExercise_id] in table 'Exercises'
ALTER TABLE [dbo].[Exercises]
ADD CONSTRAINT [FK_ExerciseLoggedExercise]
    FOREIGN KEY ([LoggedExercise_id])
    REFERENCES [dbo].[LoggedExercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ExerciseLoggedExercise'
CREATE INDEX [IX_FK_ExerciseLoggedExercise]
ON [dbo].[Exercises]
    ([LoggedExercise_id]);
GO

-- Creating foreign key on [Id] in table 'Notifications_ScheduledReminder'
ALTER TABLE [dbo].[Notifications_ScheduledReminder]
ADD CONSTRAINT [FK_ScheduledReminder_inherits_Notification]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Notifications]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Notifications_EmailNotification'
ALTER TABLE [dbo].[Notifications_EmailNotification]
ADD CONSTRAINT [FK_EmailNotification_inherits_Notification]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Notifications]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [id] in table 'Exercises_ExerciseExperience'
ALTER TABLE [dbo].[Exercises_ExerciseExperience]
ADD CONSTRAINT [FK_ExerciseExperience_inherits_Exercise]
    FOREIGN KEY ([id])
    REFERENCES [dbo].[Exercises]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------