SELECT
    IoTHub.ConnectionDeviceId AS DeviceId,
    AVG(surface-temperature) AS AvgSurfaceTemp,
    MIN(surface-temperature) AS MinSurfaceTemp,
    MAX(surface-temperature) AS MaxSurfaceTemp,
    AVG(externalTemperature) AS AvgExternalTemp,
    MAX(snow-accumulation) AS MaxSnowAccumulation,
    AVG(ice-thickness) AS AvgIceThickness,
    MIN(ice-thickness) AS MinIceThickness,
    MAX(ice-thickness) AS MaxIceThickness,
    System.Timestamp AS EventTime
INTO
    [output]
FROM
    [input]
GROUP BY
    IoTHub.ConnectionDeviceId, TumblingWindow(second, 300)