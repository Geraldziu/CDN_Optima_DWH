CREATE PROCEDURE [cfg].[ETL_Recreate_TowaryRozliczeniowe]
AS
BEGIN
  TRUNCATE TABLE [dwh].TowaryRozliczeniowe;
  INSERT INTO [dwh].[TowaryRozliczeniowe](
     [Twr_TwrId],
     [Twr_Kod],
     [Twr_Nazwa])
  SELECT
     [t].[Twr_TwrId],
     [t].[Twr_Kod],
     [t].[Twr_Nazwa]
  FROM [CDN_Optima].[CDN].[TwrInSubTwG]
( (
       SELECT
          CAST([tg].[TwG_GIDNumer] AS VARCHAR)
       FROM [CDN_Optima].[CDN].[TwrGrupy] AS [tg]
       WHERE [tg].[TwG_Kod] = 'Grupa główna'
  ), 1
) AS [tk]
       INNER JOIN [CDN_Optima].[CDN].[Towary] AS [t] ON [tk].[TwrId] = [t].[twr_twrid];
END;
