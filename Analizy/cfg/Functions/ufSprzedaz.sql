
-- =============================================
-- Author:		Maciej Helt
-- Create date: 2017-03-16
-- Description:	Dane o sprzedaży do raportów sprzedaży i rozliczeń PH
-- =============================================
CREATE FUNCTION [cfg].[ufSprzedaz]
    (
      @dataOd DATE ,
      @dataDo DATE ,
      @grupaProduku NVARCHAR(20) = NULL ,
      @czyPodgrupy BIT = 'True'
    )
RETURNS TABLE
AS
RETURN
    ( SELECT    MONTH(e.TrE_DataOpe) AS Miesiac ,
                YEAR(e.TrE_DataOpe) AS Rok ,
                e.TrE_DataOpe AS Data_dok ,
                k.Knt_Kod ,
                e.TrE_WartoscNetto AS Wartosc_Netto ,
                SUBSTRING(RIGHT(TrN_NumerPelny, 5),
                          CHARINDEX('/', RIGHT(TrN_NumerPelny, 5)) + 1, 4) AS Seria ,
                e.TrE_Ilosc AS Twr_Ilosc ,
                n.TrN_NumerPelny AS Numer_Pelny ,
                k.Knt_Grupa ,
                e.TrE_WartoscBrutto AS Wartosc_Brutto ,
                n.TrN_OpeZalID ,
                n.TrN_TypDokumentu ,
                e.TrE_Aktywny ,
                n.TrN_Termin
      FROM      CDN_Optima.CDN.TraElem AS e WITH ( NOLOCK )
                INNER JOIN CDN_Optima.CDN.TraNag AS n WITH ( NOLOCK ) ON e.TrE_TrNId = n.TrN_TrNID
                                                              AND ( TrE_TwrId IN (
                                                              SELECT
                                                              TwrID
                                                              FROM
                                                              CDN_Optima.CDN.TwrInSubTwG(( SELECT
                                                              CAST(TwG_GIDNumer AS VARCHAR)
                                                              FROM
                                                              CDN_Optima.CDN.TwrGrupy
                                                              WHERE
                                                              TwG_Kod = @grupaProduku
                                                              ), @czyPodgrupy) )
                                                              OR @grupaProduku IS NULL
                                                              )
                INNER JOIN CDN_Optima.CDN.Kontrahenci AS k ON e.TrE_PodID = k.Knt_KntId
      WHERE     n.TrN_TypDokumentu IN ( 302, 305 )
                AND e.TrE_Aktywny != 0
                AND e.TrE_DataOpe BETWEEN @dataOd AND @dataDo
    );
