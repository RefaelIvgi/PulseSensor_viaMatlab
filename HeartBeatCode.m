% Refael ivgi 02.01.2023

% connect Board by COM and Type
ArduinoBoard = arduino('COM3','uno');

%set-up graph
h = animatedline;

%Graph's title and labels
xlabel('Time(sec)');
ylabel('Beat[V]');
title('Heart-Beat Graph');
grid on;

% set start time
startTime = datetime('now');

while 1
    % Read the Analog value from the Beat Sensor
    v = readVoltage(ArduinoBoard,'A0');
    %transfer the voltage value to beat range
    analog = (v/0.0048875);
    beat = analog * 0.48828125;
    % Get current time
    t =  datetime('now') - startTime;
    addpoints(h,datenum(t),beat);
   
end


