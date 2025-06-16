USE Biblioteca;
GO

/*
  Archivo: 08_Trigger_ExpirarReserva.sql
  Descripción: Trigger que marca como 'Expirada' las reservas cuyo plazo ya venció.
  Fecha: [08/06/2025]
*/

CREATE TRIGGER TR_ExpirarReserva
ON RESERVA
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE R
    SET Estado = 'Expirada'
    FROM RESERVA R
    INNER JOIN inserted i ON R.ID_Reserva = i.ID_Reserva
    WHERE 
        R.Estado = 'Activa'
        AND R.FechaReserva < CAST(GETDATE() AS DATE);
END;


