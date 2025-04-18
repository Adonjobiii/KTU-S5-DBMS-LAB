DECLARE
    n NUMBER;        -- Input number
    s NUMBER := 0;    -- Sum of digits raised to the power of number of digits
    i NUMBER;         -- Loop iterator (not used in the original code, but included for completeness)
    l NUMBER;         -- Length of the number (number of digits)
    r NUMBER;         -- Remainder of division (digit)
    p NUMBER;         -- Copy of the input number to preserve the original value
BEGIN
    -- Accept input number
    n := &n;
    p := n;
    
    -- Calculate the length of the number (number of digits)
    l := LENGTH(TO_CHAR(p));
    
    -- Loop through each digit of the number
    WHILE p > 0 LOOP
        r := MOD(p, 10);            -- Get the last digit
        s := s + POWER(r, l);       -- Add the digit raised to the power of the total number of digits
        p := TRUNC(p / 10);         -- Remove the last digit
    END LOOP;
    
    -- Output the sum of the digits raised to the power
    DBMS_OUTPUT.PUT_LINE('s = ' || s);

    -- Check if the number is an Armstrong number
    IF n = s THEN
        DBMS_OUTPUT.PUT_LINE('Is Armstrong');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not Armstrong');
    END IF;
END;
/
