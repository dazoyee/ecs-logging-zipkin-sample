CREATE
    DATABASE es_db;
USE
    es_db;
DROP TABLE IF EXISTS es_status_table;
CREATE TABLE es_status_table
(
    id                BIGINT(20) UNSIGNED AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (id),
    status_id         CHAR(1)                            NOT NULL,
    UNIQUE KEY unique_id (status_id),
    status_name       VARCHAR(32)                        NOT NULL,
    modification_time TIMESTAMP                          NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    insertion_time    TIMESTAMP                          NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS es_client_table;
CREATE TABLE es_client_table
(
    id                BIGINT(20) UNSIGNED AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY unique_id (id),
    client_name       VARCHAR(32)                        NOT NULL,
    status_id         CHAR(1)                            NOT NULL REFERENCES es_status_table (status_id),
    flag              CHAR(1)                            NOT NULL DEFAULT '0',
    modification_time TIMESTAMP                          NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    insertion_time    TIMESTAMP                          NOT NULL DEFAULT CURRENT_TIMESTAMP
);
