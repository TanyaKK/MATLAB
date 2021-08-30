function L_HCW =Linear_HCW(init,t)
% Position Control of Chaser using Linearized HCW equations.
% Here w will be Changing for every time stamp so will implement it like
% Non Linear Model.

%% Implementing Time Varying Angular Velocity System.

[T4,y4] = rkf4(@HCW_eq,[t(1),t(end)],init);
L_HCW=y4;

end

function dy= HCW_eq(~,f)
global mu;
x=f(1);
y=f(2);
z=f(3);
Vx=f(4);
Vy=f(5);
Vz=f(6);

r=norm([x y z]);
Omega20=(mu/(r^3))^0.5;

ax=2*Omega20*Vy+ 3*Omega20*Omega20*x;
ay=-2*Omega20*Vx;
az=-Omega20^2*z;

dy = [Vx  Vy  Vz  ax  ay  az]'; 
end