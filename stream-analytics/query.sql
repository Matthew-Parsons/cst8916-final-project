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
    System.Timestamp AS EventTime
INTO
    [canal-output]
FROM
    [canal-input]
GROUP BY
    IoTHub.ConnectionDeviceId, TumblingWindow(second, 300)