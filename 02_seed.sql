INSERT INTO policies (category, severity, sla_min) VALUES ('Spam', 1, 1440);
INSERT INTO policies (category, severity, sla_min) VALUES ('Harassment', 3, 480);
INSERT INTO policies (category, severity, sla_min) VALUES ('Hate Speech', 4, 240);
INSERT INTO policies (category, severity, sla_mins) VALUES ('Violence', 5, 60);
INSERT INTO policies (category, severity, sla_min) VALUES ('Misinformation', 2, 720);

INSERT INTO moderator (name, team) VALUES ('Asha', 'Team A');
INSERT INTO moderator (name, team) VALUES ('Ravi', 'Team A');
INSERT INTO moderator (name, team) VALUES ('Meena', 'Team B');
INSERT INTO moderator (name, team) VALUES ('Karthik', 'Team B');
INSERT INTO moderator (name, team) VALUES ('Priya', 'Team C');

COMMIT;