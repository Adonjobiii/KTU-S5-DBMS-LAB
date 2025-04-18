-- Table creation (for reference)
-- CREATE TABLE income (
--     name   VARCHAR2(10),
--     salary INT
-- );

DECLARE
    v_income income%ROWTYPE;
BEGIN
    -- Fetch Sindhu's salary into the record
    SELECT salary 
    INTO v_income.salary 
    FROM income 
    WHERE name = 'Sindhu';

    -- Apply salary increment based on the current salary
    IF v_income.salary > 10000 THEN
        v_income.salary := v_income.salary + (v_income.salary * 0.3);
    ELSIF v_income.salary > 8000 THEN
        v_income.salary := v_income.salary + (v_income.salary * 0.2);
    ELSE
        v_income.salary := v_income.salary + (v_income.salary * 0.1);
    END IF;

    -- Update the new salary back to the table
    UPDATE income 
    SET salary = v_income.salary 
    WHERE name = 'Sindhu';
END;
/
