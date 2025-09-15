function dxdt = two_body(x, mu)

    r = x(1:3);
    v = x(4:6);
    r_mag = norm(r);
    a = -mu / r_mag^3 .* r;
    dxdt = [v; a];
    
end
