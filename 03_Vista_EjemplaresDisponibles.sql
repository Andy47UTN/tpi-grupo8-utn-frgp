USE Biblioteca;
GO

/*
  Archivo: 03_Vista_EjemplaresDisponibles.sql
  Descripción: Vista que muestra todos los ejemplares de libros que están disponibles para préstamo.
  Fecha: [08/06/2025]
*/

CREATE VIEW VW_EjemplaresDisponibles AS
SELECT 
    E.ID_Ejemplar,
    L.Titulo,
    L.Autor,
    E.Estado
FROM EJEMPLAR E
INNER JOIN LIBRO L ON E.ID_Libro = L.ID_Libro
WHERE E.Estado = 'Disponible';


