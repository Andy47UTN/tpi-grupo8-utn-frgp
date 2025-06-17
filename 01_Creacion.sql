/*
  Tabla: USUARIO
  Definición de la entidad USUARIO.
  Fecha: [07/06/2025]
*/
CREATE TABLE USUARIO (
  ID_Usuario   INT IDENTITY(1,1) PRIMARY KEY,
  Nombre       NVARCHAR(100)     NOT NULL,
  Apellido     NVARCHAR(100)     NOT NULL,
  Email        NVARCHAR(200)     NOT NULL,
  Contrasena   NVARCHAR(100)     NOT NULL,
  TipoUsuario  NVARCHAR(20)      NOT NULL
    CONSTRAINT chk_TipoUsuario CHECK (TipoUsuario IN ('Alumno','Bibliotecario'))
);

/*
  Tabla: LIBRO
  Definición de la entidad LIBRO.
  Fecha: [07/06/2025]
*/
CREATE TABLE LIBRO (
  ID_Libro        INT IDENTITY(1,1) PRIMARY KEY,
  Titulo          NVARCHAR(200)    NOT NULL,
  Autor           NVARCHAR(150)    NOT NULL,
  Anio            INT              NOT NULL,
  UbicacionFisica NVARCHAR(100)    NOT NULL
);

/*
  Tabla: EJEMPLAR
  Definición de la entidad EJEMPLAR. Cada ejemplar pertenece a un libro.
  Tiene un estado: Disponible, Prestado o Reservado.
  Fecha: [07/06/2025]
*/
CREATE TABLE EJEMPLAR (
  ID_Ejemplar INT IDENTITY(1,1) PRIMARY KEY,
  ID_Libro    INT              NOT NULL,
  Estado      NVARCHAR(20)     NOT NULL
    CONSTRAINT chk_Ejemplar_Estado CHECK (Estado IN ('Disponible','Prestado','Reservado')),
  CONSTRAINT fk_Ejemplar_Libro FOREIGN KEY (ID_Libro) REFERENCES LIBRO(ID_Libro)
);

/*
  Tabla: PRESTAMO
  Definición de la entidad PRESTAMO.
  Relaciona un ejemplar, un usuario y las fechas del préstamo.
  Fecha: [07/06/2025]
*/
CREATE TABLE PRESTAMO (
  ID_Prestamo         INT IDENTITY(1,1) PRIMARY KEY,
  ID_Ejemplar         INT              NOT NULL,
  ID_Usuario          INT              NOT NULL,
  FechaPrestamo       DATE             NOT NULL,
  FechaDevolucion     DATE             NOT NULL,
  FechaDevolucionReal DATE             NULL,
  CONSTRAINT fk_Prestamo_Ejemplar FOREIGN KEY (ID_Ejemplar) REFERENCES EJEMPLAR(ID_Ejemplar),
  CONSTRAINT fk_Prestamo_Usuario  FOREIGN KEY (ID_Usuario ) REFERENCES USUARIO (ID_Usuario)
);

/*
  Tabla: RESERVA
  Definición de la entidad RESERVA. Cada reserva une usuario y ejemplar, con estado.
  Fecha: [07/06/2025]
*/
CREATE TABLE RESERVA (
  ID_Reserva   INT IDENTITY(1,1) PRIMARY KEY,
  ID_Ejemplar  INT              NOT NULL,
  ID_Usuario   INT              NOT NULL,
  FechaReserva DATE             NOT NULL,
  Estado       NVARCHAR(20)     NOT NULL
    CONSTRAINT chk_Reserva_Estado CHECK (Estado IN ('Activa','Cancelada','Expirada')),
  CONSTRAINT fk_Reserva_Ejemplar FOREIGN KEY (ID_Ejemplar) REFERENCES EJEMPLAR(ID_Ejemplar),
  CONSTRAINT fk_Reserva_Usuario  FOREIGN KEY (ID_Usuario ) REFERENCES USUARIO (ID_Usuario)
);
/*
  Tabla: MULTA
  Guarda el monto de multa por devolución tardía de préstamos.
  Fecha: [08/06/2025]
*/
CREATE TABLE MULTA (
  ID_Multa INT IDENTITY(1,1) PRIMARY KEY,
  ID_Prestamo INT NOT NULL,
  Monto DECIMAL(10,2) NOT NULL,
  FechaGenerada DATE NOT NULL,
  CONSTRAINT fk_Multa_Prestamo FOREIGN KEY (ID_Prestamo) REFERENCES PRESTAMO(ID_Prestamo)
);








