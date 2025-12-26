-- trigger to stop over capacity
CREATE OR REPLACE FUNCTION check_capacity()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM attendance WHERE class_id = NEW.class_id) >= 
       (SELECT capacity FROM classes WHERE id = NEW.class_id) THEN
        RAISE EXCEPTION 'Class capacity exceeded';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_capacity
BEFORE INSERT ON attendance
FOR EACH ROW
EXECUTE FUNCTION check_capacity();