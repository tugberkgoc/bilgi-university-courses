%Question08:PlottingMultipleLinesAndColors
figure('Name', 'Two Line Plot')
t = 0: pi/100: 2*pi
sin_graph = sin(t)
plot(t, sin_graph, 'm')

hold on
cos_graph = cos(t)
plot(t, cos_graph, '--')
hold off

xlabel("Time(s)")
ylabel("Function value")
title("Sin and Cos Functions")
xlim([0 2*pi])
ylim([-1.4 1.4])
legend('sin', 'cos')