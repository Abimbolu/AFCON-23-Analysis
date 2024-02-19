--Create database

CREATE DATABASE AFCON;
--use database
USE AFCON;

--Show table
SELECT * FROM SandF;

-- Average Attendance Per Stage
SELECT ROUND, AVG(Attendance) AS Avg_attendance
	FROM SandF
	GROUP BY ROUND
	ORDER BY Avg_attendance DESC;

--Most common matchday
SELECT Day, COUNT(*) AS Frequency
	FROM SandF
	GROUP BY Day
	ORDER BY frequency DESC;

--Teams with the most goals home and away
SELECT TOP 1 team_home,MAX(th_score) AS Max_home_score,team_away, MAX(ta_score) AS Max_away_score
	FROM SandF
	GROUP BY Team_Home,Team_Away
	ORDER BY Max_home_score DESC, Max_away_score DESC;
	
--Most frequently occuring referee
SELECT TOP 1 referee, COUNT(*) AS frequency
	FROM SandF
	GROUP  BY referee
	ORDER BY frequency DESC;

SELECT * FROM SandF;

--Most common match time;
SELECT TOP 1 Time, COUNT(*) AS frequency
	FROM SandF
	GROUP BY Time
	ORDER BY frequency desc;

--Average number of goals per stage;
SELECT ROUND, AVG(TH_score)as Avg_home_score, AVG(TA_score) AS Avg_away_score
	FROM SandF
	GROUP BY ROUND;

--Venue and usage frequency
SELECT Venue, COUNT(*) AS Frequency
	FROM SandF
	GROUP BY venue
	ORDER BY Frequency DESC;

--Total number of matches won by each team
SELECT team, COUNT(*) AS Total_wins
	FROM(
		SELECT Team_home AS team
			FROM SandF
			WHERE th_score>ta_score
		UNION ALL
		SELECT team_away as team
			FROM SandF
			WHERE ta_score>th_score
		) AS Wins
		GROUP BY team
		ORDER BY Total_wins DESC;