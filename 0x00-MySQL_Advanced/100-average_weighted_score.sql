-- creates a stored procedure computes and store the average weighted score
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(user_id INT)
BEGIN
    DECLARE multiSum FLOAT;
    DECLARE factorSum INT;
    SET multiSum = (SELECT SUM(p.weight * c.score)
                    FROM corrections c
                    JOIN projects p
                    ON c.project_id = p.id
                    WHERE c.user_id = user_id);
    SET factorSum = (SELECT SUM(weight)
                     FROM corrections c
                     JOIN projects p
                     ON c.project_id = p.id
                     WHERE c.user_id = user_id);
    UPDATE users SET average_score = (multiSum / factorSum) WHERE users.id = user_id;
END $$
DELIMITER ;
