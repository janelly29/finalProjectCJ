%Janelly Hidalgo & Cassidy Jackson
%Final Project
%April 2021

function[] = finalProject()
    %Creates global variable
    global plotgui;            
    
    %creates plot figure with a title
    plotgui.fig = figure('Name','Reaction Rate','NumberTitle','off');     
    plotgui.p = plot(0,0);
    
    
    %button for zero order equation
     plotgui.zeroOrderButton = uicontrol('style','pushbutton','string','Plot Zero Order','units','normalized','position',[0.1,.95,0.1,0.05],'callback',@plotzeroCallback);
    %button for first order equation
     plotgui.firstOrderButton = uicontrol('style','pushbutton','string','Plot First Order','units','normalized','position',[0.2,0.95,0.1,0.05],'callback',@plotfirstCallback);
    %button for second order equation
    plotgui.secondOrderButton = uicontrol('style','pushbutton','string','Plot Second Order','units','normalized','position',[0.3,0.95,0.1,0.05],'callback',@plotsecondCallback);
    %clear plot button
    plotgui.clearButton = uicontrol('style','pushbutton','string','Clear Plot','units','normalized','position',[0.75 0.95 0.1 0.05],'callback',@clearPlot); 
   
    %different elements of the plot that the user can essentially change
    plotgui.titleBox = uicontrol('style', 'edit', 'string', 'Insert Title', 'units', 'normalized' , 'position', [0.42 0.95 0.2 0.05]); 
    plotgui.xValuesBox = uicontrol('style', 'edit', 'string', 'Enter Time Values', 'units', 'normalized' , 'position', [0.2 0.02 0.1 0.05]); 
    plotgui.yValuesBox = uicontrol('style', 'edit', 'string', 'Enter Concentration Values', 'units', 'normalized' , 'position', [0.01 0.85 0.1 0.05]); 
  
    %Set gui elements that the user cannot change
    plotgui.xAxisTitleBox = uicontrol('style', 'text', 'string', 'Time (s)', 'units', 'normalized' , 'position', [0.44 0.02 0.15 0.05]); 
    plotgui.yAxisTitleBox = uicontrol('style', 'text', 'string', 'Concentration (M)', 'units', 'normalized' , 'position', [0.002 0.5 0.1 0.05]); 
    
    %callback function for zero order plotting
    function [] = plotzeroCallback(~,~)
        if ~isempty(plotgui.xValuesBox.String) || ~isempty(plotgui.yValuesBox.String) 
        %changes text in text box to numbers
            xValues = str2num(plotgui.xValuesBox.String);
             yValues = str2num(plotgui.yValuesBox.String);
    else
        return;
    end
        x1 = xValues;
        y1 = yValues;
        %plots the points inputed as a green dashed line with stars at the points
    plotgui.p = plot(x1, y1,'g--*');
    
    %sets limits for the graph depending on values of input x and y
    xLowerLim = x1(1)-.5;
    xUpperLim = x1(length(x1))+.5;
    xlim([xLowerLim xUpperLim]);
    yLowerLim = y1(1)-.5;
    yUpperLim = y1(length(y1))+.5;
    ylim([yLowerLim yUpperLim]);
    end

    %callback function for first order plotting
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
 
    x2 = xValues;
    y2 = log(yValues);
    %plots the points inputed as a red dashed line with stars at the points
    plotgui.p = plot(x2, y2,'r--*');
    
    %sets limits for the graph depending on values of x and y
    xLowerLim = x2(1)-.5;
    xUpperLim = x2(length(x2))+.5;
    xlim([xLowerLim xUpperLim]);
    yLowerLim = y2(1)-.5;
    yUpperLim = y2(length(y2))+.5;
    ylim([yLowerLim yUpperLim]);
    end
    
    %callback function for second order plotting
    function [] = plotsecondCallback(~,~)
        if ~isempty(plotgui.xValuesBox.String) || ~isempty(plotgui.yValuesBox.String) 
    %changes text in text box to numbers
            xValues = str2num(plotgui.xValuesBox.String);
            yValues = str2num(plotgui.yValuesBox.String);
    else
        return;
    end
        x3 = xValues;
        y3 = (yValues).^-1;
        
    %plots the points inputed as a blue dashed line with stars at the points
    plotgui.p = plot(x3, y3,'b--*');
    
    end

%Callback function that will clear all of user input
    function [] = clearPlot(~,~) 
        plotgui.titleBox.String = 'Insert Title';
        plotgui.yValuesBox.String = 'Enter Concentration Values';
        plotgui.xValuesBox.String = 'Enter Time Values';
        plotgui.p = plot(0,0);
    end

end

