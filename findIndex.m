function [idx] = findIndex(data_array, stop_pt)
    idx = find(data_array > stop_pt);

    idx = idx(1);
end