-- creates a stored procedure computes and store the average score for a student
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(user_id FLOAT)
BEGIN
    SET @avg = (SELECT AVG(score) FROM corrections WHERE corrections.user_id = user_id);
    UPDATE users SET average_score = @avg
    WHERE id = user_id;
END $$
DELIMITER ;
