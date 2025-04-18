DECLARE
    v_record       hostel_mess%ROWTYPE;
    CURSOR mess_cursor IS
        SELECT * FROM hostel_mess;
    v_updated_fees NUMBER;
BEGIN
    OPEN mess_cursor;
    LOOP
        FETCH mess_cursor INTO v_record;
        EXIT WHEN mess_cursor%NOTFOUND;
        
        IF v_record.veg_nonveg = 'veg' THEN
            v_updated_fees := v_record.messfee + (v_record.messfee * 0.1);
            INSERT INTO vegetarian (stud_no, name, extra_charge, entry_date)
            VALUES (v_record.stud_no, v_record.name, v_record.messfee * 0.1, SYSDATE);
        
        ELSE
            v_updated_fees := v_record.messfee + (v_record.messfee * 0.2);
            INSERT INTO non_vegetarian (stud_no, name, extra_charge, entry_date)
            VALUES (v_record.stud_no, v_record.name, v_record.messfee * 0.2, SYSDATE);
        
        END IF;
        
    END LOOP;
    CLOSE mess_cursor;
END;
/
