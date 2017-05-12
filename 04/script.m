clc;

x = -2 : 0.01 : 2.0; 

y1 = sinh(x); % y = sinh x
y2 = asinh(x); % Umkehrfunktion von sinh x
plot(x, y1, 'r', x, y2, 'b') % Zeichnen beider Grafiken

grid
title('Jarack wie Schmorock')

xlabel('Jarack')
ylabel('Schmorock')

legend('Jaracklegend', 'Schmorocklegend')


hold on
y3 = x;
plot(x, y3)
hold off