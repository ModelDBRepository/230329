
function [y] = ML_two(t, xi)

global Is Id gc p;   
%%
% parameter
C = 1;

gna = 45;
gk = 18;
gca= 0.8; 
gsl = 0.1;
gdl = 0.1;

Vna = 55;
Vk  = -80;
Vca = 140;
Vsl = -65;
Vdl = -65;


%%
% variable
dxi = zeros(6, 1);
Vs = xi(1);
n  = xi(2);
w  = xi(3);
Vd = xi(4);
a =  xi(5);
h  = xi(6);

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

alphaA=0.005*(Vd+27)/(1-exp(-(27+Vd)/3.8));
betaA=0.94*exp(-(Vd+75)/17);
wuqA=alphaA/(alphaA+betaA);tauA=1/(alphaA+betaA);

alphaH=4.57*0.0001*exp(-(Vd+13)/50);
betaH=0.0065/(1+exp(-(Vd+15)/28));
wuqH=alphaH/(alphaH+betaH);tauH=1/(alphaH+betaH);

Ids=gc*(Vd-Vs);

%%
  dxi(1) = (1/C)*(Ids/p+Is-gsl*(Vs-Vsl)-gna*wuqM^3*n*(Vs-Vna)-gk*w*w*w*w*(Vs-Vk));
  dxi(2) = (wuqN-n)/tauN;
  dxi(3) = (wuqW-w)/tauW;
  dxi(4) = (1/C)*(Id-Ids/(1-p)-gca*a*a*h*(Vd-Vca)-gdl*(Vd-Vdl));
  dxi(5) = (wuqA-a)/tauA;
  dxi(6) = (wuqH-h)/tauH;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  y = [dxi];