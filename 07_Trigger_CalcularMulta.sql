USE Biblioteca;
GO

/*
  Archivo: 07_Trigger_CalcularMulta.sql
  Descripción: Trigger que calcula y registra una multa cuando un ejemplar se devuelve tarde.
  Fecha: [08/06/2025]
*/

CREATE TRIGGER TR_CalcularMulta
ON PRESTAMO
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(FechaDevolucionReal)
    BEGIN
        INSERT INTO MULTA (ID_Prestamo, Monto, FechaGenerada)
        SELECT 
            i.ID_Prestamo,
            DATEDIFF(DAY, i.FechaDevolucion, i.FechaDevolucionReal) * 100.00,
            GETDATE()
        FROM inserted i
        WHERE 
            i.FechaDevolucionReal IS NOT NULL
            AND i.FechaDevolucionReal > i.FechaDevolucion;
    END
END;




