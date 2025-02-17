function H = Matr_pereh(fi,alf,a,d)
    theta = fi;
    d_mm = d;
    a_mm = a;
    alpha = alf;

    H = [cosd(theta), -sind(theta)*cosd(alpha), sind(theta)*sind(alpha), a_mm*cosd(theta);
    sind(theta), cosd(theta)*cosd(alpha), -cosd(theta)*sind(alpha), a_mm*sind(theta);
    0, sind(alpha), cosd(alpha), d_mm;
    0, 0, 0, 1];
end