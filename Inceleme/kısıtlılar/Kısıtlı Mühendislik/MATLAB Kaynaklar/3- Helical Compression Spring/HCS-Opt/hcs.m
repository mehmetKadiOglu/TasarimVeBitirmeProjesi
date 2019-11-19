function output = hcs(varargin)
% hcs.m: evaluate helical compression spring design metrics
% example evaluation: >> hcs([.01 .129 .106 3.57]);
%
% Author: James T. Allison, University of Illinois at Urbana-Champaign
% Date: 10-5-2017
% Created for use in SE 410 and SE 413 at UIUC

% Set default display level:
display_format_d = 3;     % 0: none, 1: concise, 2: verbose, 3: full

% Set default design variable values (use if values not provided) 
xd(1) = 0.020;          % d: spring wire diameter (m)
xd(2) = 0.129;          % D: spring helix diameter (m)
xd(3) = 0.106;          % p: spring pitch (m)
xd(4) = 3.57;           % Na: number of active spring coils (3 <= Na <= 15 for linearity)

if nargin == 0              % Use all default variable values
    x = xd;                 
    display_format = display_format_d;
elseif nargin == 1          % Use provided variable values
    x = varargin{1};        
    display_format = display_format_d;
elseif nargin == 2          % Use provided display format
    x = varargin{1};
    display_format = varargin{2};
elseif nargin == 3          % Use subset of provided variable values
    xtemp = varargin{1};    % Size of input vector must match length of xsub  
    display_format = varargin{2};
    xsub = varargin{3};
    x=xd;x(xsub)= xtemp;    % Form complete design vector
end
d=x(1);D=x(2);p=x(3);Na=x(4);

% fixed model parameters
A = 1974;               % Mpa*mm^m
m = 0.108;              % dimensionless
nd = 1.2;               % design factor (safety factor)
Q = 1.75;               % squared and ground ends
L0max = 0.60;           % maximum spring pocket length (m)
DoMax = 0.25;           % maximum spring outer diameter (m)
trav_min = 0.35;        % minimum spring travel (m)
kT = 33333;             % kT: target spring rate (N/m)(500Kg, .15m compression)
                        
% material properties
Sut = A*1e6/((d*1000)^m);      % ultimate tensile strength (Pa) (Chrome silicon A401, Table 10-5)
Ssy = 0.65*Sut;         % shear yield strength (Pa)
G = 77.2e9;             % shear modulus of elasticity (Pa)
rho_w = 7850;           % steel density (kg/m^3)

% calculate spring properties
C = D/d;                                % spring index
L0 = p*Na + 2*d;                        % spring free length (m)
Ls = (Na+2)*d;                        % spring solid height (m)
k = d^4*G/(8*D^3*Na*(1+1/(2*C^2)));     % spring rate (N/m)
Fs = 5000;                         % axial force at solid length (N)
KB = (4*C+2)/(4*C-3);                   % Bergstrausser factor
tau_s = KB*8*Fs*D/(pi*d^3);             % shear stress @ solid height
Nt = Na + 2;                            % number of total coils
Lw = Nt*2*pi*D;                         % spring wire length
mass = pi*rho_w*Lw*d^2/4;               % spring mass
trav = L0 - Ls;                         % max spring travel

% assmeble objective and constraint functions
obj = mass;
h(1) = k - kT;          % stiffness target
g(1) = 4 - C;           % spring manufacturing constraint
g(2) = C - 12;          % spring manufacturing constraint
g(3) = L0 - 5.26*D;     % spring stability/buckling constraint for squared ground ends
g(4) = L0 - L0max;      % spring packaging constraint
g(5) = d + D - DoMax;   % spring packaging constraint 
g(6) = tau_s*nd - Ssy;  % shear stress constraint
g(7) = trav_min - trav; % minimum travel constraint

% Other possible design constraints could include fatigue, linearity,
% dynamic constraints (resonance), etc.

% assemble output struct
output.obj = obj;
output.g = g;
output.h = h;
output.k = k;
output.x = x;

if display_format == 1
    disp('----------')
    disp(num2str(obj,5))
    disp('--')
    disp(num2str(h',5))
    disp('--')
    disp(num2str(g',5))
elseif display_format == 2
    disp(['objective: ' num2str(obj)])
    disp(['h1 = ' num2str(h(1)) ', k = kT'])
    disp(['g1 = ' num2str(g(1)) ', C >= 4, C = D/d'])
    disp(['g2 = ' num2str(g(2)) ', C <= 12, C = D/d'])
    disp(['g3 = ' num2str(g(3)) ', stability constraint (L0/D)'])
    disp(['g4 = ' num2str(g(4)) ', max free length'])
    disp(['g5 = ' num2str(g(5)) ', max spring diameter'])
    disp(['g6 = ' num2str(g(6)) ', shear stress constraint'])
    disp(['g7 = ' num2str(g(7)) ', minimum travel constraint'])
elseif display_format == 3
    disp('-------------------------------')
    disp('Spring Design Metrics:')
    disp('-------------------------------')
    disp(['mass: ' num2str(obj) ' kg'])
    disp(['k: ' num2str(k,5) ' N/m (target: ' num2str(kT) ')'])
    tol = 1e-7;
    if g(1) > tol
        disp1 = 'VIOLATED';
    else
        disp1 = 'SATISFIED';
    end
    if g(2) > tol
        disp2 = 'VIOLATED';
    else
        disp2 = 'SATISFIED';
    end
    disp(['Spring Index C = D/d = ' num2str(C) ', C >= 4: ' ...
        disp1 ', C <= 12: ' disp2])
    if g(4) > tol
        disp3 = 'VIOLATED';
    else
        disp3 = 'SATISFIED';
    end
    disp(['Free Length L0: ' num2str(L0) ' , Max L0 = ' num2str(L0max) ...
        ': ' disp3]);    
    if g(3) > tol
        disp4 = 'VIOLATED';
    else
        disp4 = 'SATISFIED';
    end
    disp(['Buckling Constraint: L0 <= 5.26*D: ' disp4])
    if g(5) > tol
        disp5 = 'VIOLATED';
    else
        disp5 = 'SATISFIED';
    end
    disp(['Outer diameter: D + d = ' num2str(D+d) ' <= ' num2str(DoMax) ...
        ': ' disp5])
    if g(6)/1e9 > tol
        disp6 = 'VIOLATED';
    else
        disp6 = 'SATISFIED';
    end
    disp(['Shear stress: ' num2str(tau_s/1e9) ' <= ' ...
        'Ssy/nd = ' num2str(Ssy/nd/1e9) ' (GPa): ' disp6]);
    if g(7) > tol
        disp7 = 'VIOLATED';
    else
        disp7 = 'SATISFIED';
    end
    disp(['Spring travel: ' num2str(trav) ' >= ' num2str(trav_min) ...
        ' : ' disp7])
end
