
function [y] = ML_two(t, xi)

global Is Id gc p;   
%%
% parameter
C = 1;

gna = 45;
gk = 18;
gsl = 0.1;
gdl = 0.1;

Vna = 55;
Vk  = -80;
Vsl = -65;
Vdl = -65;

%%
% variable
dxi = zeros(4, 1);
Vs = xi(1);
n  = xi(2);
w  = xi(3);
Vd = xi(4);


%%
% stimulation

 if t>50 & t<450
     s=Id;
 else
     s=0;
 end

%%
% nonlinear function 

alphaM=-0.1*(Vs+33)/(exp(-0.1*(Vs+33))-1);
betaM=4*exp(-(Vs+58)/12);
wuqM=alphaM/(alphaM+betaM);tauM=1/(alphaM+betaM);

alphaN=0.07*exp(-(Vs+50)/10);
betaN=1/(exp(-0.1*(Vs+20))+1);
wuqN=alphaN/(alphaN+betaN);tauN=1/(alphaN+betaN);

alphaW=-0.01*(Vs+34)/(exp(-0.1*(Vs+34))-1);
betaW=0.125*exp(-(Vs+44)/25);
wuqW=alphaW/(alphaW+betaW);tauW=1/(alphaW+betaW);

Ids=gc*(Vd-Vs);

%%
%常微分方程
  dxi(1) = (1/C)*(Ids/p+Is-gsl*(Vs-Vsl)-gna*wuqM^3*n*(Vs-Vna)-gk*w*w*w*w*(Vs-Vk));
  dxi(2) = (wuqN-n)/tauN;
  dxi(3) = (wuqW-w)/tauW;
  dxi(4) = (1/C)*(s-Ids/(1-p)-gdl*(Vd-Vdl));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  y = [dxi];