%One-dimensional Transient cooling of a hot (spherical) pyroclast
clc
clear;

%Setting parameters
r = 0.05;   % radius of the pyroclast [m]
Tl = 1523.15 ;  % initial temperature [K]
Ts = 304.15;    % surface or ambient temp. [K]
alpha = 10^-5; % thermal diffusivity of basalt [m^2/s]((Huppert and Sparks, 1988; Jellinek and Kerr, 1999)
k = 2.5; % thermal conductivity of the pyroclast [W/m.K]
htc = 7000; % heat transfer coefficient [W/m^2.K]
%t = 100; %[s]
nt = 1000; % number of time steps
dt = 0.1;  % time step size
nr = 101;   % number of radial poisitions
h = r/nr;  % radial spacing

T = zeros(nt,nr);  % initialize the temperature grid
ITMAX = 500; % maximum number of iterations, could be increased for a more refined solution but it costs more time
s = (alpha*dt)/h^2; % assigning the constansts to a term, s

soe = NaN;  %to initialize the sum of errors in each iteration

%For the first time step (J = 1), all radial positions are assigned the
%initial temperature, Tl
for J = 1
    for I = 1:1:nr
        T(J,I) = Tl;  
    end
end

% For subsequent time steps (J = 2,3...);

tic
for J = 2:1:nt
    ITER = 0;
    ERROR = 1.0;
    
while (ERROR > 0.0001 && ITER < ITMAX)
    ITER = ITER + 1;
    ERROR = 0; 
    
for I = 1
    T(J,I) = T(J,I+1);
end
for I = nr
    T(J,I) = ((htc*Ts) + ((k*T(J,I-1))/h))/(htc + (k/h));
end
    
        for I = 2:1:nr-1
            T_old = T(J,I);
            T(J,I) = (T(J-1,I) + (T(J,I+1)*(s+(alpha*dt)/(I*h^2))) + (T(J,I-1)*(s-(alpha*dt)/(I*h^2))))/(1+(2*s));          
            ERROR = ERROR + abs(T(J,I) - T_old);  
            ERRORSAV2(ITER) = ERROR;
            timeiter = ERRORSAV2(:);
        end  
        
end

soe = [soe;timeiter];
plot(soe);
xlabel("Number of iterations");
ylabel("Sum of errors");
title(['Transient cooling at {\itt} = ',num2str(nt*dt), ' s'])
end
toc
T = T-273.15; % convert T from [K] to [deg. celsius]
figure()
plot(T(nt/2,:));
hold on;
plot(T(nt-1,:));
xlabel('Time array indices');
ylabel('Temperature (^{o}C)');
% title(['Cooling of ' ,num2str(r), ' m particle at t = ' ,num2str(dt * nt), ' seconds']);
title(['Cooling of ' ,num2str(r), ' m particle at t = ' ,num2str(dt*(nt/2)), ' and ' ,num2str(dt*(nt-1)),' seconds'])
legend('50 seconds','99.9 seconds');

