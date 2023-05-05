CREATE DATABASE InformaciónUsuarios; -- creamos la base de datos
USE InformaciónUsuarios;

DROP TABLE IF EXISTS VisualizacionesTotales;
CREATE TABLE VisualizacionesTotales (
    Fecha DATE,
    VisualizacionesTotales INT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci; -- Creamos la primer tabla

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cinear-visualizaciones-totales-2023-03_v1.csv'
INTO TABLE VisualizacionesTotales
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1
LINES (Fecha, VisualizacionesTotales); -- Cargamos la primer tabla con los datos del archivo .csv

-- ahora repito el proceso con las 3 tablas restantes

DROP TABLE IF EXISTS CantidadUsuariosUnicos;
CREATE TABLE CantidadUsuariosUnicos (
    Fecha DATE,
    CantidadUsuariosUnicos INT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cinear-usuarios-unicos-visualizaciones-2023-03_v1.csv'
INTO TABLE CantidadUsuariosUnicos
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1
LINES (Fecha, CantidadUsuariosUnicos);

DROP TABLE IF EXISTS NuevosUsuarios;
CREATE TABLE NuevosUsuarios (
    Fecha DATE,
    NuevosUsuarios INT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cinear-usuarios-unicos-visualizaciones-2023-03_v1.csv'
INTO TABLE NuevosUsuarios
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1
LINES (Fecha, NuevosUsuarios);

DROP TABLE IF EXISTS HorasVistas;
CREATE TABLE HorasVistas (
    Fecha DATE,
    HorasVistas INT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cinear-total-horas-vistas-2023-03_v1.csv'
INTO TABLE HorasVistas
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1
LINES (Fecha, HorasVistas);