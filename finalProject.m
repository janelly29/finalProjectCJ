%Janelly Hidalgo & Cassidy Jackson
%Final Project
%April 2021

function[] = finalProject()
    %Creates global variable
    global plotgui;            
    
    %creates plot figure with a title
    plotgui.fig = figure('Name','Reaction Rate','NumberTitle','off');     
    plotgui.p = plot(0,0);
    
    %creates push buttons that will call on functions to plot and clear
    
    plotgui.firstOrderButton = uicontrol('style','pushbutton','string','Plot First Order','units','normalized','position',[0.2 0.95 0.1 0.05],'callback',@plotfirstCallback); 
     %button for first order equation
    %plotgui.zeroOrderButton = uicontrol('style','pushbutton','string',
    %button for second order equation
    
    plotgui.clearButton = uicontrol('style','pushbutton','string','Clear Plot','units','normalized','position',[0.75 0.95 0.1 0.05],'callback',@clearPlot); 

    %different elements of the plot that the user can essentially change
    plotgui.titleBox = uicontrol('style', 'edit', 'string', 'Insert Title', 'units', 'normalized' , 'position', [0.42 0.95 0.2 0.05]); 
    plotgui.xAxisTitleBox = uicontrol('style', 'text', 'string', 'Time', 'units', 'normalized' , 'position', [0.44 0.02 0.15 0.05]); 
    plotgui.yAxisTitleBox = uicontrol('style', 'text', 'string', 'Concentration', 'units', 'normalized' , 'position', [0.002 0.5 0.1 0.05]); 
    plotgui.xValuesBox = uicontrol('style', 'edit', 'string', 'Enter Time Values', 'units', 'normalized' , 'position', [0.2 0.02 0.1 0.05]); 
    plotgui.yValuesBox = uicontrol('style', 'edit', 'string', 'Enter Concentration Values', 'units', 'normalized' , 'position', [0.01 0.85 0.1 0.05]); 
   %x and y value boxes that can be edited
    plotgui.yValues = uicontrol('style','edit','units','normalized','position',[0.35,0.01,0.1,0.05]);
    plotgui.xValues = uicontrol('style','edit','units','normalized','position',[0.65,0.01,0.1,0.05]);
    
   
    
    
    function [] = plotfirstCallback(~,~)
    %checks to see that values in edit box are not empty
    if ~isempty(plotgui.xValuesBox.String) || ~isempty(plotgui.yValuesBox.String) 
        %changes text in text box to numbers
        xValues = str2num(plotgui.xValuesBox.String);
        yValues = str2num(plotgui.yValuesBox.String);
    else
        return;
    end
    %creates variables based off of input by the user
    x = xValues;
    y = log(yValues);
    
    
    %plots the points inputed as a green dashed line with stars at the
    %points
    plotgui.p = plot(x, y,'g--*');
    
    %sets limits for the graph depending on values of 
    xLowerLim = x(1)-.5;
    xUpperLim = x(length(x))+.5;
    xlim([xLowerLim xUpperLim]);
    yLowerLim = y(1)-.5;
    yUpperLim = y(length(y))+.5;
    ylim([yLowerLim yUpperLim]);
  
end
  
end

