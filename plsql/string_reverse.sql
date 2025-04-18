DECLARE
    s VARCHAR2(20);  -- Input string
    r VARCHAR2(20) := '';  -- Reversed string (initialized to empty)
    l NUMBER;         -- Length of the string
    i NUMBER;         -- Loop iterator
BEGIN
    -- Accept input string
    s := '&s';  -- Substitution variable to accept the string input

    -- Get the length of the input string
    l := LENGTH(s);

    -- Loop through the string in reverse order
    FOR i IN REVERSE 1..l LOOP
        r := r || SUBSTR(s, i, 1);  -- Concatenate the characters in reverse order
    END LOOP;

    -- Output the reversed string
    DBMS_OUTPUT.PUT_LINE('Reversed string: ' || r);
END;
/
