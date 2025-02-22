CREATE TABLE logs (
                      id SERIAL PRIMARY KEY,
                      action_type VARCHAR(10) NOT NULL,
                      reader_id INT NOT NULL,
                      action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION log_reader_update() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO logs (action_type, reader_id) VALUES ('UPDATE', OLD.id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER reader_update_trigger
    AFTER UPDATE ON readers
    FOR EACH ROW
EXECUTE FUNCTION log_reader_update();

CREATE OR REPLACE FUNCTION log_reader_delete() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO logs (action_type, reader_id) VALUES ('DELETE', OLD.id);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER reader_delete_trigger
    AFTER DELETE ON readers
    FOR EACH ROW
EXECUTE FUNCTION log_reader_delete();

