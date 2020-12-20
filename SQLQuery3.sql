USE [master]
GO
/****** Object:  Database [trabajo final de base de datos]    Script Date: 20/12/2020 01:17:32 ******/
CREATE DATABASE [trabajo final de base de datos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'trabajo final de base de datos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PRUEBAS\MSSQL\DATA\trabajo final de base de datos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'trabajo final de base de datos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PRUEBAS\MSSQL\DATA\trabajo final de base de datos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [trabajo final de base de datos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [trabajo final de base de datos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [trabajo final de base de datos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET ARITHABORT OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [trabajo final de base de datos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [trabajo final de base de datos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [trabajo final de base de datos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [trabajo final de base de datos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET RECOVERY FULL 
GO
ALTER DATABASE [trabajo final de base de datos] SET  MULTI_USER 
GO
ALTER DATABASE [trabajo final de base de datos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [trabajo final de base de datos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [trabajo final de base de datos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [trabajo final de base de datos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [trabajo final de base de datos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'trabajo final de base de datos', N'ON'
GO
ALTER DATABASE [trabajo final de base de datos] SET QUERY_STORE = OFF
GO
USE [trabajo final de base de datos]
GO
/****** Object:  Table [dbo].[autor]    Script Date: 20/12/2020 01:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autor](
	[id_autor] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[twitter] [varchar](50) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[dirpostal] [varchar](200) NULL,
	[Telefono] [varchar](200) NULL,
 CONSTRAINT [PK_autor] PRIMARY KEY CLUSTERED 
(
	[id_autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comentario]    Script Date: 20/12/2020 01:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comentario](
	[id_comentario] [int] NOT NULL,
	[id_noticias] [int] NOT NULL,
	[id_autor] [int] NOT NULL,
	[comentario] [varchar](400) NOT NULL,
	[fechacom] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[noticias]    Script Date: 20/12/2020 01:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noticias](
	[id_noticias] [int] NOT NULL,
	[id_autor] [int] NOT NULL,
	[titulo] [varchar](200) NOT NULL,
	[cuerpo] [varchar](2000) NOT NULL,
	[fechapub] [datetime] NOT NULL,
 CONSTRAINT [PK_noticias] PRIMARY KEY CLUSTERED 
(
	[id_noticias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tagss]    Script Date: 20/12/2020 01:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tagss](
	[id_tag] [int] NOT NULL,
	[id_noticias] [int] NOT NULL,
	[fecha_public] [datetime] NOT NULL,
	[id_autor] [int] NOT NULL,
 CONSTRAINT [PK_tagss] PRIMARY KEY CLUSTERED 
(
	[id_tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[autor] ([id_autor], [nombre], [apellido], [twitter], [usuario], [descripcion], [dirpostal], [Telefono]) VALUES (1, N'juan', N'escobar', N'juanQ_1132@hotmail.com', N'Juanes', N'futbolista', N'00552', N'956554814')
GO
INSERT [dbo].[autor] ([id_autor], [nombre], [apellido], [twitter], [usuario], [descripcion], [dirpostal], [Telefono]) VALUES (2, N'sergio', N'manrique', N'sergiom_1423@hotmail.com', N'SerM_1', N'amante de musica', N'1225', N'958485214')
GO
INSERT [dbo].[autor] ([id_autor], [nombre], [apellido], [twitter], [usuario], [descripcion], [dirpostal], [Telefono]) VALUES (3, N'luis', N'ortiz', N'luisO_12@hotmail.com', N'Lucho', N'profesor de ingles', N'55', N'965825845')
GO
INSERT [dbo].[autor] ([id_autor], [nombre], [apellido], [twitter], [usuario], [descripcion], [dirpostal], [Telefono]) VALUES (4, N'manuel', N'cespedes', N'manuelC_14@hotmail.com', N'Manu', N'jugador professional', NULL, N'956852485')
GO
INSERT [dbo].[autor] ([id_autor], [nombre], [apellido], [twitter], [usuario], [descripcion], [dirpostal], [Telefono]) VALUES (5, N'ana', N'cardenas', N'anicar4@hotmail.com', N'Anichan', N'poeta', N'5712', N'956847568')
GO
INSERT [dbo].[autor] ([id_autor], [nombre], [apellido], [twitter], [usuario], [descripcion], [dirpostal], [Telefono]) VALUES (6, N'diana', N'lopez', N'dianaalo_332@hotmail.com', N'DianaL', N'periodista', N'00554', N'2545457')
GO
INSERT [dbo].[autor] ([id_autor], [nombre], [apellido], [twitter], [usuario], [descripcion], [dirpostal], [Telefono]) VALUES (7, N'neymar', N'ronaldo', N'neyronaldo_234@hotmail.com', N'neymarJR', N'futbolista professional', N'000558', NULL)
GO
INSERT [dbo].[autor] ([id_autor], [nombre], [apellido], [twitter], [usuario], [descripcion], [dirpostal], [Telefono]) VALUES (8, N'marco', N'zuckerberg', N'zuckerbergM_343@hotmail.com', N'MarkZ', N'programador', N'000752', NULL)
GO
INSERT [dbo].[autor] ([id_autor], [nombre], [apellido], [twitter], [usuario], [descripcion], [dirpostal], [Telefono]) VALUES (9, N'Elian', N'mercedes', N'EMusk3_2@hotmail.com', N'Elian_m', N'emprendedor', NULL, N'01587445')
GO
INSERT [dbo].[autor] ([id_autor], [nombre], [apellido], [twitter], [usuario], [descripcion], [dirpostal], [Telefono]) VALUES (10, N'mauricio', N'chura', N'mauricJ_23@hotmail.com', N'Eisenberg', N'actor', N'005745', N'15524862')
GO
INSERT [dbo].[comentario] ([id_comentario], [id_noticias], [id_autor], [comentario], [fechacom]) VALUES (1, 1, 2, N'Este año 2020 fue algo sorprendente ya que nunca pensamos que iba a suceder esto. ', CAST(N'2020-12-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[comentario] ([id_comentario], [id_noticias], [id_autor], [comentario], [fechacom]) VALUES (2, 10, 4, N'No se porque me da que este virus ha surgido de forma natural, o no natural, para adecuar la población humana a niveles "sostenibles" y para ello es necesario que no haya "dependientes" de ningún tipo, ni por edad, ni por enfermedad.', CAST(N'2020-10-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[comentario] ([id_comentario], [id_noticias], [id_autor], [comentario], [fechacom]) VALUES (3, 6, 2, N'Todavía estamos inmersos en plena segunda ola y ya empiezan hablar de la inminencia de la tercera ola.', CAST(N'2020-12-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[comentario] ([id_comentario], [id_noticias], [id_autor], [comentario], [fechacom]) VALUES (4, 7, 5, N'Y las fiestas navideñas y de nochevieja aún están por llegar. Se supone que las cifras de contagios tampoco bajarán en el año nuevo. Las celebraciones familiares conducirán a otro repunte de contagios.', CAST(N'2020-11-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[comentario] ([id_comentario], [id_noticias], [id_autor], [comentario], [fechacom]) VALUES (5, 8, 6, N'Se han detectado rastros del virus en muestras tomadas a inicios del 2019.

Virus los hay de todo tipo en todas partes en todo momento. Este mismo virus ha podido convivir con nosotros durante muchos años, apenas siendo un resfriado comun, hasta que llego el dia en que muto a algo mas dañino como lo es ahora.
Y mutaciones las hay a diario, en la naturaleza. Algunas buenas, otras malas.', CAST(N'2020-12-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[comentario] ([id_comentario], [id_noticias], [id_autor], [comentario], [fechacom]) VALUES (6, 9, 2, N'Pronto los dictadores soviéticos impondrán más medidas tendentes a la miseria y a la ruina.', CAST(N'2020-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[comentario] ([id_comentario], [id_noticias], [id_autor], [comentario], [fechacom]) VALUES (7, 3, 5, N'Las autoridades tuvieron malas decisiones para esta pandemia', CAST(N'2020-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[noticias] ([id_noticias], [id_autor], [titulo], [cuerpo], [fechapub]) VALUES (1, 2, N'La pandemia del siglo XXI ', N'Se le dice la pandemia demka del siglo XXI porque hace un buen tiempo el mundo no había registrado una enfermedad de tal magnitud. ', CAST(N'2020-12-14T18:00:05.007' AS DateTime))
GO
INSERT [dbo].[noticias] ([id_noticias], [id_autor], [titulo], [cuerpo], [fechapub]) VALUES (2, 2, N'Origen del covid 19', N'Está enfermedad es parte del sars covid Y tuvo origen en wuhan China. ', CAST(N'2020-12-13T12:05:02.007' AS DateTime))
GO
INSERT [dbo].[noticias] ([id_noticias], [id_autor], [titulo], [cuerpo], [fechapub]) VALUES (3, 2, N'Perú es uno de los países más afectados por la covid 19 después de Brasil', N'Peru se convirtió en uno de los países más. Contagiados a nivel mundial escalando prácticamente al 2 puesto en países más contaminados de covid 19. ', CAST(N'2020-11-13T18:00:45.087' AS DateTime))
GO
INSERT [dbo].[noticias] ([id_noticias], [id_autor], [titulo], [cuerpo], [fechapub]) VALUES (4, 7, N'Latinoamerica es uno de los continentes más contaminados de covid-19', N'Brasil es uno de los países más contaminados. De la covid-19, luego está el Perú, Chile. ', CAST(N'2020-10-17T15:30:01.087' AS DateTime))
GO
INSERT [dbo].[noticias] ([id_noticias], [id_autor], [titulo], [cuerpo], [fechapub]) VALUES (5, 5, N'Histórico marcha nacional contra en el gobierno de Manuel merino de lama', N'Después de la vacancia del ex presidente Martín Viscarra, y la rápida Asunción al poder ejecutivo por parte de merino. Los peruanos no están contentos  con Merino De lama y es por eso que el día de ayer hubo una marcha en contra del nuevo presidente.', CAST(N'2020-11-25T20:35:04.090' AS DateTime))
GO
INSERT [dbo].[noticias] ([id_noticias], [id_autor], [titulo], [cuerpo], [fechapub]) VALUES (6, 5, N'La OMS alerta de "alto riesgo" de tercera ola de la pandemia en Europa', N'La región europea de la Organización Mundial de la Salud (OMS) ha avisado este miércoles de que Europa está en "alto riesgo" de sufrir una tercera ola de contagios de covid-19 en las primeras semanas y meses del 2021, por lo que ha aconsejado a la población que, de cara a las fiestas de Navidad, utilicen mascarillas en las reuniones familiares. "A pesar de algunos avances frágiles, la transmisión del covid-19 en Europa sigue siendo generalizada e intensa. Existe un alto riesgo de un nuevo resurgimiento en las primeras semanas y meses del 2021, por lo que tendremos que trabajar juntos si queremos tener éxito en prevenirlo", han señalado desde el organismo.', CAST(N'2020-10-13T15:04:55.003' AS DateTime))
GO
INSERT [dbo].[noticias] ([id_noticias], [id_autor], [titulo], [cuerpo], [fechapub]) VALUES (7, 7, N'Alemania bate el récord de muertes con 952 en las últimas 24 horas', N'Alemania registró un nuevo máximo de víctimas mortales por o con covid-19 en toda la pandemia, con 952 muertes en las últimas 24 horas, 354 más que la anterior marca diaria, contabilizada el pasado viernes. Precisamente hoy empieza un reconfinamiento parcial para frenar la propagación de la pandemia del nuevo coronavirus.

Según datos del Instituto Robert Koch (RKI) de virología, las autoridades sanitarias contabilizaron 27.728 nuevos contagios con coronavirus en un día, lo que supone alrededor de 2.000 casos menos que el máximo de 29.875 registrado también el pasado viernes.', CAST(N'2020-11-25T15:04:07.007' AS DateTime))
GO
INSERT [dbo].[noticias] ([id_noticias], [id_autor], [titulo], [cuerpo], [fechapub]) VALUES (8, 8, N'China halla coronavirus por primera vez en congelados de producción nacional', N'Las autoridades de la ciudad china de Chuzhou, en la provincia oriental de Anhui, anunciaron hoy que han hallado coronavirus en el empaquetado de carne de pollo congelada, algo que, según la prensa oficial, es la primera vez que se detecta el SARS-CoV-2 en productos de este tipo no importados, reporta EFE.

Hasta ahora, China ha informado en numerosas ocasiones de la detección de virus en el empaquetado de alimentos congelados provenientes de otros países, el último de ellos este mismo martes, cuando las autoridades de Chongqing (centro) lo hallaron en un lote de carne de vacuno importada de Argentina, del que parte ya había sido vendido en diversas partes de la municipalidad.', CAST(N'2020-12-09T12:07:45.087' AS DateTime))
GO
INSERT [dbo].[noticias] ([id_noticias], [id_autor], [titulo], [cuerpo], [fechapub]) VALUES (9, 5, N'La vuelta al cole tras las Navidades en Catalunya será el 11 de enero en lugar del día 8', N'La vuelta al cole en Catalunya tras las vacaciones de Navidad será el lunes 11 de enero en lugar del viernes 8 de enero como contemplaba el calendario del curso escolar. Así lo ha decidido el Departamento d''Educació que dirige Josep Bargalló, según han explicado los sindicatos educativos tras una reunión con la Conselleria. El motivo es la voluntad de minimizar el riesgo de contagio en los centros escolares tras las vacaciones navideñas.', CAST(N'2020-12-14T06:30:02.900' AS DateTime))
GO
INSERT [dbo].[noticias] ([id_noticias], [id_autor], [titulo], [cuerpo], [fechapub]) VALUES (10, 8, N'EEUU detecta el primer caso de coronavirus en un animal salvaje', N'De nuevo el visón en el foco de la pandemia de coronavirus. El Departamento de Agricultura de EEUU (USDA en sus siglas en inglés) ha detectado el primer caso conocido de coronavirus en un animal salvaje, un animal que es precisamente un visón. El animal, un visón americano silvestre, ha sido localizado en los alrededores de una granja de Utah. Desde el pasado agosto, el virus ha matado en EEUU a más de 15.000 visones de granja.', CAST(N'2020-10-10T07:00:01.007' AS DateTime))
GO
INSERT [dbo].[tagss] ([id_tag], [id_noticias], [fecha_public], [id_autor]) VALUES (1, 2, CAST(N'2020-12-15T12:04:01.800' AS DateTime), 4)
GO
INSERT [dbo].[tagss] ([id_tag], [id_noticias], [fecha_public], [id_autor]) VALUES (2, 4, CAST(N'2020-12-12T02:03:10.400' AS DateTime), 2)
GO
INSERT [dbo].[tagss] ([id_tag], [id_noticias], [fecha_public], [id_autor]) VALUES (3, 5, CAST(N'2020-12-26T02:40:10.200' AS DateTime), 7)
GO
INSERT [dbo].[tagss] ([id_tag], [id_noticias], [fecha_public], [id_autor]) VALUES (4, 10, CAST(N'2020-11-11T20:20:10.500' AS DateTime), 5)
GO
ALTER TABLE [dbo].[comentario]  WITH CHECK ADD  CONSTRAINT [FK_comentario_autor1] FOREIGN KEY([id_autor])
REFERENCES [dbo].[autor] ([id_autor])
GO
ALTER TABLE [dbo].[comentario] CHECK CONSTRAINT [FK_comentario_autor1]
GO
ALTER TABLE [dbo].[comentario]  WITH CHECK ADD  CONSTRAINT [FK_comentario_noticias] FOREIGN KEY([id_noticias])
REFERENCES [dbo].[noticias] ([id_noticias])
GO
ALTER TABLE [dbo].[comentario] CHECK CONSTRAINT [FK_comentario_noticias]
GO
ALTER TABLE [dbo].[noticias]  WITH CHECK ADD  CONSTRAINT [FK_noticias_autor] FOREIGN KEY([id_autor])
REFERENCES [dbo].[autor] ([id_autor])
GO
ALTER TABLE [dbo].[noticias] CHECK CONSTRAINT [FK_noticias_autor]
GO
ALTER TABLE [dbo].[tagss]  WITH CHECK ADD  CONSTRAINT [FK_tagss_noticias] FOREIGN KEY([id_noticias])
REFERENCES [dbo].[noticias] ([id_noticias])
GO
ALTER TABLE [dbo].[tagss] CHECK CONSTRAINT [FK_tagss_noticias]
GO
USE [master]
GO
ALTER DATABASE [trabajo final de base de datos] SET  READ_WRITE 
GO
