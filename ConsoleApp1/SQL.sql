USE [HPTest]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 2020-12-20 18:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[IdRegion] [int] NOT NULL,
	[IdVendedor] [int] NOT NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaProducto]    Script Date: 2020-12-20 18:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaProducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCuenta] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Valor] [numeric](12, 2) NOT NULL,
 CONSTRAINT [PK_CuentaProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 2020-12-20 18:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoProducto] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 2020-12-20 18:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[IdTipoCuenta] [int] NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCuenta]    Script Date: 2020-12-20 18:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCuenta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoCuenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 2020-12-20 18:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 2020-12-20 18:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Region] FOREIGN KEY([IdRegion])
REFERENCES [dbo].[Region] ([Id])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Region]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Vendedor] FOREIGN KEY([IdVendedor])
REFERENCES [dbo].[Vendedor] ([Id])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Vendedor]
GO
ALTER TABLE [dbo].[CuentaProducto]  WITH CHECK ADD  CONSTRAINT [FK_CuentaProducto_Cuenta] FOREIGN KEY([IdCuenta])
REFERENCES [dbo].[Cuenta] ([Id])
GO
ALTER TABLE [dbo].[CuentaProducto] CHECK CONSTRAINT [FK_CuentaProducto_Cuenta]
GO
ALTER TABLE [dbo].[CuentaProducto]  WITH CHECK ADD  CONSTRAINT [FK_CuentaProducto_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[CuentaProducto] CHECK CONSTRAINT [FK_CuentaProducto_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_TipoProducto] FOREIGN KEY([IdTipoProducto])
REFERENCES [dbo].[TipoProducto] ([Id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_TipoProducto]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_TipoCuenta] FOREIGN KEY([IdTipoCuenta])
REFERENCES [dbo].[TipoCuenta] ([Id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_TipoCuenta]
GO
/****** Object:  StoredProcedure [dbo].[ReporteVentasSemana]    Script Date: 2020-12-20 18:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReporteVentasSemana]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @INICIO AS DATETIME = DATEADD(DAY, 1, DATEADD(WEEK, -1, DATEADD(WEEK, DATEDIFF(WEEK, -1, CONVERT(DATE, GETDATE())), -1)));
	DECLARE @FINAL AS DATETIME = DATEADD(SECOND, -1, DATEADD(DAY, 7, @INICIO));

	WITH CUENTAS AS
	(
		SELECT A.Id, A.Fecha
		FROM dbo.Cuenta AS A (NOLOCK)
		INNER JOIN dbo.Region AS B (NOLOCK) ON A.IdRegion = B.Id
		WHERE B.IdTipoCuenta = 1
	)
	SELECT 
		ISNULL(SUM(IIF(C.IdTipoProducto = 1, B.Valor, 0)), 0) AS [Hadware], 
		ISNULL(SUM(IIF(C.IdTipoProducto = 2, B.Valor, 0)), 0) AS [Software]
	FROM CUENTAS AS A
	INNER JOIN dbo.CuentaProducto AS B (NOLOCK) ON A.Id = B.IdCuenta
		INNER JOIN dbo.Producto AS C (NOLOCK) ON B.IdProducto = C.Id
	WHERE A.Fecha BETWEEN @INICIO AND @FINAL;

	SELECT 
		B.Descripcion AS [Region],
		SUM(C.Valor) AS [Ventas]
	FROM dbo.Cuenta AS A (NOLOCK)
	INNER JOIN dbo.Region AS B (NOLOCK) ON A.IdRegion = B.Id
	INNER JOIN dbo.CuentaProducto AS C (NOLOCK) ON A.Id = C.IdCuenta
	WHERE A.Fecha BETWEEN @INICIO AND @FINAL
	GROUP BY B.Descripcion;
	
	SELECT 
		D.Descripcion AS [TipoProducto], 
		SUM(Valor) AS [Ventas]
	FROM dbo.Cuenta AS A (NOLOCK)
	INNER JOIN dbo.CuentaProducto AS B (NOLOCK) ON A.Id = B.IdCuenta
		INNER JOIN dbo.Producto AS C (NOLOCK) ON B.IdProducto = C.Id
			INNER JOIN dbo.TipoProducto AS D (NOLOCK) ON C.IdTipoProducto = D.Id
	WHERE A.Fecha BETWEEN @INICIO AND @FINAL
	GROUP BY D.Descripcion;

END
GO
