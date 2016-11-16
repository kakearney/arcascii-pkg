function varargout = plotarcascii(in)
%PLOTARCASCII Plots the data in a Arc ascii file or structure
%
% plotarcascii(file)
% plotarcascii(struct)
% h = plotarcascii(...)
%
% Input variables:
%
%   file:   Arc ascii file
%
%   struct: Arc ascii struct (read via arcasciiread)
%
% Output variables
%
%   h:      structure holding handles of plot

% Copyright 2007 Kelly Kearney

%------------------------------
% Read input
%------------------------------

if ischar(in) && exist(in, 'file')
    S = arcasciiread(in);
elseif isstruct(in) && all(isfield(in, {'ncols','nrows','eastlon','southlat','cellsize','nodata','data'}))
    S = in;
else
    error('Input must be arc ascii file or structure');
end

%------------------------------
% Plot
%------------------------------

S.data(S.data == S.nodata) = NaN;

lat = (0:S.nrows-1).*S.cellsize + S.southlat;
lon = (0:S.ncols-1).*S.cellsize + S.eastlon;

[lon,lat] = meshgrid(lon,lat);

h.fig = figure;
h.ax = axesm('robinson', ...
             'ParallelLabel', 'on', ...
             'MeridianLabel', 'on', ...
             'Frame', 'on');
h.surf = surfacem(lat,lon,S.data);
h.cb = colorbar;
axis tight;

%------------------------------
% Return handles
%------------------------------

if nargout == 1
    varargout{1} = h;
end