function Out = AuvMathModel(In)
% In = [u;w;q(rad/s);theta(rad);Xprop(N);MDisturb;Deltas(rad)]
% Oot = [dotu;dotw;dotq(rad/s/s);totalDisturbance(rad/s/s)]

u = In(1);
w = In(2);
q = In(3);
theta = In(4);
Xprop = In(5);
MDisturb = In(6);
Deltas = In(7);

global auv;

XHS = -(auv.W-auv.B)*sin(theta);
ZHS = (auv.W-auv.B)*cos(theta);
MHS = -(auv.zg*auv.W-auv.zb*auv.B)*sin(theta)-(auv.xg*auv.W-auv.xb*auv.B)*cos(theta);

Xsum = XHS+auv.Xuu*u*abs(u)+(auv.Xwq-auv.m)*w*q+(auv.Xqq+auv.m*auv.xg)*q*q+Xprop;
Zsum = ZHS+auv.Zww*w*abs(w)+auv.Zqq*q*abs(q)+(auv.Zuq+auv.m)*u*q+auv.Zuw*u*w+auv.m*auv.zg*q*q+auv.Zuudelta*u*u*Deltas;
%Msum = MHS+MDisturb+auv.Mww*w*abs(w)+auv.Mqq*q*abs(q)+(auv.Muq-auv.m*auv.xg)*u*q-auv.m*auv.zg*w*q+auv.Muw*u*w+auv.Muudelta*u*u*Deltas;

totalDisturbance = MHS+MDisturb+auv.Mww*w*abs(w)+auv.Mqq*q*abs(q)+(auv.Muq-auv.m*auv.xg)*u*q-auv.m*auv.zg*w*q+auv.Muw*u*w;
Msum = totalDisturbance+auv.Muudelta*u*u*Deltas;
totalDisturbance = totalDisturbance/(auv.Iyy-auv.Mdotq)+(auv.Muudelta*u*u/(auv.Iyy-auv.Mdotq)-(-1.598))*Deltas;

Out = auv.M\[Xsum;Zsum;Msum];
Out = [Out;totalDisturbance];
end