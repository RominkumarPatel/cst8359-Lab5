IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240711195028_mssql.azure_migration_119'
)
BEGIN
    CREATE TABLE [Fan] (
        [Id] int NOT NULL IDENTITY,
        [LastName] nvarchar(50) NOT NULL,
        [FirstName] nvarchar(50) NOT NULL,
        [BirthDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Fan] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240711195028_mssql.azure_migration_119'
)
BEGIN
    CREATE TABLE [SportClub] (
        [Id] nvarchar(450) NOT NULL,
        [Title] nvarchar(50) NOT NULL,
        [Fee] money NOT NULL,
        CONSTRAINT [PK_SportClub] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240711195028_mssql.azure_migration_119'
)
BEGIN
    CREATE TABLE [Subscriptions] (
        [FanId] int NOT NULL,
        [SportClubId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_Subscriptions] PRIMARY KEY ([FanId], [SportClubId]),
        CONSTRAINT [FK_Subscriptions_Fan_FanId] FOREIGN KEY ([FanId]) REFERENCES [Fan] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Subscriptions_SportClub_SportClubId] FOREIGN KEY ([SportClubId]) REFERENCES [SportClub] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240711195028_mssql.azure_migration_119'
)
BEGIN
    CREATE INDEX [IX_Subscriptions_SportClubId] ON [Subscriptions] ([SportClubId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20240711195028_mssql.azure_migration_119'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240711195028_mssql.azure_migration_119', N'8.0.7');
END;
GO

COMMIT;
GO

