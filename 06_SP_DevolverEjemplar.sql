USE Biblioteca;
GO

/*
  Archivo: 06_SP_DevolverEjemplar.sql
  Descripción: Procedimiento almacenado para registrar la devolución de un ejemplar.
               Actualiza la FechaDevolucionReal y pone el ejemplar en estado 'Disponible'.
  Fecha: [08/06/2025]
*/

CREATE PROCEDURE SP_DevolverEjemplar
    @ID_Prestamo INT,
    @FechaDevolucionReal DATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PRESTAMO
    SET FechaDevolucionReal = @FechaDevolucionReal
    WHERE ID_Prestamo = @ID_Prestamo;

    DECLARE @ID_Ejemplar INT;
    SELECT @ID_Ejemplar = ID_Ejemplar FROM PRESTAMO WHERE ID_Prestamo = @ID_Prestamo;

    UPDATE EJEMPLAR
    SET Estado = 'Disponible'
    WHERE ID_Ejemplar = @ID_Ejemplar;
END;


