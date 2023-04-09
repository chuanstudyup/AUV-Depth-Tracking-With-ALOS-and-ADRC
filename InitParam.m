global auv;

% Verification of a six-degree of freedom simulation model for the REMUS autonomous underwater vehicle

auv.m = 30.48; %kg
auv.W = 299; %N
auv.B = 305; %N
auv.Iyy = 3.45;

auv.xg = 0; %m
auv.zg = 0.0196;

auv.xb = 0; %m
auv.zb = 0;

auv.Xdotu = -0.93;
auv.Xuu = -1.62; %kg/m
auv.Xwq = -35.5;
auv.Xqq = -1.93;

auv.Zdotw = -35.5;
auv.Zdotq = -1.93;
auv.Zww = -131;
auv.Zqq = -0.632;
auv.Zuq = -5.22;
auv.Zuw = -28.6;
auv.Zuudelta = -9.64;

auv.Mdotw = -1.93;
auv.Mdotq = -4.88;
auv.Mww = 3.18;
auv.Mqq = -9.4;
auv.Muq = -2;
auv.Muw = 24;
auv.Muudelta = -6.15;

auv.M = [auv.m-auv.Xdotu,0,auv.m*auv.zg;0,auv.m-auv.Zdotw,-auv.m*auv.xg-auv.Zdotq;auv.m*auv.zg,-auv.m*auv.xg-auv.Mdotw,auv.Iyy-auv.Mdotq];