USE EmailClassifier;
GO
IF COL_LENGTH('dbo.Emails', 'snippet') IS NULL
  ALTER TABLE Emails ADD snippet NVARCHAR(1000) NULL;
GO
IF COL_LENGTH('dbo.Emails', 'status') IS NULL
  ALTER TABLE Emails ADD status NVARCHAR(10) NOT NULL CONSTRAINT DF_Emails_status DEFAULT 'new';
GO
DELETE FROM Emails WHERE gmail_id IN ('t1','t2','t3');
GO