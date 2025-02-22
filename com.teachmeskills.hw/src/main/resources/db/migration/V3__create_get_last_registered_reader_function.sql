CREATE OR REPLACE FUNCTION get_last_registered_reader() RETURNS VARCHAR AS $$
DECLARE name VARCHAR;
BEGIN
    SELECT name INTO name FROM readers ORDER BY id DESC LIMIT 1;
    RETURN name;
END;
$$ LANGUAGE plpgsql;
