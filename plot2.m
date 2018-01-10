function plot2(x, s, xl, t, axs)
%PLOT2 Dibuja la señal s continua y otros detalles.
%
%   plot2(x, s, xl, t, axs) dibuja la señal continua s especificada en
%   el intervalo x, titula la gráfica con t, rotula el eje x con xl y
%   ajusta los ejes con axs.
%   Entradas:
%       n   - vector de índices temporales
%       s   - vector de señal
%       xl  - etiqueta para el eje x
%       t   - título
%       axs - vector de ajuste de ejes
    plot(x, s)
    xlabel(xl, 'Units', 'normalized', 'Position', [1.03, 0.08])
    title(t, 'FontSize', 10);
    axis(axs);
    grid;
end
