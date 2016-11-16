function S = arcasciiread(file)
%ARCASCIIREAD Reads in an Arc ascii file
%
% S = arcasciiread(file)
%
% This function reads in an Arc ascii formatted file, which holds a single
% raster dataset.
%
% Input variables:
%
%   file:   name of input file
%
% Output variables:
%
%   S:      structure with the following fields:
%          
%           ncols:      number of columns in grid
%
%           nrows:      number of rows in grid
%
%           eastlon:    longitude of eastern size of grid
%
%           southlat:   latitude on southern end of grid
%
%           cellsize:   length of one side of grid cell
%
%           nodata:     value used to represent missing data
%
%           data:       nrows x ncols data grid

% Copyright 2007 Kelly Kearney

fid = fopen(file);

%------------------------------
% Read header
%------------------------------

header = textscan(fid, '%s %f', 6);

S.ncols    = header{2}(1);
S.nrows    = header{2}(2);
S.eastlon  = header{2}(3);
S.southlat = header{2}(4);
S.cellsize = header{2}(5);
S.nodata   = header{2}(6);

%S = cell2struct(num2cell(header{2}), header{1},1);

%------------------------------
% Read data
%------------------------------

pos = ftell(fid);
try
    data = textscan(fid, '%f');
    data = reshape(data{1}, S.ncols, S.nrows);
    S.data = flipud(data');
catch
    warning('Number of data values does not match rows and columns');
    fseek(fid, pos, 'bof');
    data = textscan(fid, '%s', 'delimiter', '\n');
    S.data = data{1};
end

