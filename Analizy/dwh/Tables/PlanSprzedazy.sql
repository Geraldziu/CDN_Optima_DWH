CREATE TABLE [dwh].[PlanSprzedazy] (
    [Pla_ID]               INT           IDENTITY (1, 1) NOT NULL,
    [Pla_Seria]            VARCHAR (4)   NOT NULL,
    [Pla_DataOd]           DATE          NOT NULL,
    [Pla_DataDo]           DATE          NOT NULL,
    [Pla_WartoscNetto]     MONEY         NOT NULL,
    [Pla_GrupaProdukow]    NVARCHAR (50) NOT NULL,
    [Pla_DataWprowadzenia] DATETIME2 (7) NULL,
    [Pla_Wprowadzajacy]    NVARCHAR (50) NULL,
    [Pla_DataModyfikacji]  DATETIME2 (7) NULL,
    [Pla_Modyfikujacy]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_PlanySprzedazy] PRIMARY KEY CLUSTERED ([Pla_ID] ASC)
);

