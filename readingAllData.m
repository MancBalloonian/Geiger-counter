function[timestamp, lat, long, altitude, verticalSpeed, speed, heading, sat, temp, battery, current] = readingAllData(filename)
    %{
    function reads the file and extracts useful arrays
    @param filename :: the name of the input file with steppar vals
    
    @returns x  :: r_in values in units of r_g
    @returns y1 :: chi-square value for each r_in
    @returns y2 :: relative chi-square value for each r_in
                   (used for minima identification)
    %}
    gData = fopen(filename, 'r');          
        if exist(filename, 'file');
            Data = textscan(gData, '%s %f %f %f %s %f %f %f %f %f %f', 'HeaderLines',1,'Delimiter',',');
            fclose(gData);
        else                                    % else print error message
            fprintf('The file %s could not be opened.\n', filename);
        end
        
        
    timestamp  = Data{1};
    lat = Data{2};
    long = Data{3};
    altitude = Data{4};
    verticalSpeed = Data{5};
    speed = Data{6};
    heading = Data{7};
    sat = Data{8};
    temp = Data{9};
    battery = Data{10};
    current = Data{11};
end
    
    
   