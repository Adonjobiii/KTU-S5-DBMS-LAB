CREATE OR REPLACE PACKAGE BODY pkg2 AS

    -- Procedure to print a message with the input number
    PROCEDURE p1(r IN NUMBER) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Hello, ' || r);
    END p1;

    -- Function to return the input number
    FUNCTION f1(r IN NUMBER) RETURN NUMBER IS
    BEGIN
        RETURN r;
    END f1;

END pkg2;
/
