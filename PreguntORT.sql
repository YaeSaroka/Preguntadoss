USE [master]
GO
/****** Object:  Database [PreguntORT]    Script Date: 10/8/2023 08:59:28 ******/
CREATE DATABASE [PreguntORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntORT] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntORT] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntORT', N'ON'
GO
ALTER DATABASE [PreguntORT] SET QUERY_STORE = OFF
GO
USE [PreguntORT]
GO
/****** Object:  User [alumno]    Script Date: 10/8/2023 08:59:28 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 10/8/2023 08:59:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 10/8/2023 08:59:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[idDificultad] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[idDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 10/8/2023 08:59:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[idDificultad] [int] NOT NULL,
	[Enunciado] [varchar](200) NOT NULL,
	[Foto] [varchar](300) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 10/8/2023 08:59:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (1, N'Ciencia y Tecnologia', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (2, N'Artes', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (3, N'Entretenimiento', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (4, N'Deporte', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (5, N'Geografia', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (6, N'Historia', NULL)
GO
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (1, N'Facíl')
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (2, N'Intermedio')
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (3, N'Difícil')
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿Quién es?', N'https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2021/10/05/16334350341494.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'¿Cuál es el mamífero más grande conocido hasta la actualidad?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (3, 1, 1, N'¿Qué es un equino?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (4, 1, 1, N'¿Qué causa furor en Internet?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (5, 1, 1, N'¿Con qué otro nombre se conoce el ciclo del agua?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (6, 1, 2, N'¿En qué lugar del cuerpo se produce la insulina?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (7, 1, 2, N'¿Cuál de estas redes sociales es de ámbito laboral?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (8, 1, 2, N'¿Cómo se mide la fuerza del viento en el mar?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (9, 1, 2, N'¿Qué son las enzimas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (10, 1, 2, N'¿Cuál es el símbolo de Bromo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (11, 1, 3, N'¿Cuál de las sisguientes enfermedades ataca al higado?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (12, 1, 3, N'¿Cómo tomarías la sustancia alucinógena natural llamada ayahuasca?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (13, 1, 3, N'¿Qué cambio de estado ocurre en la sublimación?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (14, 1, 3, N'¿De qué color es la sangre de los peces?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (15, 1, 3, N'¿Qué se altera cuando nos damos un golpe en la cabeza que nos hace "ver las estrellas"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (16, 2, 1, N'¿Cómo se llama a la gente que no posee magia en la saga de Harry Potter?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (17, 2, 1, N'Arroz con leche me quiero...', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (18, 2, 1, N'¿Quién pintó La Capilla Sixtina?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (19, 2, 1, N'¿Qué filósofo dijo ''solo sé que no sé nada''?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (20, 2, 1, N'¿Quién es el autor del libro "El gato negro y otros cuentos de terror"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (21, 2, 2, N'¿Quién compuso la famosa canción "Bohemian Rhapsody?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (22, 2, 2, N'¿Qué famosa artista estaba casada con su colega, Diego Rivera?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (23, 2, 2, N'¿Cómo se llama el arte japones de la papiroflexia?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (24, 2, 2, N'¿En qué año se publicó la primera parte del Quijote?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (25, 2, 2, N'¿En qué siglo nació William Shakespeare?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (26, 2, 3, N'¿Cuál era el nombre de la protagonista ''El maravilloso Mago de Oz''?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (27, 2, 3, N'¿Dónde comenzó y terminó ''La vuelta al mundo en ochenta días''?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (28, 2, 3, N'¿Quién pintó ''La miel es más dulce que la sangre''?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (29, 2, 3, N'¿Quién vivía en el 221B de Backer Street?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (30, 2, 3, N'¿De qué estilo artístico es la catedral de Santa María de Toledo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (31, 3, 1, N'¿Quién es?', N'https://4.bp.blogspot.com/-9_te9yU812w/UpY7CzKkh7I/AAAAAAAAGe8/cK5TBTgQwLk/s1600/2013-11-21-15-21-37.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (32, 3, 1, N'¿Quién es la mascota de SEGA?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (33, 3, 1, N'¿Cómo se llamaba el personaje que interpretaba Al Pacino en "Scarface"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (35, 3, 1, N'¿A qué película de Disney pertenece la canción "Un mundo ideal"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (36, 3, 1, N'¿Quién interpreta la canción "Baby One More Time "?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (37, 3, 2, N'¿A qué hace referencia ''La milla verde''?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (38, 3, 2, N'¿Cómo se llama el actor del protagonista de la saga Indiana Jones?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (39, 3, 2, N'¿A quién se considera el Rey del Pop?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (40, 3, 2, N'¿Cuál es considerado por los fans el peor juego de la historia de ATARI?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (41, 3, 2, N'¿Qué personaje del videojuego Mortal Kombat tiene poderes de hielo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (42, 3, 3, N'¿Qué día es San Valentín?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (43, 3, 3, N'¿Cómo se llama el pájaro símbolo de los Juegos del Hambre?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (44, 3, 3, N'¿Cómo se llama la serie de dibujos animados en la que sale un gato 
cósmico del siglo XXI?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (45, 3, 3, N'¿Qué Beatle fue asesinado por un fan?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (46, 3, 3, N'¿Qué grupo interpretaba la canción " Smells like teen spirit "?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (47, 4, 1, N'¿Quién es?', N'https://3.bp.blogspot.com/-65-jDfaejLY/UpLu3_sFCrI/AAAAAAAAGes/0eVO2tgFBDo/s1600/2013-11-21-15-32-40.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (48, 4, 1, N'¿Cuál es el estilo de natación más rápido?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (49, 4, 1, N'¿Cuántos puntos vale un tiro libre ensectado en baloncesto?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (50, 4, 1, N'¿Cuánto dura un partido de fútbol?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (51, 4, 1, N'¿Cómo se llama la zona de hierba rasa donde está ubicado el hoyo en golf?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (52, 4, 2, N'¿Cuál de los siguientes es un truco de skate?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (53, 4, 2, N'¿Quién ganó el mundial de fútbol del año 2002?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (54, 4, 2, N'¿Cómo se llama el estadio del FCBarcelona?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (55, 4, 2, N'Si durante una mano de Póker me tocan 3 cartas del mismo valor, ¿qué jugada tengo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (56, 4, 2, N'¿Qué país fue el ganador de baloncesto en los Juegos Olímpicos de Londres 2012?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (57, 4, 3, N'¿De qué tipo eran las 3 medallas conseguidas por Usain Bolt en los Juegos Olimpicos de Londres 2012?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (58, 4, 3, N'¿Qué clase de peso en el boxeo está entre el peso gallo y el peso ligero?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (59, 4, 3, N'Si juegas en la NFL,¿qué deporte practicas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (60, 4, 3, N'¿Cómo se llama el palo utilizado en hockey?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (61, 4, 3, N'¿Qué deporte profesional se relaciona con las siglas MLB?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (62, 5, 1, N'¿Con cuántos países limita Argentina?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (63, 5, 1, N'¿En qué país está Ushuaia, la ciudad más al sur del mundo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (64, 5, 1, N'¿Cuál de estos países africanos no tiene costa?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (65, 5, 1, N'¿Qué país africano fue antigua colonia española?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (66, 5, 1, N'¿En qué continente está la India?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (67, 5, 2, N'¿En cuál de los siguientes países NO hay ningún desierto?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (68, 5, 2, N'¿Cuál es el código internacional para Cuba?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (69, 5, 2, N'¿A qué país pertenece la bandera?', N'http://4.bp.blogspot.com/-qoVTfJvsjfw/UpbkzdEvp2I/AAAAAAAAGfs/Ck1jwmAv02w/s1600/2013-11-21-18-29-57.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (70, 5, 2, N'¿Entre qué dos países está el lago Titicaca?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (71, 5, 2, N'¿A qué país pertenece la Isla de Pascua?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (72, 5, 3, N'¿Cuál de estos países no está en una isla?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (73, 5, 3, N'¿Dónde se celebra el Oktoberfest?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (74, 5, 3, N'¿Cuál de estos países africanos NO tiene costa?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (75, 5, 3, N'¿De que tiene forma Italia?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (76, 5, 3, N'¿En qué país hay mayor número de budistas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (77, 6, 1, N'¿Quiénes fueron los sans-culottes de la Revolución Francesa?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (78, 6, 1, N'¿Qué país fue dirigido por Stalin?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (79, 6, 1, N'¿Quién liberó a Argentina, Chile y Perú?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (80, 6, 1, N'¿Dónde surgió la filosofía?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (81, 6, 1, N'¿Quién gobernó Francia desde 1799 a 1815?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (83, 6, 2, N'¿Quiénes fueron los Reyes Católicos?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (84, 6, 2, N'¿Dónde vivía Ana Frank?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (85, 6, 2, N'¿De qué árbol eran las hojas que llevaban en la cabeza los antiguos romanos para simbolizar la victoria?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (86, 6, 2, N'¿Cuál era el nombre de pila de Lenin?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (87, 6, 2, N'¿Quién dijo que la diferencia entre la estupidez y la genialidad es que la genialidad tiene límites ?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (88, 6, 3, N'¿En qué año viajó el primer hombre a la luna?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (89, 6, 3, N'¿En qué año tuvo lugar el ataque a Pearl Harbor?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (91, 6, 3, N'¿Qué otro nombre recibió el período de la Gran Hambruna China?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (92, 6, 3, N'¿Cuántos soldados argentinos murieron en la Guerra de las Malvinas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (93, 6, 3, N'¿Con qué emperador estuvo casada Cleopatra?', NULL)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'Larry Page', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'Mark Zuckerberg', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 1, 3, N'Steve Jobs', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 1, 4, N'Bill Gates', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 2, 1, N'Ballena Azul', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 2, N'Cachalote', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 2, 3, N'Elefante', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 2, 4, N'Rinoceronte', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 3, 1, N'Una vaca', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 3, 2, N'Una antílope', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 3, 3, N'Una oveja', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 3, 4, N'Un caballo', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 4, 1, N'Los gatos', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 4, 2, N'Los ratones', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (42, 4, 3, N'Los gansos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (43, 4, 4, N'Los cangrejos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (44, 5, 1, N'Ciclo natural', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (45, 5, 2, N'Ciclo hidropónico', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (46, 5, 3, N'Ciclo hidrológico', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (47, 5, 4, N'Ciclo acuoso', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (48, 6, 1, N'Páncreas', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (49, 6, 2, N'Hígado', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (50, 6, 3, N'Intestino', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (51, 6, 4, N'Riñon', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (52, 7, 1, N'Facebook', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (53, 7, 2, N'Tuenti', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (54, 7, 3, N'Jobfire', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (55, 7, 4, N'Linkedin', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 8, 1, N'Pies', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 8, 2, N'Nudos', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 8, 3, N'Zancadas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 8, 4, N'Kilómetros por hora', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 9, 1, N'Células', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (61, 9, 2, N'Clúcidos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (62, 9, 3, N'Hadas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (63, 9, 4, N'Proteínas', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (64, 10, 1, N'No es un elemento', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (65, 10, 2, N'B', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (66, 10, 3, N'Br', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (67, 10, 4, N'Bh', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (68, 11, 1, N'Hepatitis', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (69, 11, 2, N'Diabetes', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (70, 11, 3, N'Artrósis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (71, 11, 4, N'Cifoescoliosis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (72, 12, 1, N'Inhalada', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (73, 12, 2, N'Esnifada', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (74, 12, 3, N'Inyectada', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (75, 12, 4, N'Ingerida', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (76, 13, 1, N'De solido a liquido', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (77, 13, 2, N'De solido a gaseoso', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (78, 13, 3, N'De gaseoso a liquido', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (79, 13, 4, N'De liquido a solido', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (80, 14, 1, N'Verde oscuro', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (81, 14, 2, N'Marron oscuro', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (82, 14, 3, N'Rojo', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (83, 14, 4, N'Azul', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (84, 15, 1, N'El hipotalamo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (85, 15, 2, N'El bulbo raquideo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (86, 15, 3, N'La pitutaria', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (87, 15, 4, N'El nervio optico', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (88, 16, 1, N'Humano', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (89, 16, 2, N'Simplon', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (90, 16, 3, N'Impuro', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (91, 16, 4, N'Muggle', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (93, 17, 1, N'Escapar', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (94, 17, 2, N'Matar', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (95, 17, 3, N'Cazar', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (96, 17, 4, N'Casar', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (97, 18, 1, N'Giorgio Vasari', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (98, 18, 2, N'Leonardo Da Vinci', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (99, 18, 3, N'Miguel Ángel', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (100, 18, 4, N'Tiziano', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (101, 19, 1, N'Heraclito', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (102, 19, 2, N'Platón', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (103, 19, 3, N'Sócrates', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (104, 19, 4, N'Tales de Mileto', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (105, 20, 1, N'Edgar Allan Poe', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (106, 20, 2, N'Manuel Broncano', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (107, 20, 3, N'Julio César Santoyo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (108, 20, 4, N'Jesús Gabán', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (109, 21, 1, N'John Lennon', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (110, 21, 2, N'Elton John', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (111, 21, 3, N'Freddie Mercury', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (112, 21, 4, N'David Bowie', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (113, 22, 1, N'María Antonieta', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (114, 22, 2, N'Frida Kahlo', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (115, 22, 3, N'Frida Alejandra', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (116, 22, 4, N'Antonieta', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (117, 23, 1, N'Haiku', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (118, 23, 2, N'Ikebana', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (119, 23, 3, N'Origami', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (120, 23, 4, N'Ukiyo-e', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (122, 25, 1, N'XIX', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (123, 25, 2, N'XV', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (124, 25, 3, N'XVI', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (125, 25, 4, N'XVII', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (127, 24, 1, N'1615', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (128, 24, 2, N'1605', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (129, 24, 3, N'1625', 0, NULL)
GO
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (130, 24, 4, N'1635', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (131, 26, 1, N'Em', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (132, 26, 2, N'Dorothy', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (133, 26, 3, N'Agatha', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (136, 26, 4, N'Alicia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (137, 27, 1, N'Berlín', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (138, 27, 2, N'Ámsterdam', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (139, 27, 3, N'Nueva York', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (140, 27, 4, N'Londres', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (141, 28, 1, N'Tomasso Masaccio', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (142, 28, 2, N'Monet', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (143, 28, 3, N'Salvador Dalí', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (144, 28, 4, N'Picasso', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (145, 29, 1, N'Sherlock Holmes', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (146, 29, 2, N'Truman Capote', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (147, 29, 3, N'Philip Marlowe', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (148, 29, 4, N'Arthur Conan Doyle', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (149, 30, 1, N'Gótico', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (150, 30, 2, N'Románico', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (151, 30, 3, N'Barroco', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (152, 30, 4, N'Ninguno', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (153, 31, 1, N'Goerge Harrison', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (154, 31, 2, N'Ringo Starr', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (155, 31, 3, N'Paul McCartney', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (156, 31, 4, N'John Lennon', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (157, 32, 1, N'Sonic', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (158, 32, 2, N'Mario', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (159, 32, 3, N'Pac Man', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (160, 32, 4, N'Ryu', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (161, 33, 1, N'Sonny Montana', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (162, 33, 2, N'Tony Montana', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (163, 33, 3, N'Michael Corleone', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (164, 33, 4, N'Frank Slade', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (166, 35, 1, N'Aladdín', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (167, 35, 2, N'Pocahontas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (168, 35, 3, N'Mulán', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (169, 35, 4, N'Hércules ', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (170, 36, 1, N'Madonna', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (171, 36, 2, N'Montserrat', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (172, 36, 3, N'Lady Gaga', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (173, 36, 4, N'Britney Spears', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (174, 37, 1, N'A un prado cercano', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (175, 37, 2, N'A una carrera', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (176, 37, 3, N'Al corredor de la muerte ', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (177, 37, 4, N'A la cárcel', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (178, 38, 1, N'Jack Nicholson', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (179, 38, 2, N'Michael Fox', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (180, 38, 3, N'Harrison Ford', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (181, 38, 4, N'Robin Williams', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (182, 39, 1, N'Justin Bieber', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (183, 39, 2, N'Michael Jackson', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (184, 39, 3, N'Zayn Malik', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (185, 39, 4, N'Zac Efron', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (186, 40, 1, N'Tetris', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (187, 40, 2, N'ET', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (188, 40, 3, N'Combat', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (189, 40, 4, N'Galaxian', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (191, 41, 1, N'Sub-Zero', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (192, 41, 2, N'Scorpion', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (193, 41, 3, N'Reptile', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (194, 41, 4, N'Motaro', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (195, 42, 1, N'14 de Marzo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (196, 42, 2, N'15 de Febrero', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (197, 42, 3, N'14 de Febrero', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (198, 42, 4, N'15 de Marzo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (199, 43, 1, N'Lechuza', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (200, 43, 2, N'Sinsajo', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (201, 43, 3, N'Gale', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (202, 43, 4, N'Llamas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (203, 44, 1, N'Doraemon', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (204, 44, 2, N'Bob Esponja', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (205, 44, 3, N'Las Tortugas Ninja', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (206, 44, 4, N'Las Chicas Superpoderosas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (207, 45, 1, N'George Harrison', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (208, 45, 2, N'Ringo Star', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (209, 45, 3, N'Ninguno', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (210, 45, 4, N'John Lennon', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (211, 46, 1, N'Los Beatles', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (212, 46, 2, N'Led Zeppelin', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (213, 46, 3, N'Nirvana', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (214, 46, 4, N'Los Rolling Stones', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (215, 47, 1, N'Tiger Woods', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (216, 47, 2, N'Mike Tyson', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (217, 47, 3, N'Ronaldinho', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (218, 47, 4, N'Denzel Washington', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (220, 48, 1, N'Crol', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (221, 48, 2, N'Espalda', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (222, 48, 3, N'Mariposa', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (223, 48, 4, N'Pecho', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (224, 49, 1, N'1', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (225, 49, 2, N'2', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (226, 49, 3, N'3', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (227, 49, 4, N'Depende', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (228, 50, 1, N'90 minutos', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (229, 50, 2, N'45 minutos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (230, 50, 3, N'75 minutos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (231, 50, 4, N'80 minutos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (232, 51, 1, N'Green ', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (233, 51, 2, N'Esplanada', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (234, 51, 3, N'Campo', 0, NULL)
GO
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (235, 51, 4, N'Terreno', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (236, 52, 1, N'Mollie', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (237, 52, 2, N'Ollie', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (238, 52, 3, N'Clop', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (239, 52, 4, N'Superchop', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (240, 53, 1, N'Italia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (241, 53, 2, N'España', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (242, 53, 3, N'Brasil', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (243, 53, 4, N'Francia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (244, 54, 1, N'Santiago Bernabeu', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (245, 54, 2, N'Camp Nou', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (246, 54, 3, N'La Masia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (247, 54, 4, N'Barcelona Camp', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (248, 55, 1, N'Doble Par', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (249, 55, 2, N'Trio', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (250, 55, 3, N'Full', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (251, 55, 4, N'Par', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (252, 56, 1, N'España', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (253, 56, 2, N'Japón', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (254, 56, 3, N'Estados Unidos', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (255, 56, 4, N'Italia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (256, 57, 1, N'Plata', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (257, 57, 2, N'Bronce', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (258, 57, 3, N'Oro', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (259, 57, 4, N'No consiguió ninguna', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (260, 58, 1, N'Peso Ideal', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (261, 58, 2, N'Peso mosca', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (262, 58, 3, N'Peso pluma', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (263, 58, 4, N'Sobrepeso', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (264, 59, 1, N'Natación', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (265, 59, 2, N'Hockey', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (266, 59, 3, N'Golf', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (267, 59, 4, N'Futbol americano', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (268, 60, 1, N'Vara', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (269, 60, 2, N'Bate', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (270, 60, 3, N'Stick', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (271, 60, 4, N'Stack', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (272, 61, 1, N'Badminton', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (273, 61, 2, N'Baseball', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (274, 61, 3, N'Lacrosse', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (275, 61, 4, N'Baloncesto', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (276, 62, 1, N'3', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (277, 62, 2, N'4', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (278, 62, 3, N'5', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (279, 62, 4, N'6', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (280, 63, 1, N'Chile', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (281, 63, 2, N'Argentina', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (283, 63, 3, N'Sudáfrica', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (284, 63, 4, N'Nueva Zelanda', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (285, 64, 1, N'Mauritania', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (286, 64, 2, N'Senegal', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (287, 64, 3, N'Gambia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (288, 64, 4, N'Todas tienen costa', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (289, 65, 1, N'R.D. Congo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (290, 65, 2, N'Guinea Ecuatorial', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (291, 65, 3, N'Sudáfrica', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (292, 65, 4, N'Egipto', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (293, 66, 1, N'Oceanía', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (295, 66, 2, N'América', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (296, 66, 3, N'Asia', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (298, 66, 4, N'África', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (299, 67, 1, N'España', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (300, 67, 2, N'Chile', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (301, 67, 3, N'Mongolia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (302, 67, 4, N'Alemania', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (303, 68, 1, N'CA', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (304, 68, 2, N'CU', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (305, 68, 3, N'CB', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (306, 68, 4, N'Ninguna es correcta', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (307, 69, 1, N'Bangladesh', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (308, 69, 2, N'Japón', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (309, 69, 3, N'Laos', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (310, 69, 4, N'Vietnam', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (311, 70, 1, N'Bolivia y Perú', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (312, 70, 2, N'Bolivia y Paraguay', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (313, 70, 3, N'Bolivia y Brasil', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (314, 70, 4, N'Bolivia y Argentina', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (315, 71, 1, N'Indonesia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (316, 71, 2, N'Chile', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (317, 71, 3, N'Australia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (318, 71, 4, N'Es un país', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (320, 72, 1, N'Japón', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (321, 72, 2, N'Jamaica', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (322, 72, 3, N'Madagascar', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (323, 72, 4, N'Ghana', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (324, 73, 1, N'Alemania', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (325, 73, 2, N'Rusia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (326, 73, 3, N'Ucrania', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (327, 73, 4, N'Reino Unido', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (328, 74, 1, N'Sudáfrica', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (329, 74, 2, N'Túnez', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (330, 74, 3, N'Chad', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (331, 74, 4, N'Marruecos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (332, 75, 1, N'Gorro', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (333, 75, 2, N'Bota', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (334, 75, 3, N'Submarino', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (335, 75, 4, N'Nube', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (336, 76, 1, N'China', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (337, 76, 2, N'Japón', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (338, 76, 3, N'Nepal', 0, NULL)
GO
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (339, 76, 4, N'India', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (340, 77, 1, N'La burguesia durante la Revolución', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (342, 77, 2, N'La principal masa social revolucionaria', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (343, 77, 3, N'El nombre despectivo de los burgueses', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (344, 77, 4, N'Ninguna es correcta', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (345, 78, 1, N'Union Soviética', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (346, 78, 2, N'Cuba', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (347, 78, 3, N'Alemania', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (348, 78, 4, N'Polonia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (349, 79, 1, N'Ernesto ''Che'' Guevara', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (350, 79, 2, N'Manual Belgrano', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (351, 79, 3, N'José de San Martín', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (352, 79, 4, N'Simón Bolivar', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (353, 80, 1, N'Grecia', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (354, 80, 2, N'España', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (355, 80, 3, N'Egipto', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (356, 80, 4, N'Japón', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (357, 81, 1, N'Adam Smith', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (358, 81, 2, N'Francois Quesnay', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (359, 81, 3, N'Napoleón Bonaparte', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (360, 81, 4, N'Louis Bonaldgug', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (361, 83, 1, N'Juana I y Felipe I', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (362, 83, 2, N'Isabel I y Fernando II', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (363, 83, 3, N'Isabel II y Francisco de Asís', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (364, 83, 4, N'Isbael I y Fernando VII', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (365, 84, 1, N'Viena', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (366, 84, 2, N'Berlín', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (367, 84, 3, N'Ámsterdam', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (368, 84, 4, N'Brujas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (369, 85, 1, N'Olivo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (370, 85, 2, N'Naranjo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (371, 85, 3, N'Pino', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (372, 85, 4, N'Laurel', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (373, 86, 1, N'Vladimir', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (374, 86, 2, N'Aléksey', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (375, 86, 3, N'Iósif', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (376, 86, 4, N'Aleksandr', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (377, 87, 1, N'Einstein', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (378, 87, 2, N'Ghandi', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (379, 87, 3, N'Nietzsche', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (380, 87, 4, N'Wilde', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (381, 88, 1, N'1969', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (382, 88, 2, N'1968', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (383, 88, 3, N'1979', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (384, 88, 4, N'1957', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (385, 89, 1, N'1939', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (386, 89, 2, N'1940', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (388, 89, 3, N'1941', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (389, 89, 4, N'1942', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (390, 91, 1, N'Tres años de desastres naturales', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (391, 91, 2, N'Tres años de dificultades económicas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (392, 91, 3, N'Tres años amargos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (393, 91, 4, N'Todas son correctas', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (394, 92, 1, N'649', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (395, 92, 2, N'200', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (396, 92, 3, N'987', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (397, 92, 4, N'1452', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (398, 93, 1, N'Ptolomeo XIV', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (399, 93, 2, N'Julio César', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (400, 93, 3, N'Marco Antonio', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (401, 93, 4, N'Todas son correctas', 1, NULL)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([idDificultad])
REFERENCES [dbo].[Dificultades] ([idDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas1] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Preguntas] ([idPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas1]
GO
USE [master]
GO
ALTER DATABASE [PreguntORT] SET  READ_WRITE 
GO
