-- Storage Account SQL
SELECT
    IoTHub.ConnectionDeviceId AS DeviceId,
    AVG(surface_temperature) AS AvgSurfaceTemp,
    MIN(surface_temperature) AS MinSurfaceTemp,
    MAX(surface_temperature) AS MaxSurfaceTemp,
    AVG(ext_temperature) AS AvgExternalTemp,
    MAX(snow_accumulation) AS MaxSnowAccumulation,
    AVG(ice_thickness) AS AvgIceThickness,
    MIN(ice_thickness) AS MinIceThickness,
    MAX(ice_thickness) AS MaxIceThickness,
    COUNT(*) AS ReadingCount,
    CASE 
        WHEN AVG(ice_thickness) >= 30 AND AVG(surface_temperature) <= -2 THEN 'Safe'
        WHEN AVG(ice_thickness) >= 25 AND AVG(surface_temperature) <= 0 THEN 'Caution'
        ELSE 'Unsafe'
    END AS CurrentStatus,
    System.Timestamp AS EventTime

INTO
    [output]
FROM
    [input]
GROUP BY
    IoTHub.ConnectionDeviceId, TumblingWindow(second, 300)

-- CosmosDB SQL
SELECT
    input.location,
    AVG(surface_temperature) AS AvgSurfaceTemp,
    MIN(surface_temperature) AS MinSurfaceTemp,
    MAX(surface_temperature) AS MaxSurfaceTemp,
    AVG(ext_temperature) AS AvgExternalTemp,
    MAX(snow_accumulation) AS MaxSnowAccumulation,
    AVG(ice_thickness) AS AvgIceThickness,
    MIN(ice_thickness) AS MinIceThickness,
    MAX(ice_thickness) AS MaxIceThickness,
    COUNT(*) AS ReadingCount,
    CASE 
        WHEN AVG(ice_thickness) >= 30 AND AVG(surface_temperature) <= -2 THEN 'Safe'
        WHEN AVG(ice_thickness) >= 25 AND AVG(surface_temperature) <= 0 THEN 'Caution'
        ELSE 'Unsafe'
    END AS CurrentStatus,
    System.Timestamp AS windowEndTime

INTO
    [web-output]
FROM
    [input]
GROUP BY
        input.location, TumblingWindow(second, 300)