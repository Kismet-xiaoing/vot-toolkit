function [image_path] = get_image(sequence, index)
% image_path Returns image path for the given sequence
%
% Input:
% - sequence: A valid sequence structure.
% - index: A index of a frame.
%
% Output:
% - image_path: An image parh for the requested frame or an empty matrix if the frame number is invalid.

if isfield(sequence, 'format')
    sequence_function = str2func(['sequence_get_image_', sequence.format]);
    image_path = sequence_function(sequence, index);
    return;
end

if (sequence.length < index || index < 1)
    image_path = [];
else
    image_path = fullfile(sequence.images_directory, sequence.images{index});
end;
 

