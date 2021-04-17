INSERT INTO es_status_table (status_id, status_name)
VALUES ('1', 'not_yet'), ('2', 'done'), ('3', 'error');

INSERT INTO es_client_table (client_name, status)
VALUES ('mike', '1'), ('tim', '2');

UPDATE es_table
SET client_name = < new client name >
WHERE id=<id>;

INSERT INTO es_table (id, client_name)
VALUES (<id>, <client name when created> ON DUPLICATE KEY UPDATE client_name=<client name when updated>;
