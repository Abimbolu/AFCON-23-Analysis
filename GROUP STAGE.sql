--Use database
USE AFCON;

--Show table
SELECT * FROM Group_Stage;

 --change column name
EXEC sp_rename 'group_stage.[group]','grp','column';

--Check how many squad per group
SELECT grp,COUNT(squad) 
	FROM Group_Stage
		GROUP BY grp;

--Team and win frequency
SELECT squad,WIN
	FROM group_stage
		GROUP BY squad,win
			ORDER BY win DESC;

--Group and their total goals
SELECT grp,SUM(goal_for) AS total_goals
	FROM  Group_Stage
		GROUP BY grp
			ORDER BY total_goals DESC;

--Team and their total goals
SELECT squad,SUM(goal_for) AS total_goals 
	FROM  Group_Stage
		GROUP BY squad
			ORDER BY total_goals DESC;

--Team and their respective win percentage
SELECT squad,MP,WIN,((Win*100)/ (MP)) AS win_percentage
	FROM  Group_Stage
		GROUP BY squad,WIN,MP
			ORDER BY win_percentage DESC;

--Team with their total points
SELECT squad,points
	FROM  Group_Stage
		ORDER BY points DESC;

--Matches played by each team
SELECT squad,mp
	FROM  Group_Stage
		ORDER BY mp DESC;
