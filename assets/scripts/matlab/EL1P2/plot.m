close all;

figure;

hold all;
h = fplot(@(x) 0.000000001*(exp(x/0.06)-1), [-0.5, 1]);
grid on;
set(h, 'LineWidth', 2);
set(h, 'Color', 'b');
xlabel('UF (V)', 'FontSize', 16);
ylabel('IF (A)', 'FontSize', 16);

set(gca, 'FontSize', 16);

title('Nichtlineare Funktion einer Diode', 'FontSize', 16);


saveas(gcf, '1N4841.png');