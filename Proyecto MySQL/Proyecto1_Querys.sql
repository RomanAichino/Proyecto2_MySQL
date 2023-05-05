USE InformaciónUsuarios;

-- ahora voy a crear varias querys para ver un poco los datos

-- en la siguiente query veremos cuales fueron los meses donde los usuarios mas veces repitieron las mismas peliculas
SELECT v.Fecha, v.VisualizacionesTotales, u.CantidadUsuariosUnicos, v.VisualizacionesTotales - u.CantidadUsuariosUnicos AS VisualizacionesRepetidas
FROM VisualizacionesTotales v
JOIN CantidadUsuariosUnicos u ON (v.Fecha = U.Fecha)
ORDER BY VisualizacionesRepetidas DESC;

-- en la siguiente query comparamos las vistas totales, con la cantidad de horas vistas y los nuevos usuarios
-- y si bien es influyente, podemos ver que los meses con mas usuarios nuevos no siempre significa que van a haber mas visualizaciones
-- un claro ejemplo es la fecha 2017-01-01
SELECT v.Fecha, v.VisualizacionesTotales, h.HorasVistas, n.NuevosUsuarios
FROM VisualizacionesTotales v
JOIN HorasVistas h ON (v.Fecha = h.Fecha) 
JOIN NuevosUsuarios n ON (v.Fecha = n.Fecha) 
ORDER BY NuevosUsuarios DESC, HorasVistas DESC, VisualizacionesTotales DESC;

-- ya que con esta información no se me ocurren muchas mas querys, voy a crear un PROCEURE 
-- para acceder mas facilmente a todos los datos de un mes especifico

DROP PROCEDURE IF EXISTS InformacionFecha;
DELIMITER $$
CREATE PROCEDURE InformacionFecha (FechaProcedure DATE)
BEGIN
	SELECT FechaProcedure, v.VisualizacionesTotales, u.CantidadUsuariosUnicos, h.HorasVistas, n.NuevosUsuarios
    FROM VisualizacionesTotales v
	JOIN HorasVistas h ON (v.Fecha = h.Fecha) 
	JOIN NuevosUsuarios n ON (v.Fecha = n.Fecha)
    JOIN CantidadUsuariosUnicos u ON (v.Fecha = u.Fecha)
    WHERE v.Fecha = FechaProcedure;
END $$
DELIMITER ;

CALL InformacionFecha('2017-01-01');

