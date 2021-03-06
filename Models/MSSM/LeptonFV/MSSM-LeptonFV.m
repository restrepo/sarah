Off[General::spell]

Model`Name = "MSSMLeptonFV";
Model`NameLaTeX ="MSSM without lepton flavor violation";
Model`Authors = "F.Staub";
Model`Date = "2012-09-01";

(* 2013-09-01: changing to new conventions for Superfields, Superpotential and global symmetries *)



(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],RParity};
RpM = {-1,-1,1};
RpP = {1,1,-1};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,RpM};
Gauge[[2]]={WB, SU[2], left,        g2,True, RpM};
Gauge[[3]]={G,  SU[3], color,       g3,False,RpM};


(* Chiral Superfields *)

SuperFields[[1]] = {q,  3, {uL0,  dL0},    1/6, 2, 3, RpM};  
SuperFields[[2]] = {l,  3, {vL0,  eL0},   -1/2, 2, 1, RpM};
SuperFields[[3]] = {Hd, 1, {Hd0, Hdm},  -1/2, 2, 1, RpP};
SuperFields[[4]] = {Hu, 1, {Hup, Hu0},   1/2, 2, 1, RpP};

SuperFields[[5]] = {d, 3, conj[dR0],  1/3, 1, -3, RpM};
SuperFields[[6]] = {u, 3, conj[uR0], -2/3, 1, -3, RpM};
SuperFields[[7]] = {e, 3, conj[eR0],    1, 1,  1, RpM};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Mu] Hu.Hd + WOp/2 l.Hu.l.Hu;


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};


(* ----- After EWSB ----- *)


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};   
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid, \
1/Sqrt[2]}},
   {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu, \
1/Sqrt[2]}}};


(* ----- Flavors ---- *)
 
DEFINITION[EWSB][Flavors]=
{{FdR0,{FdR,FsR,FbR}}, 
 {FdL0,{FdL,FsL,FbL}},
 {FuL0,{FuL,FcL,FtL}},
 {FuR0,{FuR,FcR,FtR}},
 {SdR0,{SdR,SsR,SbR}}, 
 {SdL0,{SdL,SsL,SbL}},
 {SuL0,{SuL,ScL,StL}},
 {SuR0,{SuR,ScR,StR}}};

(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{SvL0}, {Sv, ZV}},
     {{SeL0, SeR0}, {Se, ZE}},
     {{FvL0}, {FV, UV}}, 
     {{SsL, SsR}, {Ss, ZS}},
     {{ScL, ScR}, {Sc, ZC}},
     {{SbL, SbR}, {Sb, ZB}},
     {{StL, StR}, {St, ZT}},
     {{phid, phiu}, {hh, ZH}},
     {{{FeL0},{conj[FeR0]}},{{FEL,ZEL},{FER,ZER}}},
     {{sigmad, sigmau}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0}, {L0, ZN}}, 
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}}      \
       }; 

DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
    }; 




(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
Fd->{  FdL, FdR},
Fb->{  FbL, FbR},
Fs->{  FsL, FsR},
Fc->{  FcL, FcR},
Ft->{  FtL, FtR},
 Fe ->{  FEL, conj[FER]},
Fu->{  FuL, FuR},
 Fv ->{  FV, conj[FV]},
 Chi ->{ L0, conj[L0]},
 Cha ->{ Lm, conj[Lp]},
 Glu ->{ fG, conj[fG]}
};	


DEFINITION[GaugeES][DiracSpinors]={
Bino ->{  fB, conj[fB]},
Wino ->{ fWB, conj[fWB]},
H0 ->{ FHd0, conj[FHu0]},
HC ->{ FHdm, conj[FHup]},
Fd1 ->{ FdL0, 0},
Fd2 ->{ 0, FdR0},
Fu1 ->{ FuL0, 0},
Fu2 ->{ 0, FuR0},
Fe1 ->{ FeL0, 0},
Fe2 ->{ 0, FeR0},
Fv ->{ FvL0,0},
Glu ->{ fG, conj[fG]}
};



(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            *)
            
SpectrumFile=None;		

	


