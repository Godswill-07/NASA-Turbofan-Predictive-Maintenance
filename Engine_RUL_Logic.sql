CREATE TABLE engine_health_data (
  unit_id INT,
     cycle INT,
     Mach_Number FLOAT,
     Altitude FLOAT,
     Throttle_Angle FLOAT,
     s1 FLOAT,  s2 FLOAT, s3 FLOAT, s4 FLOAT, s5 FLOAT,
     s6 FLOAT, s7 FLOAT, s8 FLOAT, s9 FLOAT, s10 FLOAT,
     s11 FLOAT, s12 FLOAT, s13 FLOAT, s14 FLOAT, s15 FLOAT,
     s16 FLOAT, s17 FLOAT, s18 FLOAT, s19 FLOAT, s20 FLOAT, s21 FLOAT
 )
CREATE TABLE engine_health_data (
  unit_id INT,
     cycle INT,
     Mach_Number FLOAT,
     Altitude FLOAT,
     Throttle_Angle FLOAT,
     s1 FLOAT,  s2 FLOAT, s3 FLOAT, s4 FLOAT, s5 FLOAT,
     s6 FLOAT, s7 FLOAT, s8 FLOAT, s9 FLOAT, s10 FLOAT,
     s11 FLOAT, s12 FLOAT, s13 FLOAT, s14 FLOAT, s15 FLOAT,
     s16 FLOAT, s17 FLOAT, s18 FLOAT, s19 FLOAT, s20 FLOAT, s21 FLOAT
 )

CREATE TABLE engine_features_master AS
 SELECT 
     unit_id,
     cycle,
     RUL,
     Mach_Number,
     s4,
     s11,
     -- 5-Cycle Moving Average for S11 (Smoothing)
     AVG(s11) OVER(PARTITION BY unit_id ORDER BY cycle 
                   ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS s11_moving_avg,
     
     -- Delta (Change) in S4 temperature from last cycle
     (s4 - LAG(s4) OVER(PARTITION BY unit_id ORDER BY cycle)) AS s4_temp_delta,
     
     -- Cumulative Max Pressure (Peak Stress)
     MAX(s11) OVER(PARTITION BY unit_id ORDER BY cycle) AS s11_peak_stress
 FROM engine_analytics_base