DECLARE
    CURSOR cur_students IS
        SELECT * FROM t1;
    v_student t1%ROWTYPE;
BEGIN
    OPEN cur_students;
    LOOP
        FETCH cur_students INTO v_student;
        EXIT WHEN cur_students%NOTFOUND;

        -- Update sessionals if within the specified range
        IF v_student.sessionals BETWEEN 30 AND 34 THEN
            v_student.sessionals := 35;
            UPDATE t1
            SET sessionals = v_student.sessionals
            WHERE roll_no = v_student.roll_no;
        END IF;

        -- Insert into t2 if total marks exceed 75
        IF (v_student.univ_mark + v_student.sessionals) > 75 THEN
            INSERT INTO t2 (roll_no, univ_mark, sessionals)
            VALUES (v_student.roll_no, v_student.univ_mark, v_student.sessionals);
        END IF;

    END LOOP;
    CLOSE cur_students;
END;
/
