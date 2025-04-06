DO $$
DECLARE psql_mode TEXT;
BEGIN
    -- Obtendo a variável do PSQL (psql_mode) pra determinar que o script está sendo rodado no psql. Se estiver, ele usa o comando \COPY em vez do COPY
    BEGIN
        SELECT :'PSQL_MODE' INTO psql_mode;
    EXCEPTION WHEN OTHERS THEN
        psql_mode := NULL;
    END;
    IF psql_mode IS NOT NULL THEN
        -- Comandos a serem executados dentro do psql 
        RAISE NOTICE '';
    ELSE
        -- Comandos SQL Normais
        EXECUTE 'COPY STATUS FROM ’./LabBD/status.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY SEASONS FROM ’./LabBD/seasons.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY COUNTRIES FROM ’./LabBD/countries.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY AIRPORTS FROM ’./LabBD/airports.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY GEOCITIES15K FROM ’./LabBD/Cities15000.tsv’ WITH (FORMAT CSV, DELIMITER ’\t’, HEADER true)';
        EXECUTE 'COPY CIRCUITS FROM ’./LabBD/circuits.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY CONSTRUCTORS FROM ’./LabBD/constructors.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY DRIVER FROM ’./LabBD/drivers.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY RACES FROM ’./LabBD/races.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY DRIVERSTANDINGS FROM ’./LabBD/driver_Standings.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY LAPTIMES FROM ’./LabBD/lap_Times.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY PITSTOPS FROM ’./LabBD/pit_Stops.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY QUALIFYING FROM ’./LabBD/qualifying.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
        EXECUTE 'COPY RESULTS FROM ’./LabBD/results.csv’ WITH (FORMAT CSV, DELIMITER ’,’, HEADER true)';
    END IF;
END $$