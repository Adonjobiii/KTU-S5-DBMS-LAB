CREATE OR REPLACE PACKAGE s AS

    -- Procedure declaration: calculates and displays grade based on marks
    PROCEDURE p(r IN NUMBER);

    -- Function declaration: returns the total marks for a student
    FUNCTION f(r IN NUMBER) RETURN NUMBER;

END s;
/
