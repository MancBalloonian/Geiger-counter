function[timestamp, cps, cpm, uSv_hr] = readingData(filename)
    %{
    function reads the file and extracts useful arrays from the Geiger data
    file
    @param filename :: the name of the input file with steppar vals
    
    @returns timestamp  :: time-date of the measurments
    @returns cps,cpm,uSv_hr  :: data columns
    %}
    gData = fopen(filename, 'r');          
        if exist(filename, 'file');             
            Data = textscan(gData, '%s %s %f %s %f %s %f %s','Delimiter', ',');
            fclose(gData);
        else                                    % else print error message
            fprintf('The file %s could not be opened.\n', filename);
        end
    
    timestamp  = Data{1};
    cps = Data{3};
    cpm = Data{5};
    uSv_hr = Data{7};
end
    
    
   