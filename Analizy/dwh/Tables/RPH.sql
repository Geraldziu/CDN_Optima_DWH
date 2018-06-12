CREATE TABLE [dwh].[RPH] (
    [Han_HanId]  INT            IDENTITY (1, 1) NOT NULL,
    [Han_Seria]  NVARCHAR (50)  NOT NULL,
    [Han_DataOd] DATE           NOT NULL,
    [Han_DataDo] DATE           NOT NULL,
    [Han_Nazwa]  NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_RPH] PRIMARY KEY CLUSTERED ([Han_HanId] ASC)
);

