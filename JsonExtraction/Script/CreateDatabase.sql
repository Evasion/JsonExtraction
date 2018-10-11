

CREATE DATABASE [CompanyEmployees]
GO
USE [CompanyEmployees]
GO

CREATE TABLE [dbo].[Employee](
	[Name] [nvarchar](25) NOT NULL,
	[SSN] [nvarchar](9) NOT NULL,
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CompanyEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Manager]    Script Date: 10/11/2018 10:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Manager](
	[ManagerID] [int] NULL,
	[EmployeeID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Project]    Script Date: 10/11/2018 10:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Project](
	[EmployeeID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK_Employee_Project] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manager]    Script Date: 10/11/2018 10:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ManagerID] [int] IDENTITY(1,1) NOT NULL,
	[StaffCount] [int] NULL,
	[PromotionDate] [date] NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 10/11/2018 10:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Name] [nvarchar](25) NOT NULL,
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Name], [SSN], [EmployeeID]) VALUES (N'Mike Jones', N'698565963', 1)
INSERT [dbo].[Employee] ([Name], [SSN], [EmployeeID]) VALUES (N'Phil jackson', N'232626232', 2)
INSERT [dbo].[Employee] ([Name], [SSN], [EmployeeID]) VALUES (N'Robin Hood', N'23365626', 3)
SET IDENTITY_INSERT [dbo].[Employee] OFF
INSERT [dbo].[Employee_Manager] ([ManagerID], [EmployeeID]) VALUES (8, 1)
INSERT [dbo].[Employee_Manager] ([ManagerID], [EmployeeID]) VALUES (8, 2)
INSERT [dbo].[Employee_Project] ([EmployeeID], [ProjectID]) VALUES (1, 1)
INSERT [dbo].[Employee_Project] ([EmployeeID], [ProjectID]) VALUES (2, 1)
INSERT [dbo].[Employee_Project] ([EmployeeID], [ProjectID]) VALUES (3, 3)
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([ManagerID], [StaffCount], [PromotionDate], [EmployeeID]) VALUES (5, 5, CAST(0x2A090B00 AS Date), 1)
INSERT [dbo].[Manager] ([ManagerID], [StaffCount], [PromotionDate], [EmployeeID]) VALUES (8, 100, CAST(0x80E50A00 AS Date), 3)
SET IDENTITY_INSERT [dbo].[Manager] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Name], [ProjectID]) VALUES (N'Project1', 1)
INSERT [dbo].[Project] ([Name], [ProjectID]) VALUES (N'Project2', 2)
INSERT [dbo].[Project] ([Name], [ProjectID]) VALUES (N'Project3', 3)
INSERT [dbo].[Project] ([Name], [ProjectID]) VALUES (N'project4', 4)
SET IDENTITY_INSERT [dbo].[Project] OFF
ALTER TABLE [dbo].[Employee_Manager]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Manager_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee_Manager] CHECK CONSTRAINT [FK_Employee_Manager_Employee]
GO
ALTER TABLE [dbo].[Employee_Manager]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Manager_Manager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ManagerID])
GO
ALTER TABLE [dbo].[Employee_Manager] CHECK CONSTRAINT [FK_Employee_Manager_Manager]
GO
ALTER TABLE [dbo].[Employee_Manager]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Manager_Manager1] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ManagerID])
GO
ALTER TABLE [dbo].[Employee_Manager] CHECK CONSTRAINT [FK_Employee_Manager_Manager1]
GO
ALTER TABLE [dbo].[Employee_Project]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Project_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee_Project] CHECK CONSTRAINT [FK_Employee_Project_Employee]
GO
ALTER TABLE [dbo].[Employee_Project]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Project_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[Employee_Project] CHECK CONSTRAINT [FK_Employee_Project_Project]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Employee]
GO
USE [master]
GO
ALTER DATABASE [CompanyEmployees] SET  READ_WRITE 
GO
