; Batch file to print ps file and return to X
device, /close
spawn, 'print /D:\\cars5\"gse floor ps" idl.ps'
set_plot, 'win'
