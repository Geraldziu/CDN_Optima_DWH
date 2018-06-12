CREATE TABLE [dwh].[Sprzedaz] (
    [Spr_TwrId]               INT             NOT NULL,
    [Spr_KntId]               INT             NOT NULL,
    [Spr_HanId]               INT             NOT NULL,
    [Spr_DataDok]             INT             NOT NULL,
    [Spr_Ilosc]               DECIMAL (18, 4) NOT NULL,
    [Spr_Wartosc]             MONEY           NOT NULL,
    [Spr_SeriaDok]            VARCHAR (5)     NOT NULL,
    [Spr_CenaSprzedazy]       MONEY           NOT NULL,
    [Spr_CenaZakupu]          MONEY           NOT NULL,
    [Spr_WartoscZakupu]       MONEY           NOT NULL,
    [Spr_WartoscBrutto]       MONEY           NOT NULL,
    [Spr_WartoscZakupuBrutto] MONEY           NOT NULL,
    [Spr_DataDokDT]           DATETIME2 (7)   NOT NULL
);


GO
CREATE CLUSTERED INDEX [CIX_Sprzedaz_DataDok]
    ON [dwh].[Sprzedaz]([Spr_DataDok] ASC);

