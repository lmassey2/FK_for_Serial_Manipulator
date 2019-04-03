% Initial Variables
L0 = 0.3;
L1 = 0.2;
L2 = 0.1;

theta0 = 0.4;
theta1 = 0.6;
theta2 = 1.2;

% Long-hand Method
xe = L0*cos(theta0) + L1*cos(theta0 + theta1) + L2*cos(theta0 + theta1+ theta2)
xy = L0*sin(theta0) + L1*sin(theta0 + theta1) + L2*sin(theta0 + theta1+ theta2)
t = radtodeg(theta0 + theta1 + theta2)


% Matricies Method
T01rad = [cos(theta0) -sin(theta0) 0 0; sin(theta0) cos(theta0) 0 0; 0 0 1 0; 0 0 0 1];
T12rad = [cos(theta1) -sin(theta1) 0 0; sin(theta1) cos(theta1) 0 0; 0 0 1 0; 0 0 0 1];
T23rad = [cos(theta2) -sin(theta2) 0 0; sin(theta2) cos(theta2) 0 0; 0 0 1 0; 0 0 0 1];

T01mag = [1 0 0 L0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T12mag = [1 0 0 L1; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T23mag = [1 0 0 L2; 0 1 0 0; 0 0 1 0; 0 0 0 1];

T0 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T1 = T01rad*T01mag;
T2 = T12rad*T12mag;
T3 = T23rad*T23mag;

T = T0*T1*T2*T3


% Since we are only rotating about the z-axis and never about x, y axises
% to determine the amount of rotation simply inverse cosine the top left
% value of the final T matrix.
acosd( T(1,1))


