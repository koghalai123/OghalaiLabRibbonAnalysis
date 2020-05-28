function [scaledData, data] = fm_inputAndThreshold(dataFile, threshold)
data_load_start = tic;
    data = bfopen(dataFile);
disp(['Data loading time(s): ' num2str(toc(data_load_start))]);
find_max_start = tic;
    series = data{1, 1};  % store it in a variable since it is used multiple times
    plane_count = size(series, 1);  % store it in a variable since it is used multiple times
    series_planes = series(:, 1);  % new variable to hold the planes
    %{
    % For finding min/max of the dataset, instead of this:
    currentMax = zeros(plane_count, 1);
    currentMin = zeros(plane_count,1);
    for y = 1:plane_count
        currentMax(y) = max(max(double(data{1,1}{y,1})));  % why you were using double?
        currentMin(y) = min(min(double(data{1,1}{y,1})));
    end
    totalMax = max(currentMax);
    totalMin = min(currentMin);
    %}
    % let's try this
    totalMin = double(min(cellfun(@(x) min(x(:)), series_planes)));
    totalMax = max(cellfun(@(x) max(x(:)), series_planes));
disp(['Find maximums time(s): ' num2str(toc(find_max_start))]);
prep_structs_start = tic;
    %noThreshold=struct([]);
    %scaledData = struct([]);
    scaledData = repmat(struct( 'newData', zeros(size(series_planes{1}))), 1, plane_count);  % pre-allocation
    %newData=struct([]);
disp(['Prepare structures time(s): ' num2str(toc(prep_structs_start))]);
    dyn_range = double(totalMax-totalMin);
    sizeC = data{1, 4}.getPixelsSizeC(0).getValue();
norm_and_threshold_start = tic;
    for b = 1:sizeC
        for i = b:sizeC:plane_count
            scaledData(i).newData = (double(series_planes{i}) - totalMin) / (dyn_range);
            scaledData(i).newData(scaledData(i).newData < threshold(b)) = 0;
            %newData(i).newData = (data{1,1}{i,1} - totalMin) / (dyn_range);
            %scaledData(i).newData = double(noThreshold(i).newData>threshold(b)) .* noThreshold(i).newData;
        end
%         maxes=zeros(284,1);
%         for h = 1:284
%             maxes(h,1)=max(max(scaledData(h).newData));
%         end
    end
norm_and_threshold_elapsed = toc(norm_and_threshold_start);
disp(['Normalization & Threshold time per step(s): ' num2str(norm_and_threshold_elapsed/length(data{1,1}))]);
disp(['Total Normalization & Threshold time(s): ' num2str(norm_and_threshold_elapsed)]);
end