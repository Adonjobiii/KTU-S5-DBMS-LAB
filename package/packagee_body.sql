CREATE OR REPLACE PACKAGE BODY s AS

    -- Procedure to calculate and display grade based on average marks
    PROCEDURE p(r IN NUMBER) IS
        g CHAR(1);
        t NUMBER;
    BEGIN
        -- Calculate total marks
        SELECT physics_mark + chemistry_mark + maths_mark
        INTO t
        FROM student1
        WHERE reg_no = r;

        -- Calculate average
        t := t / 3;

        -- Determine grade based on average
        IF t BETWEEN 80 AND 100 THEN
            g := 'A';
        ELSIF t BETWEEN 70 AND 80 THEN
            g := 'B';
        ELSIF t BETWEEN 50 AND 70 THEN
            g := 'C';
        ELSE
            g := 'F';
        END IF;

        -- Output the grade
        DBMS_OUTPUT.PUT_LINE('Grade is: ' || g);
    END p;

    -- Function to return total marks of a student
    FUNCTION f(r IN NUMBER) RETURN NUMBER IS
        t NUMBER;
    BEGIN
        SELECT physics_mark + chemistry_mark + maths_mark
        INTO t
        FROM student1
        WHERE reg_no = r;

        RETURN t;
    END f;

END s;
/
