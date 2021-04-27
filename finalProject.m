%Janelly Hidalgo & Cassidy Jackson
%Final Project
%April 2021

function[] = finalProject()
    %Creates global variable
    global plotgui;            
    
    %creates plot figure with a title
    plotgui.fig = figure('Name','Reaction Rate','NumberTitle','off');     
    plotgui.p = plot(0,0);
    
    %creates two push buttons that will call on functions to plot and clear
    plotgui.plotButton = uicontrol('style','pushbutton','string','Plot Values','units','normalized','position',[0.2 0.95 0.1 0.05],'callback',@plotvaluesCallback); 
    plotgui.clearButton = uicontrol('style','pushbutton','string','Clear Plot','units','normalized','position',[0.75 0.95 0.1 0.05],'callback',@clearPlot); 

    %different elements of the plot that the user can essentially change
    plotgui.titleBox = uicontrol('style', 'edit', 'string', 'Insert Title', 'units', 'normalized' , 'position', [0.42 0.95 0.2 0.05]); 
    plotgui.xAxisTitleBox = uicontrol('style', 'text', 'string', 'Time', 'units', 'normalized' , 'position', [0.44 0.02 0.15 0.05]); 
    plotgui.yAxisTitleBox = uicontrol('style', 'text', 'string', 'ln of Concentration', 'units', 'normalized' , 'position', [0.002 0.5 0.1 0.05]); 
    plotgui.xValuesBox = uicontrol('style', 'edit', 'string', 'Enter Time Values', 'units', 'normalized' , 'position', [0.2 0.02 0.1 0.05]); 
    plotgui.yValuesBox = uicontrol('style', 'edit', 'string', 'Enter Concentration Values', 'units', 'normalized' , 'position', [0.01 0.85 0.1 0.05]); 
   
  
end

