-- Creamos la tabla 
--CREATE TABLE final_assetment_bookmaker (
--    periodo DATE,
--    clicks FLOAT NULL,
--    registrosIN FLOAT NULL,
--    primer_depositoIN FLOAT NULL,
--    total_depositadoIN FLOAT,
--    personas_apostaronIN FLOAT NULL,
--    total_apostado FLOAT NULL,
--    net_revenueIN FLOAT NULL
--)


--SELECT * FROM dbo.final_assetment_bookmaker

--SELECT 'periodo' AS ColumnName, COUNT(*) AS NullValues FROM dbo.final_assetment_bookmaker WHERE periodo IS NULL

--Encontramos valores duplicados
--WITH DuplicateRows AS (
--    SELECT 
--        *,
--        ROW_NUMBER() OVER (PARTITION BY 
--            periodo, 
--            clicks, 
--            registrosIN, 
--            primer_depositoIN, 
--            total_depositadoIN, 
--            personas_apostaronIN, 
--            total_apostado, 
--            net_revenueIN 
--        ORDER BY (SELECT NULL)) AS RowNum
--    FROM 
--        dbo.final_assetment_bookmaker
--)
--SELECT 
--    *
--FROM 
--    DuplicateRows
--WHERE 
--    RowNum > 1;

--Tabla que resuma cantidad de valores nulos 
--SELECT 
--    ColumnName,
--    COUNT(*) AS NullValues
--FROM 
--    (
--        SELECT 
--            CASE WHEN periodo IS NULL THEN 'periodo' ELSE NULL END AS ColumnName
--        FROM dbo.final_assetment_bookmaker
--        UNION ALL
--        SELECT 
--            CASE WHEN clicks IS NULL THEN 'clicks' ELSE NULL END
--        FROM dbo.final_assetment_bookmaker
--        UNION ALL
--        SELECT 
--            CASE WHEN registrosIN IS NULL THEN 'registrosIN' ELSE NULL END
--        FROM dbo.final_assetment_bookmaker
--        UNION ALL
--        SELECT 
--            CASE WHEN primer_depositoIN IS NULL THEN 'primer_depositoIN' ELSE NULL END
--        FROM dbo.final_assetment_bookmaker
--        UNION ALL
--        SELECT 
--            CASE WHEN total_depositadoIN IS NULL THEN 'total_depositadoIN' ELSE NULL END
--        FROM dbo.final_assetment_bookmaker
--        UNION ALL
--        SELECT 
--            CASE WHEN personas_apostaronIN IS NULL THEN 'personas_apostaronIN' ELSE NULL END
--        FROM dbo.final_assetment_bookmaker
--        UNION ALL
--        SELECT 
--            CASE WHEN total_apostado IS NULL THEN 'total_apostado' ELSE NULL END
--        FROM dbo.final_assetment_bookmaker
--        UNION ALL
--        SELECT 
--            CASE WHEN net_revenueIN IS NULL THEN 'net_revenueIN' ELSE NULL END
--        FROM dbo.final_assetment_bookmaker
--    ) AS MissingValues
--WHERE 
--    ColumnName IS NOT NULL
--GROUP BY 
--    ColumnName;

-- Tabla que resume estadisticos descriptivos de la data

--SELECT 
--    'clicks' AS ColumnName,
--    COUNT(clicks) AS CountValues,
--    AVG(CAST(clicks AS FLOAT)) AS AvgValue,
--    MIN(CAST(clicks AS FLOAT)) AS MinValue,
--    MAX(CAST(clicks AS FLOAT)) AS MaxValue,
--    STDEV(CAST(clicks AS FLOAT)) AS StdDevValue
--FROM dbo.final_assetment_bookmaker

--UNION ALL

--SELECT 
--    'registrosIN' AS ColumnName,
--    COUNT(registrosIN) AS CountValues,
--    AVG(CAST(registrosIN AS FLOAT)) AS AvgValue,
--    MIN(CAST(registrosIN AS FLOAT)) AS MinValue,
--    MAX(CAST(registrosIN AS FLOAT)) AS MaxValue,
--    STDEV(CAST(registrosIN AS FLOAT)) AS StdDevValue
--FROM dbo.final_assetment_bookmaker

--UNION ALL

--SELECT 
--    'primer_depositoIN' AS ColumnName,
--    COUNT(primer_depositoIN) AS CountValues,
--    AVG(CAST(primer_depositoIN AS FLOAT)) AS AvgValue,
--    MIN(CAST(primer_depositoIN AS FLOAT)) AS MinValue,
--    MAX(CAST(primer_depositoIN AS FLOAT)) AS MaxValue,
--    STDEV(CAST(primer_depositoIN AS FLOAT)) AS StdDevValue
--FROM dbo.final_assetment_bookmaker

--UNION ALL

--SELECT 
--    'total_depositadoIN' AS ColumnName,
--    COUNT(total_depositadoIN) AS CountValues,
--    AVG(total_depositadoIN) AS AvgValue,
--    MIN(total_depositadoIN) AS MinValue,
--    MAX(total_depositadoIN) AS MaxValue,
--    STDEV(total_depositadoIN) AS StdDevValue
--FROM dbo.final_assetment_bookmaker

--UNION ALL

--SELECT 
--    'personas_apostaronIN' AS ColumnName,
--    COUNT(personas_apostaronIN) AS CountValues,
--    AVG(CAST(personas_apostaronIN AS FLOAT)) AS AvgValue,
--    MIN(CAST(personas_apostaronIN AS FLOAT)) AS MinValue,
--    MAX(CAST(personas_apostaronIN AS FLOAT)) AS MaxValue,
--    STDEV(CAST(personas_apostaronIN AS FLOAT)) AS StdDevValue
--FROM dbo.final_assetment_bookmaker

--UNION ALL

--SELECT 
--    'total_apostado' AS ColumnName,
--    COUNT(total_apostado) AS CountValues,
--    AVG(total_apostado) AS AvgValue,
--    MIN(total_apostado) AS MinValue,
--    MAX(total_apostado) AS MaxValue,
--    STDEV(total_apostado) AS StdDevValue
--FROM dbo.final_assetment_bookmaker

--UNION ALL

--SELECT 
--    'net_revenueIN' AS ColumnName,
--    COUNT(net_revenueIN) AS CountValues,
--    AVG(net_revenueIN) AS AvgValue,
--    MIN(net_revenueIN) AS MinValue,
--    MAX(net_revenueIN) AS MaxValue,
--    STDEV(net_revenueIN) AS StdDevValue
--FROM dbo.final_assetment_bookmaker;

--SELECT * FROM dbo.final_assetment_bookmaker


-- Calculamos promedio de apuestas entre jugadores
--SELECT 
--    periodo,    
--    total_depositadoIN,
--    personas_apostaronIN,
--    total_apostado,
--    net_revenueIN,	
--    total_apostado / personas_apostaronIN AS promedio_apostado
--FROM 
--    dbo.final_assetment_bookmaker;

-- Calculamos perdidas totales de los jugadores por fecha
--SELECT 
--    periodo,
--    SUM(CASE WHEN net_revenueIN < 0 THEN net_revenueIN ELSE 0 END) AS total_perdidas_jugadores
--FROM 
--    dbo.final_assetment_bookmaker
--GROUP BY 
--    periodo;
