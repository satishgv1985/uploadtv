
/****** Object:  Table [dbo].[program]    Script Date: 09/11/2009 19:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[program](
	[i_program_id] [int] IDENTITY(1,1) NOT NULL,
	[vch_program_name] [nvarchar](150) NULL CONSTRAINT [DF_program_vch_program_name]  DEFAULT (''),
	[dt_modfied] [datetime] NULL CONSTRAINT [DF_program_dt_modfied]  DEFAULT (getutcdate()),
 CONSTRAINT [PK_program] PRIMARY KEY CLUSTERED 
(
	[i_program_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tv]    Script Date: 09/11/2009 19:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tv](
	[i_tv_id] [int] IDENTITY(1,1) NOT NULL,
	[vch_tv_name] [nvarchar](150) NOT NULL CONSTRAINT [DF_tv_vch_tv_name]  DEFAULT (''),
	[dt_modified] [datetime] NULL CONSTRAINT [DF_tv_dt_modified]  DEFAULT (getutcdate()),
 CONSTRAINT [PK_tv] PRIMARY KEY CLUSTERED 
(
	[i_tv_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tv_program]    Script Date: 09/11/2009 19:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tv_program](
	[i_tv_program_id] [int] IDENTITY(1,1) NOT NULL,
	[i_tv_id] [int] NOT NULL,
	[i_program_id] [int] NOT NULL,
	[dt_modified] [datetime] NULL CONSTRAINT [DF_tv_program_dt_modified]  DEFAULT (getutcdate()),
 CONSTRAINT [PK_tv_program] PRIMARY KEY CLUSTERED 
(
	[i_tv_program_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tv_files]    Script Date: 09/11/2009 19:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tv_files](
	[i_tv_files] [int] IDENTITY(1,1) NOT NULL,
	[i_tv_id] [int] NOT NULL,
	[i_program_id] [int] NOT NULL,
	[dt_tv_program_date] [datetime] NOT NULL,
	[vch_file_name] [nvarchar](150) NOT NULL,
	[dt_date_modified] [datetime] NULL CONSTRAINT [DF_tv_files_dt_date_modified]  DEFAULT (getutcdate()),
 CONSTRAINT [PK_tv_files] PRIMARY KEY CLUSTERED 
(
	[i_tv_files] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
