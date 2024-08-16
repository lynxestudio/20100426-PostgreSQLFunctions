
CREATE FUNCTION AddCities(varchar) RETURNS VARCHAR AS
'DECLARE
hay record;
nume varchar;
BEGIN
SELECT INTO hay count(city) FROM cities WHERE city = $1;
IF hay.count = 0
THEN
INSERT INTO cities(idcity,city)
VALUES(substring($1,1,3) || substring(random() * 1000,1,2),$1);
SELECT INTO nume idcity FROM cities WHERE city = $1;
UPDATE authors SET city = nume WHERE city = $1;
RETURN nume;
END IF;
IF hay.count > 0
THEN
SELECT INTO nume idcity FROM cities WHERE city = $1;
UPDATE authors SET city = nume WHERE city = $1;
RETURN nume;
END IF;
END;
' LANGUAGE 'plpgsql';