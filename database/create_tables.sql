IF DB_ID('EmailClassifier') IS NULL CREATE DATABASE EmailClassifier;
GO
USE EmailClassifier;
GO
IF OBJECT_ID('dbo.Emails') IS NULL
CREATE TABLE Emails (
  id           INT IDENTITY(1,1) PRIMARY KEY,
  gmail_id     NVARCHAR(100) NOT NULL UNIQUE,
  sender       NVARCHAR(320),
  subject      NVARCHAR(500),
  priority     NVARCHAR(20),
  topic        NVARCHAR(30),
  confidence   DECIMAL(3,2),
  summary      NVARCHAR(500),
  processed_at DATETIME2 DEFAULT SYSUTCDATETIME()
);
GO
