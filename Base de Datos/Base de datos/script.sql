USE [master]
GO
/****** Object:  Database [bdd]    Script Date: 07/14/2013 21:36:22 ******/
CREATE DATABASE [bdd] ON  PRIMARY 
( NAME = N'bdd', FILENAME = N'C:\Archivos de programa\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\bdd.mdf' , SIZE = 526336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bdd_log', FILENAME = N'C:\Archivos de programa\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\bdd_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bdd] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdd] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [bdd] SET ANSI_NULLS OFF
GO
ALTER DATABASE [bdd] SET ANSI_PADDING OFF
GO
ALTER DATABASE [bdd] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [bdd] SET ARITHABORT OFF
GO
ALTER DATABASE [bdd] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [bdd] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [bdd] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [bdd] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [bdd] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [bdd] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [bdd] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [bdd] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [bdd] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [bdd] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [bdd] SET  DISABLE_BROKER
GO
ALTER DATABASE [bdd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [bdd] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [bdd] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [bdd] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [bdd] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [bdd] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [bdd] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [bdd] SET  READ_WRITE
GO
ALTER DATABASE [bdd] SET RECOVERY SIMPLE
GO
ALTER DATABASE [bdd] SET  MULTI_USER
GO
ALTER DATABASE [bdd] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [bdd] SET DB_CHAINING OFF
GO
USE [bdd]
GO
/****** Object:  Table [dbo].[venta_producto]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta_producto](
	[id_venta_producto] [bigint] IDENTITY(1,1) NOT NULL,
	[id_venta] [bigint] NULL,
	[id_producto] [bigint] NULL,
	[precio] [money] NULL,
	[cantidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[id_venta] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[id_cliente] [bigint] NULL,
	[total] [money] NULL,
	[impreso] [int] NULL,
	[venta_numero] [nvarchar](200) NULL,
	[factura_numero] [nvarchar](200) NULL,
	[tipo] [nvarchar](50) NULL,
	[estado] [nvarchar](50) NULL,
	[descuento] [money] NULL,
	[id_fdp_1] [int] NULL,
	[id_fdp_2] [int] NULL,
	[id_fdp_3] [int] NULL,
	[id_fdp_4] [int] NULL,
	[fdp1_monto] [money] NULL,
	[fdp2_monto] [money] NULL,
	[fdp3_monto] [money] NULL,
	[fdp4_monto] [money] NULL,
	[iva] [money] NULL,
	[observaciones] [nvarchar](500) NULL,
	[en_pesos] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[usuario] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
	[categoria] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[id_proveedor] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[ciudad] [nvarchar](50) NULL,
	[id_pais] [bigint] NULL,
	[comentario] [nvarchar](50) NULL,
	[telefono] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id_producto] [bigint] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](50) NULL,
	[detalle] [nvarchar](455) NULL,
	[stock] [int] NULL,
	[stock_min] [int] NULL,
	[id_categoria] [bigint] NULL,
	[precio_unidad] [money] NULL,
	[iva] [decimal](18, 0) NULL,
	[margen] [decimal](18, 0) NULL,
	[total] [money] NULL,
	[imagen] [nvarchar](455) NULL,
	[imagen_categoria] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[id_pais] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forma_de_pago]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forma_de_pago](
	[id_fdp] [int] NULL,
	[nombre] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id_factura] [bigint] IDENTITY(1,1) NOT NULL,
	[id_venta] [bigint] NULL,
	[factura_numero] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[config]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[config](
	[real] [money] NULL,
	[id_config] [int] NOT NULL,
	[iva] [money] NULL,
	[fecha_x] [int] NULL,
	[fecha_y] [int] NULL,
	[rut_x] [int] NULL,
	[rut_y] [int] NULL,
	[c_final_x] [int] NULL,
	[c_final_y] [int] NULL,
	[datos_x] [int] NULL,
	[datos_y] [int] NULL,
	[datos_yy] [int] NULL,
	[xx] [int] NULL,
	[yy] [int] NULL,
	[cantidad_x] [int] NULL,
	[detalle_x] [int] NULL,
	[precio_x] [int] NULL,
	[importe_x] [int] NULL,
	[subtotal_x] [int] NULL,
	[subtotal_y] [int] NULL,
	[iva_x] [int] NULL,
	[iva_y] [int] NULL,
	[total_x] [int] NULL,
	[total_y] [int] NULL,
	[fuente] [text] NULL,
	[tamano] [int] NULL,
	[items_max] [int] NULL,
	[venta_prefijo_dato] [nvarchar](50) NULL,
	[venta_numero_dato] [bigint] NULL,
	[venta_numero_x] [int] NULL,
	[venta_numero_y] [int] NULL,
	[factura_prefijo_dato] [nvarchar](50) NULL,
	[factura_numero_dato] [bigint] NULL,
	[factura_numero_x] [int] NULL,
	[factura_numero_y] [int] NULL,
	[factura_numero_imprime] [bit] NULL,
	[observaciones_imprime] [bit] NULL,
	[tipo_imprime] [bit] NULL,
	[observaciones_x] [int] NULL,
	[observaciones_y] [int] NULL,
	[tipo_x] [int] NULL,
	[tipo_y] [int] NULL,
	[duplica_en_hoja] [bit] NULL,
	[duplica_en_hoja_distancia] [int] NULL,
	[comercio_nombre] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra_producto]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra_producto](
	[id_compra_producto] [bigint] IDENTITY(1,1) NOT NULL,
	[id_compra] [bigint] NULL,
	[id_producto] [bigint] NULL,
	[cantidad] [int] NULL,
	[precio] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[id_compra] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[fecha_factura] [date] NULL,
	[fecha_vencimiento] [date] NULL,
	[tipo] [nvarchar](50) NULL,
	[id_proveedor] [bigint] NULL,
	[numero_factura] [nvarchar](50) NULL,
	[importe] [money] NULL,
	[estado] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[documento] [nvarchar](50) NULL,
	[telefono] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[ciudad] [nvarchar](50) NULL,
	[id_pais] [bigint] NULL,
	[email] [nvarchar](50) NULL,
	[rut] [nvarchar](50) NULL,
	[nacimiento] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[imagen] [nvarchar](455) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caja]    Script Date: 07/14/2013 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caja](
	[id_caja] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[monto] [money] NULL
) ON [PRIMARY]
GO
