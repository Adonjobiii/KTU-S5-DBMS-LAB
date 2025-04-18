CREATE OR REPLACE TRIGGER tr_loan
AFTER UPDATE ON account
FOR EACH ROW
WHEN (NEW.balance < 0)
BEGIN
    -- Insert into the loan table if balance goes below 0
    INSERT INTO loan (accno, balance, branch)
    VALUES (:OLD.accno, :NEW.balance * -1, :OLD.branch);

    -- Insert into the borrower table
    INSERT INTO borrower (cname, accno)
    VALUES (:OLD.cname, :OLD.accno);
END;
/
