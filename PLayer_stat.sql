--Use Database
USE afcon;

--Show table
SELECT * FROM player_stat;

--Average age,height and weight of players
SELECT AVG(age) AS avg_age,AVG(height_ft) AS avg_height,AVG(weight_lbs) AS avg_weight
	FROM player_stat;

--Number of players per team
SELECT team,COUNT(*) AS total_players
	FROM player_stat
		GROUP BY team
			ORDER BY total_players DESC;

--Player with their point contribution
SELECT name,goals,assist,(goals +assist) AS contribution
	FROM player_stat
		WHERE goals<>0 and assist<>0
			GROUP BY name,goals,assist
				ORDER BY contribution DESC;

--Player and their total goals
SELECT name,goals
	FROM player_stat
		GROUP BY name,goals
			ORDER BY goals DESC;

--Players with clean sheets
SELECT name,team,appearances
	FROM player_stat
		WHERE red_card=0 and yellow_card=0 and appearances <>0
			ORDER BY appearances DESC;

--Total red and yellow cards per team
SELECT team, SUM(CAST(red_card as int)) AS total_red_card,SUM(CAST(yellow_card as int)) AS total_yellow_card
	FROM player_stat
		GROUP BY team
			ORDER BY total_yellow_card DESC;

--Players with their total shots and shots on target
SELECT name,shots_on_target,shots
	FROM player_stat
		WHERE Shots_on_target<>0 and Shots<>0
			ORDER BY shots DESC;

--Totals fouls committed and suffered by each team
SELECT team,SUM(foul_committed) AS total_fouls_committed,SUM(foul_against) AS total_fouls_against
	FROM player_stat
		GROUP BY team
			ORDER BY total_fouls_committed DESC;

--Total yellow and red card per player
SELECT name,team,yellow_card,red_card,appearances
	FROM player_stat
		WHERE yellow_card<>0 or red_card<>0 and appearances <>0
			ORDER BY yellow_card DESC;

--Total appearances per player
SELECT name,team,appearances
	FROM player_stat
		ORDER BY Appearances DESC;

--Player position and total goals
SELECT name,position,goals
	FROM player_stat
		WHERE goals<>0
			ORDER BY goals DESC;

--Total goals scored by player position
SELECT position, SUM(goals) AS Total_goals
	FROM player_stat
		GROUP BY position
			ORDER BY Total_goals DESC;