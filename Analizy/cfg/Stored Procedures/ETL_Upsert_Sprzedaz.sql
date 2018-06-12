-- =============================================
-- Author:		Maciej Helt
-- Create date: 2017-03-16
-- Description:	Dane o sprzedaży do raportów sprzedaży i rozliczeń PH
-- =============================================

CREATE PROCEDURE [cfg].[ETL_Upsert_Sprzedaz]
(
  @dataOd DATE,
  @dataDo DATE
)
AS
BEGIN
  SELECT
     [e].[TrE_DataOpe] AS [Data_dok],
     [k].[Knt_Kod],
     [e].[TrE_WartoscNetto] AS [Wartosc_Netto],
     SUBSTRING(RIGHT([TrN_NumerPelny], 5), CHARINDEX('/', RIGHT([TrN_NumerPelny], 5))+1, 4) AS [Seria],
     [e].[TrE_Ilosc] AS [Twr_Ilosc],
     [n].[TrN_NumerPelny] AS [Numer_Pelny],
     [e].[TrE_WartoscBrutto] AS [Wartosc_Brutto],
     [n].[TrN_TypDokumentu],
     [e].[TrE_Aktywny],
     [n].[TrN_Termin],
     [t].[Twr_TwrId]
  FROM [CDN_Optima].[CDN].[TraElem] AS [e] WITH (NOLOCK)
       INNER JOIN [CDN_Optima].[CDN].[TraNag] AS [n] WITH (NOLOCK) ON [e].[TrE_TrNId] = [n].[TrN_TrNID]
       INNER JOIN [CDN_Optima].[CDN].[Towary] AS [t] ON [e].[TrE_TwrId] = [t].[Twr_TwrID]
       INNER JOIN [CDN_Optima].[CDN].[Kontrahenci] AS [k] ON [e].[TrE_PodID] = [k].[Knt_KntId]
  WHERE [n].[TrN_TypDokumentu] IN(302, 305)
       AND [e].[TrE_Aktywny] != 0
       AND [e].[TrE_DataOpe] BETWEEN @dataOd AND @dataDo;
END;
