%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%/////////////////////////////////////////////////////////
% Roll the dice "numberOfRolls" times
numberOfRolls = 1000; % Number of times you roll all 6 dice.
n = 10; % Number of dice.
maxFaceValue = 6;
rolls = randi(maxFaceValue, n, numberOfRolls);
% Sum up dice values for each roll.
columnSums = sum(rolls, 1);
% Find out how many times each sum occurred.
edges = min(columnSums):max(columnSums);
counts = histc(columnSums, edges);
% Normalize
grandTotalSum = sum(counts(:));
normalizedCountSums = counts / grandTotalSum;
bar(edges, normalizedCountSums, 'BarWidth', 1);
grid on;
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% Give a name to the title bar.
set(gcf,'name','Demo by ImageAnalyst','numbertitle','off') 
title('Frequency of Roll Sums', 'FontSize', 40);