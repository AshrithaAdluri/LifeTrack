IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'governanceDb')
    CREATE DATABASE governanceDb;
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'clinicalDb')
    CREATE DATABASE clinicalDb;
