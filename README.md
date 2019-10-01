# Parsing the UMD Three Meter Sodium Geodynamo Experiment Data
Scripts and functions necessary for working with 3M experiment data. Mostly Matlab code.

## Getting and preparing data
Here is an example how to get some data to work with:

#### Preparing files and folders
1) Download the folder you are interested in with 3M data, you need '*.daq' and '*.log' files 
2) Clone this repository to your local computer:
```git clone https://github.com/Three-Meter-Geodynamo-Experiment/parsing_data_3m.git```
3) Change hardcoded folder links to fit your architecture. Variables 'way' in files `grab_3mdata_chunks.m`, `import_control_magnet_logs.m` and in file `plotting_logs.m` need to fix the line with 'torque_data = '
4) Add all folders and subfolders from this repository in PATH

#### Figuring what parts of the day you are interested in
5) Use `plotting_logs('mmddyy')` function to plot the variables during the day you are interested. And decide where is your window of interest, for example from second 54000 to 61000.
6) Use `get_t1_t2_from_exp.m` script: add there the day and the times from the step before. You will need to choose what is your parameter that determines the end of one experimental run from another. Is it magnetic field or rossby number? More manual available in the file. 
As an output it will give you two vectors 't1' and 't2', first one corresponds to the times of the beginnings of the data and the second one for the endings.
The script should draw a plot with marked times so you can check if everything is like you expected. Double check if during your time gaps all parameters are stable. 

#### Withdrawal the data from the times you got
7) Create a file using a template: `data_analysis_example.m`
8) Modify the file using your variables 't1', 't2', and 'folder'. 'tb1' and tb2' are times where the bias data was taken, usualy Ro=0 and B=0. 
*By September 2019 you can either give it one time for all the chunks you are interested and it will assume this as the bias file for all the times you want, or don't provide any bias times to the function `grab_3mdata_chunks`, if so, the code will try to find something it considers good for being a bias file. Usually it works pretty well, but much longer. One should normally avoid it and provide bias time, don't ask robots to work more than it's needed.*
9) Run the code! It will create a cell variable 'record' with all the data inside. The way the data structurised is decribed in file `record_readme.mat`

10) Work with the data and have fun



## Information about the raw data
- [Rotating computer pinout](https://docs.google.com/spreadsheets/d/1QK5RuoAz3mkU4ewodRvsoY-TPS1rK52lsijLz8kj0Iw/edit#gid=0)
- [Control.log information](https://docs.google.com/spreadsheets/d/1iJDTR6pUdUj5UHCuwuZnz-ozIG0QwWEpun8C-yHjmEk/edit#gid=0)
- [Lab Frame sensors](https://docs.google.com/spreadsheets/d/12Y85VpWkbLblPkNm32mU3hsVgKqCMDhEJuQSiBuFi4o/edit#gid=0)

## Comments and additions

>keep in mind that 33 magnetic probes debiassed data in the 'record' got the values of hall probes signal with substracted bias mean values that come from tempreature and external noise, the signals from external coil/coils are not substracted. You can estimate them by usung file `coils_signal.m` from [this repository](https://github.com/Three-Meter-Geodynamo-Experiment/coils_signal)

Have questions? Ask pereval@umd.edu
