USE [Insurance]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/20/2022 6:04:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Age] [int] NOT NULL,
	[DOB] [nvarchar](100) NOT NULL,
	[Occupation] [nvarchar](200) NOT NULL,
	[DeathSumInsured] [int] NOT NULL,
	[InsurancePremiumAmount] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Occupation]    Script Date: 3/20/2022 6:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occupation](
	[Occupation] [nvarchar](200) NOT NULL,
	[Rating] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Occupation] PRIMARY KEY CLUSTERED 
(
	[Occupation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OccupationRating]    Script Date: 3/20/2022 6:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OccupationRating](
	[Rating] [nvarchar](100) NOT NULL,
	[Factor] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_OccupationRating] PRIMARY KEY CLUSTERED 
(
	[Rating] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EID], [Name], [Age], [DOB], [Occupation], [DeathSumInsured], [InsurancePremiumAmount]) VALUES (1, N'Stephen', 60, N'02-08-1954', N'Farmer', 1000000, CAST(1260000.00 AS Decimal(10, 2)))
INSERT [dbo].[Employee] ([EID], [Name], [Age], [DOB], [Occupation], [DeathSumInsured], [InsurancePremiumAmount]) VALUES (2, N'Rodrick', 65, N'03-05-1954', N'Doctor', 500000, CAST(390000.00 AS Decimal(10, 2)))
INSERT [dbo].[Employee] ([EID], [Name], [Age], [DOB], [Occupation], [DeathSumInsured], [InsurancePremiumAmount]) VALUES (3, N'Adam', 62, N'03-03-1650', N'Farmer', 250000, CAST(325500.00 AS Decimal(10, 2)))
INSERT [dbo].[Employee] ([EID], [Name], [Age], [DOB], [Occupation], [DeathSumInsured], [InsurancePremiumAmount]) VALUES (4, N'ryan', 68, N'04-04-1970', N'Florist', 300000, CAST(367200.00 AS Decimal(10, 2)))
INSERT [dbo].[Employee] ([EID], [Name], [Age], [DOB], [Occupation], [DeathSumInsured], [InsurancePremiumAmount]) VALUES (5, N'maria', 63, N'05-05-1950', N'Cleaner', 100000, CAST(113400.00 AS Decimal(10, 2)))
INSERT [dbo].[Employee] ([EID], [Name], [Age], [DOB], [Occupation], [DeathSumInsured], [InsurancePremiumAmount]) VALUES (6, N'chua', 52, N'08-08-1945', N'Author', 600000, CAST(468000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[Occupation] ([Occupation], [Rating]) VALUES (N'Author', N'White Collar')
INSERT [dbo].[Occupation] ([Occupation], [Rating]) VALUES (N'Cleaner', N'Light Manual')
INSERT [dbo].[Occupation] ([Occupation], [Rating]) VALUES (N'Doctor', N'Professional')
INSERT [dbo].[Occupation] ([Occupation], [Rating]) VALUES (N'Farmer', N'Heavy Manual')
INSERT [dbo].[Occupation] ([Occupation], [Rating]) VALUES (N'Florist ', N'Light Manual')
INSERT [dbo].[Occupation] ([Occupation], [Rating]) VALUES (N'Mechanic', N'Heavy Manual')
GO
INSERT [dbo].[OccupationRating] ([Rating], [Factor]) VALUES (N'Heavy Manual', CAST(1.75 AS Decimal(4, 2)))
INSERT [dbo].[OccupationRating] ([Rating], [Factor]) VALUES (N'Light Manual', CAST(1.50 AS Decimal(4, 2)))
INSERT [dbo].[OccupationRating] ([Rating], [Factor]) VALUES (N'Professional', CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[OccupationRating] ([Rating], [Factor]) VALUES (N'White Collar', CAST(1.25 AS Decimal(4, 2)))
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Occupation] FOREIGN KEY([Occupation])
REFERENCES [dbo].[Occupation] ([Occupation])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Occupation]
GO
ALTER TABLE [dbo].[Occupation]  WITH CHECK ADD  CONSTRAINT [FK_Occupation_OccupationRating] FOREIGN KEY([Rating])
REFERENCES [dbo].[OccupationRating] ([Rating])
GO
ALTER TABLE [dbo].[Occupation] CHECK CONSTRAINT [FK_Occupation_OccupationRating]
GO
