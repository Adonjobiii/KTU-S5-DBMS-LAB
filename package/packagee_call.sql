DECLARE
    r NUMBER;
    t NUMBER;
BEGIN
    -- Accept roll number input at runtime
    r := &rollno;

    -- Get total marks using package function
    t := s.f(r);

    -- Call procedure to display grade
    s.p(r);

    -- Display total marks
    DBMS_OUTPUT.PUT_LINE('Total marks: ' || t);
END;
/
