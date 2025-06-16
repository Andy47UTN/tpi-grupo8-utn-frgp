USE Biblioteca;
GO

/*
  Archivo: 04_Vista_HistorialPrestamos.sql
  Descripción: Vista que muestra el historial de préstamos con información de usuario, libro y fechas.
  Fecha: [08/06/2025]
*/

CREATE VIEW VW_HistorialPrestamos AS
SELECT
    P.ID_Prestamo,
    U.Nombre + ' ' + U.Apellido AS Usuario,
    L.Titulo,
    L.Autor,
    E.ID_Ejemplar,
    P.FechaPrestamo,
    P.FechaDevolucion,
    P.FechaDevolucionReal
FROM PRESTAMO P
INNER JOIN USUARIO U ON P.ID_Usuario = U.ID_Usuario
INNER JOIN EJEMPLAR E ON P.ID_Ejemplar = E.ID_Ejemplar
INNER JOIN LIBRO L ON E.ID_Libro = L.ID_Libro;

