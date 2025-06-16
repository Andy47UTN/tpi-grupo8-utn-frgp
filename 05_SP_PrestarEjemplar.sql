USE Biblioteca;
GO

/*
  Archivo: 05_SP_PrestarEjemplar.sql
  Descripción: Procedimiento almacenado para registrar un préstamo de un ejemplar a un usuario.
               Valida que el ejemplar esté disponible y actualiza su estado a 'Prestado'.
  Fecha: [08/06/2025]
*/

CREATE PROCEDURE SP_PrestarEjemplar
    @ID_Ejemplar INT,
    @ID_Usuario INT,
    @FechaPrestamo DATE,
    @FechaDevolucion DATE
AS
BEGIN
    SET NOCOUNT ON;

    
    IF EXISTS (
        SELECT 1 FROM EJEMPLAR WHERE ID_Ejemplar = @ID_Ejemplar AND Estado = 'Disponible'
    )
    BEGIN
        
        INSERT INTO PRESTAMO (ID_Ejemplar, ID_Usuario, FechaPrestamo, FechaDevolucion, FechaDevolucionReal)
        VALUES (@ID_Ejemplar, @ID_Usuario, @FechaPrestamo, @FechaDevolucion, NULL);

       
        UPDATE EJEMPLAR SET Estado = 'Prestado' WHERE ID_Ejemplar = @ID_Ejemplar;
    END
    ELSE
    BEGIN
        -- Si el ejemplar no está disponible, muestra mensaje de error
        RAISERROR('El ejemplar no está disponible para préstamo.', 16, 1);
    END
END;


