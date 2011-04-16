

MINPAR={m0,m12,TanBeta,SignumMu,Azero};
RealParameters = {TanBeta};
ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];


BoundaryHighScale={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mHd2, m0^2},
{mHu2, m0^2},
{mHw32, DIAGONAL m0^2},
{mHx32, DIAGONAL m0^2},
{mHxb32, DIAGONAL m0^2},
{mHb32, DIAGONAL m0^2},
{mHg32, DIAGONAL m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{MWM3,LHInput[MWM3]},
{MXM3,MWM3},
{MBM3,MWM3},
{MGM3,MWM3},
{B[MWM3],0},
{B[MXM3],0},
{B[MBM3],0},
{B[MGM3],0},
{Yb3,LHInput[Yb3]},
{Yx3,Yb3},
{Yw3,Yb3},
{T[Yb3],Azero*Yb3},
{T[Yx3],Azero*Yb3},
{T[Yw3],Azero*Yb3}
};


Thresholds={
{Abs[MWM3IN[1,1]],{Hx3[1],Hxb3[1],Hg3[1],Hb3[1],Hw3[1]}},
{Abs[MWM3IN[2,2]],{Hx3[2],Hxb3[2],Hg3[2],Hb3[2],Hw3[2]}},
{Abs[MWM3IN[3,3]],{Hx3[3],Hxb3[3],Hg3[3],Hb3[3],Hw3[3]}}
};


ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


BoundaryConditionsUp=Table[{},{Length[Thresholds]}];
BoundaryConditionsDown=Table[{},{Length[Thresholds]}];

BoundaryConditionsDown[[1]]={
{MNuL[index1,index2],1/2 Yw3[3,index1] Yw3[index2,3]/MassOfHw3[3] +3/10 Yb3[3,index1] Yb3[index2,3]/MassOfHb3[3]}
};

BoundaryConditionsDown[[2]]={
{MNuL[index1,index2],MNuL[index1,index2] + 1/2 Yw3[2,index1] Yw3[index2,2]/MassOfHw3[2] +3/10 Yb3[2,index1] Yb3[index2,2]/MassOfHb3[2]}
};

BoundaryConditionsDown[[3]]={
{MNuL[index1,index2],MNuL[index1,index2] + 1/2 Yw3[1,index1] Yw3[index2,1]/MassOfHw3[1] +3/10 Yb3[1,index1] Yb3[index2,1]/MassOfHb3[1]}
};


(* Not yet included in public version *)

AddLowEnergyConstraint=False;


