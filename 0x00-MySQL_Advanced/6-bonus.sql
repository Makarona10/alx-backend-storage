-- creates a stored procedure AddBonus that adds a new correction for a student

CREATE PROCEDURE AddBonus(user_id INT,
            project_name VARCHAR(255),
            score INT)
BEGIN
    IF EXISTS (SELECT 1 FROM projects WHERE 'name' = 'project_name')
        SET @id = (SELECT id FROM projects WHERE 'name' = 'project_name');
        INSERT INTO corrections (user_id, project_id, score)
        VALUES (user_id, @id, score)
    ELSE
        SET @id = (INSERT INTO projects ('name') VALUES (project_name) RETURNING id);
        INSERT INTO corrections (user_id, project_id, score)
        VALUES (user_id, @id, score);
    END IF;
END
