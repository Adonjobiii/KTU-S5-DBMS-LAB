CREATE OR REPLACE PACKAGE pkg2 AS

    -- Procedure declaration: prints a message with the input number
    PROCEDURE p1(r IN NUMBER);

    -- Function declaration: returns the input number
    FUNCTION f1(r IN NUMBER) RETURN NUMBER;

END pkg2;
/
