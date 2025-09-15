function [azimuth_angle, elevation_angle] = three_d_direction_angles(sat_1, sat_2)

vector_rel = sat_2 - sat_1;

% dot_product = dot(sat_1, sat_2);
% mag_sat1 = norm(sat_1);
% mag_sat2 = norm(sat_2);
% cos_theta = dot_product / (mag_sat1 * mag_sat2);
% theta = acosd(cos_theta);
% theta = rad2deg(theta);
% 
% if theta < 0 || theta > 90
%     vector_rel = -vector_rel;
% end

% atan2 return the value of the angle takeing into account the signs of
% both x and y 
azimuth_angle = atan2(vector_rel(2), vector_rel(1));
azimuth_angle = rad2deg(azimuth_angle);
if azimuth_angle<0
    azimuth_angle = azimuth_angle + 180;
end

elevation_angle = atan2(vector_rel(3), sqrt(vector_rel(1)^2 + vector_rel(2)^2));
elevation_angle = rad2deg(elevation_angle);
if elevation_angle<0
    elevation_angle = -elevation_angle;
end

end