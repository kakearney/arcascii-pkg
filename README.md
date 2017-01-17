
# arcasciiread.m: Read data from an ESRI ASCII file


Author: Kelly Kearney


This repository includes the code for the `arcasciiread.m` and `plotarcascii.m` Matlab functions, along with all dependent functions required to run them.


The `readarcascii` function reads all data from an ESRI ASCII grid file. This format is associated with various ESRI products, including ArcGIS, and holds the data defining a single raster grid.


The `plotarcascii` function provides a convenient way to plot the data from one of these files.  It sets up a simple map axis and adds a surfacem plot of the data.



## Contents

            
- Getting started        
- Syntax        
- Contributions

## Getting started


**Prerequisites**


This function requires Matlab R14 or later.


**Downloading and installation**


This code can be downloaded from [Github](https://github.com/kakearney/arcascii-pkg/) or the [MatlabCentral File Exchange](http://www.mathworks.com/matlabcentral/fileexchange/).  The File Exchange entry is updated daily from the GitHub repository.


**Matlab Search Path**


The following folders need to be added to your Matlab Search path (via `addpath`, `pathtool`, etc.):



```matlab
arcascii-pkg/arcascii
```



## Syntax



```
S = arcasciiread(file)
```


Input variables:



  - `file`: name of input file

Output variables:



  - `S.ncols`:      number of columns in grid
  - `S.nrows`:      number of rows in grid
  - `S.eastlon`:    longitude/x-coordinate of eastern (leftmost) edge of grid
  - `S.southlat`:   latitude/y-coordinate of southern (bottom) edge of grid
  - `S.cellsize`:   length of one side of grid cell
  - `S.nodata`:     value used to represent missing data
  - `S.data`:       nrows x ncols data grid


## Contributions


Community contributions to this package are welcome!


To report bugs, please submit [an issue](https://github.com/kakearney/example-pkg/issues) on GitHub and include:



  - your operating system
  - your version of Matlab and all relevant toolboxes (type `ver` at the Matlab command line to get this info)
  - code/data to reproduce the error or buggy behavior, and the full text of any error messages received

Please also feel free to submit enhancement requests, or to send pull requests (via GitHub) for bug fixes or new features.


I do monitor the MatlabCentral FileExchange entry for any issues raised in the comments, but would prefer to track issues on GitHub.



<sub>[Published with MATLAB R2016a]("http://www.mathworks.com/products/matlab/")</sub>