CREATE OR REPLACE PROCEDURE pr(no IN NUMBER) IS
    tot NUMBER;  -- Variable to store the student's mark
BEGIN
    -- Fetch the mark for the student with the given roll number (rno)
    SELECT mark INTO tot FROM student5 WHERE rno = no;

    -- Classify the student based on their marks
    IF tot > 100 THEN
        DBMS_OUTPUT.PUT_LINE('A');
    ELSIF tot > 70 AND tot <= 100 THEN
        DBMS_OUTPUT.PUT_LINE('B');
    ELSIF tot > 50 AND tot <= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
/
