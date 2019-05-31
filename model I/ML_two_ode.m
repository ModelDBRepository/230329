clear all

global Is Id gc p; 

t0=0:0.001:500;
x0=[-64.8;0.9650;0.049;-64.8594]; %


p=0.6;
gc=0.5; 

for Id=3;
    Is=0;

[t,x]=ode23('ML_two',t0,x0);

%%
gna = 45;
gk = 18;
% gca = 0;
gsl = 0.1;
gdl = 0.1;

Vna = 55;
Vk  = -80;
% Vca = 120;
Vsl = -65;
Vdl = -65;

alphaM=-0.1*(x(:,1)+33)./(exp(-0.1*(x(:,1)+33))-1);
betaM=4*exp(-(x(:,1)+58)/12);
wuqM=alphaM./(alphaM+betaM);

% current
Ina=gna*wuqM.*wuqM.*wuqM.*x(:,2).*(x(:,1)-Vna);
Ik=gk*x(:,3).*x(:,3).*x(:,3).*x(:,3).*(x(:,1)-Vk);
Isl=gsl*(x(:,1)-Vsl);
Idl=gdl*(x(:,4)-Vdl);
Ids=-gc*(x(:,4)-x(:,1));
end



%%
% »æÍ¼
figure; plot(t,x(:,1),'k','lineWidth',.8);



