% function value = currentSoilState( x )
%
% Function   : currentSoilState
%
% Purpose    : 
%
% Parameters : 
%
% Return     :
%
% Calibration data:
%  
% Not immersed in water:    ___________ v
%
% Immersed in dry soil:     ___________ v
%
% Immersed in water-saturated soil:    ___________ v
%
% Immersed in water:    ___________ v
%
% Examples of Usage:
%
%    >> state = currentSoilState( a )
% state =
%
%     "dry soil"
%

function state = currentSoilState( a )
    % write your code here!
    % Measure voltage from soil sensor (connected to analog pin A1)
    voltage = readVoltage(a, 'A1');
    %Define threshold voltages for different moisture levels
    dry_air_voltage = 3.5; % voltage when sensor is in dry air
    dry_soil_voltage = 3.3; % voltage when soil is very dry
    wet_soil_voltage = 2.8; % voltage when soil is moist;
    water_voltage = 2.6; % voltage when sensor is fully submerged
    % Determine soil state based on measured voltage
    if voltage >= (dry_air_voltage + dry_soil_voltage)/2
    state = "dry_air_voltage"; % Extremely dry conditions
    elseif voltage >= (dry_soil_voltage + wet_soil_voltage)/2 && voltage < (dry_air_voltage + dry_soil_voltage)/2
    state = "dry_soil_voltage";
    elseif voltage >= (wet_soil_voltage + water_voltage)/2 && voltage < (dry_air_voltage + wet_soil_voltage)/2
    state = "wet_soil_voltage";
    else state = "water_voltage"; % soil is saturated or submered
    end
    end
end
