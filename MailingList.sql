CREATE DATABASE IF NOT EXISTS mailing;
USE mailing;
CREATE TABLE IF NOT EXISTS mailing (
	first_name VARCHAR(20),
    last_name VARCHAR(30),
    email VARCHAR(50),
    address VARCHAR(150),
    zip_code INT(10)
);

CREATE TABLE IF NOT EXISTS zip (
	zip_code INT(10) PRIMARY KEY,
    city VARCHAR(30),
    state VARCHAR(20)
);

INSERT INTO zip (zip_code, city, state)
	VALUES
		(14350, 'Jakarta Utara', 'Tanjung Priok'),
        (14210, 'Jakarta Utara', 'Kelapa Gading Barat'),
        (14430, 'Jakarta Utara', 'Ancol');
        
INSERT INTO mailing (first_name, last_name, email, address, zip_code)
	VALUES
		('John', 'Smith', 'jsmith@example.com', 'Sunter Agung Utara', 14350),
        ('Jane', 'Doe', 'janedoe@example.com', 'Kelapa Gading Barat', 14210),
        ('John', 'Clark', 'johnclark@example.com', 'Ancol', 14430);
        
SELECT
	mailing.first_name,
    mailing.last_name,
    mailing.address,
    mailing.zip_code,
    zip.zip_code,
    zip.city,
    zip.state
FROM mailing, zip WHERE mailing.zip_code = zip.zip_code;

