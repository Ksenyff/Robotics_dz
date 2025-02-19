%% 1.2
clear;clc;
% Оббозначения
a=[ 0 0 50.0 0 0 0 0];
d=[ 50 0 0 0 60.0 0 0];
alf=[ 0 90.0 0 90.0 -90.0 90.0 90.0];
fi = [ 0 -90.0 0 90.0 0 -90.0 90.0];
% матрицы перехода 
Ho1 = Matr_pereh (fi(1),alf(1),a(1),d(1));
Ho2 = Matr_pereh (fi(2),alf(2),a(2),d(2));
Ho3 = Matr_pereh (fi(3),alf(3),a(3),d(3));
Ho4 = Matr_pereh (fi(4),alf(4),a(4),d(4));
Ho5 = Matr_pereh (fi(5),alf(5),a(5),d(5));
Ho6 = Matr_pereh (fi(6),alf(6),a(6),d(6));
TH1=Ho1;
TH2=TH1*Ho2;
TH3=TH2*Ho3;
TH4=TH3*Ho4;
TH5=TH4*Ho5;
TH6=TH5*Ho6;
mas = [TH1(1:3,4)' ; TH2(1:3,4)'; TH3(1:3,4)';TH4(1:3,4)';TH5(1:3,4)';TH6(1:3,4)']; 
TH = {TH1, TH2, TH3, TH4, TH5, TH6};
len = 10;
% Создаем новый график
%
% Рисуем системы координат для каждой точки
%%
 figure 
hold on;
plot3(mas(:,1),mas(:,2),mas(:,3),'k--', 'LineWidth', 1.5)
for i = 1:length(TH)
    T = TH{i}; % Извлекаем матрицу преобразования
    
    % Позиция начала координат
    x0 = T(1, 4);
    y0 = T(2, 4);
    z0 = T(3, 4);
    
    % Направления осей
    xAxis = T(1:3, 1); % Направление оси X
    yAxis = T(1:3, 2); % Направление оси Y
    zAxis = T(1:3, 3); % Направление оси Z
       
    % Ось X (красная)
    quiver3(x0, y0, z0, xAxis(1)*len, xAxis(2)*len, xAxis(3)*len, 'r', 'LineWidth', 2);
    text(x0 + xAxis(1)*len, y0 + xAxis(2)*len, z0 + xAxis(3)*len, 'X', 'Color', 'r');
    
    % Ось Y (зеленая)
    quiver3(x0, y0, z0, yAxis(1)*len, yAxis(2)*len, yAxis(3)*len, 'g', 'LineWidth', 2);
    text(x0 + yAxis(1)*len, y0 + yAxis(2)*len, z0 + yAxis(3)*len, 'Y', 'Color', 'g');
    
    % Ось Z (синяя)
    quiver3(x0, y0, z0, zAxis(1)*len, zAxis(2)*len, zAxis(3)*len, 'b', 'LineWidth', 2);
    text(x0 + zAxis(1)*len, y0 + zAxis(2)*len, z0 + zAxis(3)*len, 'Z', 'Color', 'b');
    
    % Подпись для каждого звена
    text(x0, y0, z0 - len, ['Joint ', num2str(i)], 'Color', 'k', 'FontSize', 10);
    
end
