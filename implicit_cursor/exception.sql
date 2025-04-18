-- Table creation (for reference)
-- CREATE TABLE student (
--     rollno       INT PRIMARY KEY,
--     name         VARCHAR2(10),
--     sessionals   NUMBER,
--     univ_mark    NUMBER
-- );

DECLARE
    custom_exception EXCEPTION;
    v_rollno         INT;
    total_marks      INT;
    v_student        student%ROWTYPE;
BEGIN
    -- Accept roll number input at runtime
    v_rollno := &rollno;

    -- Fetch sessionals and university marks into record
    SELECT sessionals, univ_mark
    INTO v_student.sessionals, v_student.univ_mark
    FROM student
    WHERE rollno = v_rollno;

    -- Calculate total marks
    total_marks := v_student.sessionals + v_student.univ_mark;

    -- Check if total exceeds 150 and raise exception if so
    IF total_marks > 150 THEN
        RAISE custom_exception;
    ELSE
        DBMS_OUTPUT.PUT_LINE('NO ERROR');
    END IF;

-- Exception handling
EXCEPTION
    WHEN custom_exception THEN
        DBMS_OUTPUT.PUT_LINE('ERROR! Total of sessionals and university marks cannot exceed 150.');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ERROR! No student record found for the given roll number.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR! An unexpected issue occurred.');
END;
/
