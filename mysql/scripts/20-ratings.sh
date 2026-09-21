#!/bin/bash
set -e

mysql -uroot <<EOF
CREATE DATABASE IF NOT EXISTS ratings
DEFAULT CHARACTER SET 'utf8';

USE ratings;

CREATE TABLE IF NOT EXISTS ratings (
    sku varchar(80) NOT NULL,
    avg_rating DECIMAL(3, 2) NOT NULL,
    rating_count INT NOT NULL,
    PRIMARY KEY (sku)
) ENGINE=InnoDB;

CREATE USER IF NOT EXISTS 'ratings'@'%' IDENTIFIED BY '${RATINGS_DB_PASSWORD}';
ALTER USER 'ratings'@'%' IDENTIFIED BY '${RATINGS_DB_PASSWORD}';
GRANT ALL ON ratings.* TO 'ratings'@'%';
FLUSH PRIVILEGES;
EOF

