DECLARE
    total_salary income.salary%TYPE;
BEGIN
    -- Increase all employee salaries by 20%
    UPDATE income
    SET salary = salary + (salary * 0.2);

    -- Calculate the total salary after the update
    SELECT SUM(salary)
    INTO total_salary
    FROM income;

    -- Check if total exceeds 100,000 and decide transaction outcome
    IF total_salary > 100000 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END;
/
