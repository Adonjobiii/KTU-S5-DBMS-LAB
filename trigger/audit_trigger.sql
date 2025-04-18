CREATE OR REPLACE TRIGGER t2
AFTER UPDATE OR DELETE ON student3
FOR EACH ROW
BEGIN
    -- Check if the operation is DELETE
    IF DELETING THEN
        INSERT INTO student_audit 
        VALUES (:OLD.rollno, :OLD.name, 'deleted data', SYSDATE);
    -- Check if the operation is UPDATE
    ELSE
        INSERT INTO student_audit 
        VALUES (:OLD.rollno, :OLD.name, 'updated data', SYSDATE);
    END IF;
END;
/
