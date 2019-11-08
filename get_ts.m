function [ ts ] = get_ts( data,num )
ts = ones(1,num);
for idx = 1:num
    flag = find((data(idx,2:end)-data(idx,1:end-1))>0);
    if ~isempty(flag)
        ts(idx) = flag(end);
    end
end
end

