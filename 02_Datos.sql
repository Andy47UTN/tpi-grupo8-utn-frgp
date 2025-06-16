USE Biblioteca;
GO


INSERT INTO USUARIO (Nombre, Apellido, Email, Contrasena, TipoUsuario) VALUES
('Ángel', 'Simon', 'angel.simon@utn.edu.ar', 'pwd1234', 'Alumno'),
('Brian', 'Lara', 'brian.lara@utn.edu.ar', 'pwd5678', 'Bibliotecario');


INSERT INTO LIBRO (Titulo, Autor, Anio, UbicacionFisica) VALUES
('El Aleph', 'Jorge Luis Borges', 1949, 'Estante A1'),
('Cien años de soledad', 'Gabriel García Márquez', 1967, 'Estante B2');


INSERT INTO EJEMPLAR (ID_Libro, Estado) VALUES
(1, 'Disponible'),
(1, 'Prestado'),
(2, 'Disponible');


INSERT INTO PRESTAMO (ID_Ejemplar, ID_Usuario, FechaPrestamo, FechaDevolucion, FechaDevolucionReal)
VALUES (2, 1, '2024-06-01', '2024-06-15', NULL);


INSERT INTO RESERVA (ID_Ejemplar, ID_Usuario, FechaReserva, Estado)
VALUES (3, 2, '2024-06-10', 'Activa');
