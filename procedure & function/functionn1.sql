CREATE OR REPLACE FUNCTION f1(r IN NUMBER) RETURN NUMBER IS
    p student1.physics_mark%TYPE;   -- Physics mark of the student
    c student1.chemistry_mark%TYPE; -- Chemistry mark of the student
    m student1.maths_mark%TYPE;     -- Maths mark of the student
    t NUMBER;                       -- Total marks variable
BEGIN
    -- Fetch marks for the student based on the provided REG_NO
    SELECT physics_mark, chemistry_mark, maths_mark
    INTO p, c, m
    FROM student1
    WHERE reg_no = r;

    -- Calculate the total marks
    t := p + c + m;

    -- Return the total marks
    RETURN t;
END;
/
