clear all

global Is Id gc p; 

t0=0:0.001:1000;
x0=[-64.9278;0.9651;0.0489;-64.8184;0;0.5796;0;0]; %


p=0.4;
gc=0.6; 

for Id=2
Is=0;

[t,x]=ode23('ML_two',t0,x0);

%%
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

alphaM=-0.1*(x(:,1)+33)./(exp(-0.1*(x(:,1)+33))-1);
betaM=4*exp(-(x(:,1)+58)/12);
wuqM=alphaM./(alphaM+betaM);

% current
Ina=gna*wuqM.*wuqM.*wuqM.*x(:,2).*(x(:,1)-Vna);
Ik=gk*x(:,3).*x(:,3).*x(:,3).*x(:,3).*(x(:,1)-Vk);
Isl=gsl*(x(:,1)-Vsl);
Ica=gca*x(:,5).*x(:,5).*x(:,6).*(x(:,4)-Vca);
Idl=gdl*(x(:,4)-Vdl);
Ids=-gc*(x(:,4)-x(:,1));
Ikahp=5*x(:,7).*(x(:,4)-Vk);

end


%%
subplot(4,1,1); plot(t,x(:,1),'k','lineWidth',.8);ylabel('V_S');
subplot(4,1,2); plot(t,Ikahp,'k','lineWidth',.8);ylabel('I_K_A_H_P');
subplot(4,1,3); plot(t,Ica,'k','lineWidth',.8);ylabel('I_C_a');
subplot(4,1,4); plot(t,Ids/p,'k','lineWidth',.8);ylabel('I_S_D');xlabel('t');


