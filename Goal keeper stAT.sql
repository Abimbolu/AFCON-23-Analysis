--Use database
USE AFCON

--Show table
SELECT * FROM GK_stat;

SELECT AVG(age) AS avg_age, AVG(weight_lbs) AS avg_weight
	FROM Gk_stat;

--Total appearances per goal keeper
SELECT name, appearance,team
	FROM Gk_stat
		GROUP BY name, appearance, team
			ORDER BY appearance desc;

 --Goal Keeper with the highest number of saves
 SELECT name,team,saves
	FROM Gk_stat
		ORDER BY saves desc;


--Goal Keeper with the clean sheets
SELECT name, Appearance
	FROM GK_STAT
		WHERE red_card = 0 and yellow_card =0 AND Appearance <> 0
			ORDER BY Appearance desc;

--Goal Keeper with yellow and red cards
SELECT name,team, Appearance,yellow_card,red_card
	FROM GK_STAT
		WHERE red_card <> 0 or yellow_card <>0 and Appearance <> 0
			ORDER BY Appearance desc;


--Goal keeper with fouls_committed and fouls_suffered frequency
SELECT  name, fouls_suffered,fouls_committed
	FROM Gk_stat
		GROUP BY name,Fouls_Committed, fouls_suffered 
			ORDER BY fouls_suffered DESC;

--Goal keeper and their save percentage
SELECT name,team,saves,goals_against,
		CASE WHEN saves+goals_against =0 THEN 0
			ELSE (saves*100/(saves+goals_against)) END AS save_percentage
	FROM gk_stat
		WHERE saves<>0 and goals_against<>0
			GROUP BY name,team,saves,goals_against
				ORDER BY save_percentage DESC;


