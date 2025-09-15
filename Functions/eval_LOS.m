%% Evaluate line of sight LOS

function [in_LOS,rel_dist] = eval_LOS(sat1,sat2, earthradius, sigmaR)
% eval_LOS evalutate the relative distance between theo satellite and tells
% if they are in line of sight or not. If they are, the functin returns the
% relative distance between the two satellites 

% INPUT: 
% sat1 - state of satellite 1 [x y z]
% sat2 - state of satellite 2 [x y z]
% earthradius 
% sigmaR - noise 

% OUTPUT: 
% in_LOS - boolean variable telling if the two satellites are in line of
%          sight (TRUE or FALSE)
% rel_dist - relative distance between the two satellites

% Compute the relative distance 
rel_dist = sat2 - sat1;

% Create line between sat1 and sat2
np = 100;
dummyvar = linspace(0,1,np);
line(1,:) = sat1(1) + rel_dist(1) * dummyvar;
line(2,:) = sat1(2) + rel_dist(2) * dummyvar;
line(3,:) = sat1(3) + rel_dist(3) * dummyvar;

% Calculate min distance
dist = zeros(1,np);
for dd = 1:np
    dist(dd) = norm(line(:,dd));
end
min_dist = min(dist);

% Compare with Earth's radius
if min_dist > earthradius
    in_LOS = true;

    % Introduce noise in the measurement of the relative distance 
    rel_dist = rel_dist + sigmaR*randn(1);

elseif min_dist < earthradius
    in_LOS = false;
    rel_dist = 0;
end

