\COPY status FROM '/app/LabBDData/status.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY seasons FROM '/app/LabBDData/seasons.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY countries FROM '/app/LabBDData/countries.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY airports FROM '/app/LabBDData/airports.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY geocities15k FROM '/app/LabBDData/Cities15000.tsv' WITH (FORMAT CSV, DELIMITER '\t', HEADER true);
\COPY circuits FROM '/app/LabBDData/circuits.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY constructors FROM '/app/LabBDData/constructors.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY driver FROM '/app/LabBDData/drivers.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY races FROM '/app/LabBDData/races.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY driverstandings FROM '/app/LabBDData/driver_Standings.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY laptimes FROM '/app/LabBDData/lap_Times.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY pitstops FROM '/app/LabBDData/pit_Stops.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY qualifying FROM '/app/LabBDData/qualifying.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
\COPY results FROM '/app/LabBDData/results.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER true);
