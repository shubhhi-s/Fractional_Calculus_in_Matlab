% Performs integration of x(t) = t, using alpha from 0 to 1, and animate
% the result using a GIF file

clc;
close all;
clear all;

ts = 0.01;
n = 170;

figure;
hold on;
h1 = plot(0, 0, 'r');
h3 = plot(0, 0, 'm');
h2 = plot(0, 0, 'b');
h4 = text(0.2, 1.8, '');

legend('\alpha = 0', '\alpha = 1', '0<\alpha< 1')
xlabel('t');
ylabel('x(t)')
title ('Fractional Integral')
xlim([0 2]);
ylim([0 2]);

t = 0:ts:2;

% x(t) = t
x = t;
set(h1, 'XData', t, 'YData', x);

% x(t) = 0.5 * t^2
x3 = fint(x, 1, n, ts);
set(h3, 'XData', t, 'YData', x3);

k = 1; % frame number for the gif file
for alpha = 0:0.05:1
    stralpha = ['\alpha = ', num2str(alpha)];
    set(h4, 'String', stralpha);
    
    x2 = fint(x, alpha, n, ts);
    set(h2, 'XData', t, 'YData', x2);
    drawnow;
    pause(0.1);
    
    % Draw to gif
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if k == 1;
        imwrite(imind,cm,'fint.gif','gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,'fint.gif','gif','WriteMode','append');
    end
    k = k + 1;
end