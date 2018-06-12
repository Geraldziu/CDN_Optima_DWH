




CREATE VIEW [cfg].[V_PlanSprzedazy_upd]
AS
    SELECT TOP ( 1000 )
            Pla_ID ,
            Pla_Seria AS [Seria dokumentów] ,
            UPPER(LEFT(FORMAT(Pla_DataOd, 'MMMM', 'pl-PL'), 1))
            + LOWER(SUBSTRING(FORMAT(Pla_DataOd, 'MMMM', 'pl-PL'), 2,
                              LEN(FORMAT(Pla_DataOd, 'MMMM', 'pl-PL')))) [Miesiąc] ,
            Pla_WartoscNetto AS [Wartość planu] ,
            Pla_GrupaProdukow AS [Kod grupy produktów]
    FROM    dwh.PlanSprzedazy
    WHERE   Pla_DataOd BETWEEN DATEADD(MONTH, -2, GETDATE())
                       AND     DATEADD(MONTH, 1, GETDATE())
    ORDER BY Pla_DataOd ,
            Pla_Seria ,
            Pla_GrupaProdukow;


