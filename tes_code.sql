-- Create a table to store the players.csv
CREATE TABLE tennis_db (
    player_id INT NOT NULL,
    first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
    hand VARCHAR(1) NOT NULL,
	country_code VARCHAR(3) NOT NULL,
	PRIMARY KEY (player_id)
);

-- Create a table to store the matches.csv
DROP TABLE matches;
CREATE TABLE matches (
	loser_age FLOAT NOT NULL,
	loser_id INT NOT NULL,
	loser_name VARCHAR(40) NOT NULL,
	loser_rank INT NOT NULL,
	winner_age FLOAT NOT NULL,
	winner_id INT NOT NULL,
	winner_name VARCHAR(40) NOT NULL,
	winner_rank INT NOT NULL,
	FOREIGN KEY (loser_id) REFERENCES tennis_db (player_id),
	FOREIGN KEY (winner_id) REFERENCES tennis_db (player_id)
);

-- Count how many times Serena Williams has won
SELECT winner_name, COUNT(winner_name)
FROM matches
GROUP BY winner_name
ORDER BY winner_name DESC;

-- Count the dominant hand of the players
SELECT hand,
COUNT(hand)
FROM tennis_db
GROUP BY hand;

-- return the number of wins for each dominant hand
-- Joins only the winner_id which filters the data down
-- Counts the dominant hands in the available, filtered data
-- sends to handedness table
SELECT tdb.hand, COUNT(tdb.hand)
FROM tennis_db AS tdb
INNER JOIN matches
ON (tdb.player_id = matches.winner_id)
GROUP BY tdb.hand;

SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;