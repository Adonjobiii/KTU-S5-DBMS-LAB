CREATE OR REPLACE FUNCTION f1(no IN NUMBER) RETURN NUMBER IS
    s NUMBER := 0;  -- Sum of the odd numbers
    i NUMBER := 2;  -- First odd number in the sequence (starts at 2)
    ab NUMBER := 1; -- Counter for number of odd numbers processed
BEGIN
    -- Loop through the odd numbers up to 'no'
    WHILE ab <= no LOOP
        s := s + i;  -- Add the current odd number to the sum
        i := i + 2;  -- Move to the next odd number
        ab := ab + 1; -- Increment the counter
    END LOOP;
    
    -- Return the sum of the first 'no' odd numbers
    RETURN s;
END;
/
