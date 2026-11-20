USE EmailClassifier;
GO
INSERT INTO Emails (gmail_id, sender, subject, priority, topic, confidence, summary)
SELECT v.gmail_id, v.sender, v.subject, v.priority, v.topic, v.confidence, v.summary
FROM (VALUES
  ('t1','placement@college.edu','TCS Drive on 25th Nov','important','placements',0.95,'TCS recruitment drive'),
  ('t2','offers@shop.com','50% off sale','normal','ads',0.90,'Shopping promotion'),
  ('t3','prof@college.edu','Exam timetable','important','academics',0.92,'Exam dates released')
) AS v(gmail_id, sender, subject, priority, topic, confidence, summary)
WHERE NOT EXISTS (SELECT 1 FROM Emails e WHERE e.gmail_id = v.gmail_id);
GO
SELECT * FROM Emails;
SELECT topic, COUNT(*) AS total FROM Emails GROUP BY topic;