CREATE DATABASE Sports_League;

USE Sports_League;

CREATE TABLE Teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    coach_name VARCHAR(100),
    home_stadium VARCHAR(100)
);

CREATE TABLE Players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    age INT,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Leagues (
    league_id INT AUTO_INCREMENT PRIMARY KEY,
    league_name VARCHAR(100) NOT NULL,
    season_year INT
);

CREATE TABLE Matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    team1_id INT,
    team2_id INT,
    match_date DATE,
    venue VARCHAR(100),
    league_id INT,
    FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES Teams(team_id),
    FOREIGN KEY (league_id) REFERENCES Leagues(league_id)
);

CREATE TABLE Scores (
    score_id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT,
    team_id INT,
    goals INT,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);


INSERT INTO Teams (team_name, coach_name, home_stadium) VALUES
('Thunder FC', 'Alex Morgan', 'Thunder Stadium'),
('Lightning United', 'Chris Adams', 'Lightning Arena'),
('Storm Breakers', 'Dana Lee', 'Storm Park'),
('Blaze FC', 'Rafael Torres', 'Blaze Dome'),
('Iron Wolves', 'Jenna Brooks', 'Wolf Arena'),
('Sky Hawks', 'Mark Daniels', 'Sky Field'),
('Shadow Strikers', 'Lily Cruz', 'Shadow Ground'),
('Fire Eagles', 'Thomas Grant', 'Eagle Arena'),
('Ocean Wave FC', 'Samantha King', 'Ocean Park'),
('Mountain Rangers', 'Leo Jackson', 'High Peak Stadium'),
('Desert Scorpions', 'Rachel Stone', 'Scorpion Arena'),
('Golden Knights', 'Victor Kim', 'Knight Field');



INSERT INTO Players (first_name, last_name, position, age, team_id) VALUES
('Jake', 'Thompson', 'Forward', 26, 1),
('Emily', 'Clark', 'Midfielder', 22, 2),
('Nathan', 'Gray', 'Defender', 27, 3),
('Olivia', 'Reed', 'Goalkeeper', 24, 4),
('Lucas', 'Bell', 'Forward', 23, 5),
('Sophia', 'Mills', 'Defender', 25, 6),
('Henry', 'Woods', 'Midfielder', 28, 7),
('Aaron', 'Smith', 'Forward', 24, 8),
('Brenda', 'Lopez', 'Midfielder', 26, 9),
('Carlos', 'Nguyen', 'Defender', 23, 10),
('Diana', 'Patel', 'Goalkeeper', 25, 11),
('Ethan', 'Baker', 'Forward', 27, 12),
('Fiona', 'Garcia', 'Midfielder', 21, 8),
('George', 'Lee', 'Defender', 22, 9),
('Hannah', 'Khan', 'Goalkeeper', 28, 10),
('Ian', 'Turner', 'Forward', 26, 11),
('Jade', 'Morris', 'Defender', 24, 12);



INSERT INTO Leagues (league_name, season_year) VALUES
('Premier League', 2024),
('National Cup', 2024),
('Champions League', 2024),
('Youth League', 2024),
('Senior League', 2024),
('Women’s Super League', 2024),
('International Trophy', 2024),
('Elite League', 2025),
('Metro League', 2025),
('Amateur Cup', 2025),
('Legends Trophy', 2025),
('Winter Invitational', 2025);


INSERT INTO Matches (team1_id, team2_id, match_date, venue, league_id) VALUES
(1, 2, '2024-06-01', 'Thunder Stadium', 1),
(3, 4, '2024-06-03', 'Storm Park', 2),
(5, 6, '2024-06-05', 'Wolf Arena', 3),
(2, 7, '2024-06-07', 'Lightning Arena', 4),
(1, 3, '2024-06-09', 'Thunder Stadium', 5),
(4, 6, '2024-06-11', 'Blaze Dome', 6),
(5, 7, '2024-06-13', 'Wolf Arena', 7),
(8, 9, '2024-06-15', 'Eagle Arena', 1),
(10, 11, '2024-06-17', 'High Peak Stadium', 2),
(12, 1, '2024-06-19', 'Knight Field', 3),
(2, 8, '2024-06-21', 'Lightning Arena', 4),
(3, 9, '2024-06-23', 'Storm Park', 5),
(4, 10, '2024-06-25', 'Blaze Dome', 6),
(5, 11, '2024-06-27', 'Wolf Arena', 7);


INSERT INTO Scores (match_id, team_id, goals) VALUES
(1, 1, 3), (1, 2, 2),
(2, 3, 1), (2, 4, 1),
(3, 5, 2), (3, 6, 3),
(4, 2, 0), (4, 7, 1),
(5, 1, 4), (5, 3, 3),
(6, 4, 1), (6, 6, 2),
(7, 5, 2), (7, 7, 2),
(8, 8, 2), (8, 9, 1),
(9, 10, 0), (9, 11, 3),
(10, 12, 1), (10, 1, 2),
(11, 2, 2), (11, 8, 2),
(12, 3, 3), (12, 9, 0),
(13, 4, 1), (13, 10, 1),
(14, 5, 2), (14, 11, 2);


SELECT 
    m.match_id, t1.team_name AS Team1, t2.team_name AS Team2,
    s1.goals AS Team1_Goals, s2.goals AS Team2_Goals
FROM Matches m
INNER JOIN Teams t1 ON m.team1_id = t1.team_id
INNER JOIN Teams t2 ON m.team2_id = t2.team_id
INNER JOIN Scores s1 ON m.match_id = s1.match_id AND s1.team_id = t1.team_id
INNER JOIN Scores s2 ON m.match_id = s2.match_id AND s2.team_id = t2.team_id;


SELECT 
    t.team_name, p.first_name, p.last_name
FROM Teams t
LEFT JOIN Players p ON t.team_id = p.team_id;


SELECT 
    p.first_name, p.last_name, t.team_name
FROM Players p
RIGHT JOIN Teams t ON p.team_id = t.team_id;


SELECT 
    t.team_name, p.first_name, p.last_name
FROM Teams t
LEFT JOIN Players p ON t.team_id = p.team_id
UNION
SELECT 
    t.team_name, p.first_name, p.last_name
FROM Players p
RIGHT JOIN Teams t ON p.team_id = t.team_id;


SELECT 
    t.team_name, l.league_name
FROM Teams t
CROSS JOIN Leagues l;


SELECT 
    t.team_name, COUNT(p.player_id) AS total_players
FROM Teams t
LEFT JOIN Players p ON t.team_id = p.team_id
GROUP BY t.team_name;


SELECT 
    t.team_name, SUM(s.goals) AS total_goals
FROM Teams t
JOIN Scores s ON t.team_id = s.team_id
GROUP BY t.team_name;


SELECT 
    t.team_name, AVG(s.goals) AS avg_goals
FROM Teams t
JOIN Scores s ON t.team_id = s.team_id
GROUP BY t.team_name;


SELECT 
    t.team_name, AVG(s.goals) AS avg_goals
FROM Teams t
JOIN Scores s ON t.team_id = s.team_id
GROUP BY t.team_name;


SELECT 
    t.team_name, MAX(s.goals) AS max_goals
FROM Teams t
JOIN Scores s ON t.team_id = s.team_id
GROUP BY t.team_name;


SELECT 
    t.team_name, MIN(s.goals) AS min_goals
FROM Teams t
JOIN Scores s ON t.team_id = s.team_id
GROUP BY t.team_name;