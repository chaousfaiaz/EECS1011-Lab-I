% function pumpWater( x )
%
% Function   : pumpWater
%
% Purpose    : 
%
% Parameters : 
%
% Calibration data:
%  
% Time to for water to begin flowing:    ___________ sec
%
% Time to empty 1 litre of water:     ___________ sec
%
% Examples of Usage:
%
%    >> pumpWater(a, litres)
%

function pumpWater(a, litres)
    % write your code here!
    % Measured calibration values 
    flow_start_time = .55; %time for water to start flowing
    time_per_litres = 23.6; % Time to pump 1 litre of water in s
    % Calculate total pumping time
    total_pump_time = flow_start_time+(litres*time_per_litres);
    % Turn on pump 
    writeDigitalPin(a, 'D2', 1);
    pause(total_pump_time); % wait for the calculated time
    % Turn off pump
    writeDigitalPin(a, 'D2', 0);
    % Display the pumping details
    fprintf('pumped %.2f litres of water in %.2f seconds\n', litres, total_pump_time);
    end
end
