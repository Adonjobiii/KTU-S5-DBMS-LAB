CREATE OR REPLACE TRIGGER tg_mark
BEFORE UPDATE OR INSERT ON t1
FOR EACH ROW
BEGIN
    -- Check if the new value of univ_mark is greater than 70
    IF :NEW.univ_mark > 70 THEN
        -- Raise an application error with a custom message and error code
        RAISE_APPLICATION_ERROR(-20001, 'Invalid univ mark: Value cannot be greater than 70');
    END IF;
END;
/
