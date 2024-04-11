USE [master]
GO
/****** Object:  Database [FoodieDB]    Script Date: 2/5/2024 12:01:56 AM ******/
CREATE DATABASE [FoodieDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodieDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FoodieDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FoodieDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FoodieDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FoodieDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodieDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodieDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodieDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodieDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodieDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodieDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodieDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FoodieDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodieDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodieDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodieDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodieDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodieDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodieDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodieDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodieDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FoodieDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodieDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodieDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodieDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodieDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodieDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodieDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodieDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FoodieDB] SET  MULTI_USER 
GO
ALTER DATABASE [FoodieDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodieDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodieDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodieDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FoodieDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FoodieDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FoodieDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FoodieDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FoodieDB]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 2/5/2024 12:01:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ImageUrl] [varchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Subject] [varchar](200) NULL,
	[Message] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMst]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMst](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[PName] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[Qnt] [int] NULL,
	[TotalPrice] [float] NULL,
	[Image] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[Edate] [datetime] NULL,
 CONSTRAINT [PK_OrderMst] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](50) NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NULL,
	[Status] [varchar](50) NULL,
	[PaymentId] [int] NULL,
	[OrderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CardNo] [varchar](50) NULL,
	[ExpiryDate] [date] NULL,
	[CvvNo] [int] NULL,
	[Address] [varchar](max) NULL,
	[PaymentMode] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMst]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMst](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[BankName] [nvarchar](50) NULL,
	[CardNo] [nvarchar](50) NULL,
	[CCV] [int] NULL,
	[Amount] [float] NULL,
	[Edate] [datetime] NULL,
 CONSTRAINT [PK_PaymentMst] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMst]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMst](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [nvarchar](50) NULL,
	[Detail] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[Image] [nvarchar](500) NULL,
	[Cname] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[EDate] [datetime] NULL,
 CONSTRAINT [PK_ProductMst] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[ImageUrl] [varchar](max) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMst]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMst](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](50) NULL,
	[Lname] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Pincode] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Edate] [datetime] NULL,
 CONSTRAINT [PK_UserMst] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[PostCode] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[ImageUrl] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payment]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([categoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
/****** Object:  StoredProcedure [dbo].[Cart_Crud]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[Cart_Crud]
@Action VARCHAR(10),
@ProductId INT = NULL,
@Quantity INT = NULL,
@UserId INT = NULL
AS
BEGIN
SET NOCOUNT ON;
		--SELECT
		IF @Action = 'SELECT'
		BEGIN
		SELECT c.ProductId, p.Name, p.ImageUrl,p.Price, c.Quantity, c.Quantity AS Qty,p.Quantity AS PrdQty 
		FROM dbo.Carts c
		INNER JOIN dbo.Products p ON p.ProductId = c.ProductId
		WHERE c.UserId = @UserId
		END
		--INSERT
		IF @Action='INSERT'
		BEGIN
		INSERT INTO dbo.Carts (ProductId, Quantity, UserId)
		VALUES (@ProductId, @Quantity, @UserId)
		END

		
--UPDATE
IF @Action='UPDATE'
BEGIN
UPDATE dbo.Carts
SET Quantity = @Quantity
WHERE ProductId = @ProductId AND UserId = @UserId
END
--DELETE
IF @Action='DELETE'
BEGIN
DELETE FROM dbo.Carts
WHERE ProductId = @ProductId AND UserId = @UserId
END
--GET BY ID (PRODUCTID & USERID)
IF @Action = 'GETBYID'
BEGIN
SELECT * FROM dbo.Carts
WHERE ProductId = @ProductId AND UserId = @UserId
END
END
GO
/****** Object:  StoredProcedure [dbo].[Category_Crud]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Category_Crud]
	-- Add the parameters for the stored procedure here
	@Action VARCHAR(10),
	@CategoryId INT = NULL,
	@Name VARCHAR(100) = NULL,
	@IsActive BIT = false,
	@ImageUrl VARCHAR(MAX) = NULL
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--SELECT
	IF @Action = 'SELECT'
	BEGIN 
		SELECT * FROM dbo.Categories ORDER BY CreatedDate DESC
	END

	--Active Cartegory
	IF @Action = 'ACTIVECAT'
	BEGIN 
		SELECT * FROM dbo.Categories WHERE IsActive = 1
	END

    --INSERT
	IF @Action = 'INSERT'
	BEGIN 
		INSERT INTO dbo.Categories(Name, ImageUrl, IsActive,CreatedDate)
		VALUES (@Name, @ImageUrl, @IsActive , GETDATE())
	END

	--UPDATE
	IF @Action = 'UPDATE'
	BEGIN 
		DECLARE @UPDATE_IMAGE VARCHAR(20)
		SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl Is NULL THEN 'NO' ELSE 'YES' END)
		IF @UPDATE_IMAGE = 'NO'
			BEGIN 
				UPDATE dbo.Categories
				SET Name = @Name, IsActive = @IsActive
				WHERE categoryId = @CategoryId
			END
		ELSE
			BEGIN 
				UPDATE dbo.Categories
				SET Name = @Name, ImageUrl = @ImageUrl, IsActive= @IsActive
				WHERE categoryId = @CategoryId
			END
	END

	--DELETE
	IF @Action = 'DELETE'
		BEGIN
			DELETE FROM dbo.Categories WHERE categoryId = @CategoryId
		END

	--GETBYID
	IF @Action = 'GETBYID'
		BEGIN
			SELECT * FROM dbo.Categories WHERE categoryId = @CategoryId
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Product_Crud]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Product_Crud]
	@Action VARCHAR(20),
	@Productid INT = NULL,
	@Name VARCHAR(100) = NULL,
	@Description VARCHAR(MAX) = NULL,
	@Price DECIMAL(18, 2) = 0,
	@Quantity INT = NULL,
	@ImageUrl VARCHAR(MAX) = NULL,
	@CategoryId INT = NULL,
	@IsActive BIT= false
AS
BEGIN
	SET NOCOUNT ON;
		--SELECT
			IF @Action = 'SELECT'
				BEGIN
						SELECT p.*, c.Name AS CategoryName FROM dbo.Products p
						INNER JOIN dbo.Categories c ON c.CategoryId = p.CategoryId 
						WHERE p.IsActive = 1
				END


				--SELECT
			IF @Action = 'ACTIVEPROD'
				BEGIN
						SELECT p.*, c.Name AS CategoryName FROM dbo.Products p
						INNER JOIN dbo.Categories c ON c.CategoryId = p.categoryId ORDER BY p.CreatedDate DESC
				END


				--INSERT
			IF @Action = 'INSERT'
				BEGIN
						INSERT INTO dbo.Products(Name, Description, Price, Quantity, ImageUrl, CategoryId, IsActive, CreatedDate) 
						VALUES (@Name, @Description, @Price, @Quantity, @ImageUrl, @CategoryId, @IsActive, GETDATE())
				END

		--UPDATE
			IF @Action='UPDATE'
				BEGIN
					DECLARE @UPDATE_IMAGE VARCHAR(20)
					SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
					IF @UPDATE_IMAGE='NO'
						UPDATE dbo.Products
						SET Name = @Name, Description= @Description, Price = @Price, Quantity = @Quantity, CategoryId = @CategoryId, IsActive = @IsActive
						WHERE ProductId = @ProductId
				END
			ELSE
				BEGIN
						UPDATE dbo.Products
						SET Name = @Name, Description= @Description, Price = @Price, Quantity = @Quantity,
						ImageUrl = @ImageUrl, CategoryId= @CategoryId, IsActive = @IsActive
						WHERE ProductId = @ProductId
				END
			END
		--UPDATE QUANTITY
			IF @Action = 'QTYUPDATE'
				BEGIN
					UPDATE dbo.Products SET Quantity = @Quantity
					WHERE ProductId = @ProductId
				END

		--DELETE
			IF @Action = 'DELETE'
			BEGIN
				DELETE FROM dbo.Products WHERE ProductId = @Productid
			END

		--GETBYID
			IF @Action = 'GETBYID'
			BEGIN
				SELECT  * FROM dbo.Products WHERE ProductId = @Productid
			END


GO
/****** Object:  StoredProcedure [dbo].[User_Crud]    Script Date: 2/5/2024 12:01:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Crud]
	@Action VARCHAR(20),
	@UserId INT = NULL,
	@Name varchar(50) = null,
	@Username varchar(50) = null,
	@Mobile varchar(50) = null,
	@Email varchar(50) = null,
	@Address varchar(max) = null,
	@PostCode varchar(50) = null,
	@Password varchar(50) = null,
	@ImageUrl varchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;

	--SELECT FOR LOGIN
	IF @Action = 'SELECT4LOGIN'
		BEGIN
			SELECT * FROM dbo.Users WHERE Username =@Username and Password = @Password
		END

	--SELECT FOR USER PROFILE
	IF @Action = 'SELECT4Profile'
	BEGIN
			SELECT * FROM dbo.Users WHERE UserId = @UserId
	END

	--Insert (REGISTRATION)
	IF @Action = 'INSERT'
	BEGIN
			Insert into dbo.Users(Name,Username,Mobile,Email,Address,PostCode,Password,ImageUrl,CreatedDate)
			values (@Name,@Username,@Mobile,@Email,@Address,@PostCode,@Password,@ImageUrl,GETDATE())
	END

	--UPDATE USER PROFILE
	IF @Action = 'UPDATE'
		BEGIN 
			DECLARE @UPDATE_IMAGE VARCHAR(20)
			SELECT @UPDATE_IMAGE = (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
			IF @UPDATE_IMAGE = 'NO'
				BEGIN
					UPDATE dbo.Users
					SET Name = @Name, Username = @Username, Mobile = @Mobile ,Email = @Email , Address = @Address,
					PostCode= @PostCode
					WHERE UserId = @UserId
				END
			ELSE
				BEGIN
					UPDATE dbo.Users
					SET Name = @Name, Username = @Username, Mobile = @Mobile ,Email = @Email , Address = @Address,
					PostCode= @PostCode, ImageUrl = @ImageUrl
					WHERE UserId = @UserId
				END
		END

		--SELECT FOR ADMIN
		IF @Action = 'SELECT4ADMIN'
			BEGIN
				SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo],UserId, Name,
				Username, Email, CreatedDate
				FROM Users
			END

		

		--DELECT FOR ADMIN
		IF @Action = 'DELETE'
			BEGIN
				DELETE FROM dbo.Users WHERE UserId= @UserId
			END
END
GO
USE [master]
GO
ALTER DATABASE [FoodieDB] SET  READ_WRITE 
GO
