Off[General::spell]
Print["Model file for the MSSM with Seesaw II loaded"];

ModelName = "SeesawII";
ModelNameLaTeX ="MSSM with Seesaw II";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

Fields[[1]] = {{uL,  dL},  3, q,   1/6, 2, 3};  
Fields[[2]] = {{vL,  eL},  3, l,  -1/2, 2, 1};
Fields[[3]] = {{Hd0, Hdm}, 1, Hd, -1/2, 2, 1};
Fields[[4]] = {{Hup, Hu0}, 1, Hu,  1/2, 2, 1};

Fields[[5]] = {conj[dR], 3, d,  1/3, 1, -3};
Fields[[6]] = {conj[uR], 3, u, -2/3, 1, -3};
Fields[[7]] = {conj[eR], 3, e,    1, 1,  1};

Fields[[8]] = {{{Tpp,1/Sqrt[2] Tp},{1/Sqrt[2] Tp, T0}}, 1, t, 1, 3, 1};
Fields[[9]] = {{{T0b,1/Sqrt[2] Tm},{1/Sqrt[2] Tm, Tmm}}, 1, tb, -1, 3, 1};
Fields[[10]] = {S, 1, s, -2/3, 1, 6};
Fields[[11]] = {conj[Sc], 1, sb, 2/3, 1, -6};
Fields[[12]] = {{z1,z2}, 1, z, 1/6, 2, 3};
Fields[[13]] = {{z1b,z2b}, 1, zb, -1/6, 2, -3};



(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)


SuperPotential = { {{1, Yu},{u,q,Hu}}, {{-1,Yd},{d,q,Hd}},
                   {{-1,Ye},{e,l,Hd}}, {{1,\[Mu]},{Hu,Hd}},
                   {{1/Sqrt[2],Yt, epsTensor[lef1,lef2] epsTensor[lef2b,lef3]},{l,t,l}},
                   {{1/Sqrt[2],Ys},{d,s,d}},
                   {{1,Yz},{d,z,l}},
                   {{1/Sqrt[2],L1,epsTensor[lef1,lef2] epsTensor[lef2b,lef3]},{Hd,t,Hd}},
                   {{1/Sqrt[2],L2,epsTensor[lef1,lef2] epsTensor[lef2b,lef3]},{Hu,tb,Hu}},
                   {{1,MT,epsTensor[lef1,lef2b] epsTensor[lef1b,lef2]},{t,tb}},{{1,MZ},{z,zb}},{{1,MS},{s,sb}},
                   {{1,MNuL},{l,Hu,l,Hu}}};






(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

DeleteParticles={t,tb,s,sb,z,zb};

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)


DEFINITION[GaugeES][GaugeFixing]=
		{ {Der[VWB],  -1/(2 RXi[W])},
  		  {Der[VG],   -1/(2 RXi[G]) }};;

(* ----- After EWSB ----- *)


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector]= 
{{VWB,{1,{VWm,1/Sqrt[2]},{conj[VWm],1/Sqrt[2]}},
      {2,{VWm,-\[ImaginaryI]/Sqrt[2]},{conj[VWm],\[ImaginaryI]/Sqrt[2]}},
      {3,{VP,Sin[ThetaW]},{VZ,Cos[ThetaW]}}},
 {VB, {1,{VP,Cos[ThetaW]},{VZ,-Sin[ThetaW]}}},
 {fWB,{1,{fWm,1/Sqrt[2]},{fWp,1/Sqrt[2]}},
      {2,{fWm,-\[ImaginaryI]/Sqrt[2]},{fWp,\[ImaginaryI]/Sqrt[2]}},
      {3,{fW0,1}}}};
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid, \
1/Sqrt[2]}},
   {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu, \
1/Sqrt[2]}}};


 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{SvL}, {Sv, ZV}},
     {{phid, phiu}, {hh, ZH}},
     {{sigmad, sigmau}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0}, {L0, ZN}}, 
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}   
       }; 


(*--- Gauge Fixing ---- *)

DEFINITION[EWSB][GaugeFixing]=
  {	{Der[VP],                                            - 1/(2 RXi[P])},	
	{Der[VWm]+\[ImaginaryI] Mass[VWm] RXi[W] Hpm[{1}],   - 1/(RXi[W])},
	{Der[VZ] - Mass[VZ] RXi[Z] Ah[{1}],                  - 1/(2 RXi[Z])},
	{Der[VG],                                            - 1/(2 RXi[G])}};

DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
    }; 
																	

(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

dirac[[1]] = {Fd,  FDL, conj[FDR]};
dirac[[2]] = {Fe,  FEL, conj[FER]};
dirac[[3]] = {Fu,  FUL, conj[FUR]};
dirac[[4]] = {Fv,  FvL, 0};
dirac[[5]] = {Chi, L0, conj[L0]}; 
dirac[[6]] = {Cha, Lm, conj[Lp]};
dirac[[7]] = {Glu, fG, conj[fG]}; 

(* Unbroken EW *)

dirac[[8]] = {Bino, fB, conj[fB]};
dirac[[9]] = {Wino, fWB, conj[fWB]};
dirac[[10]] = {H0, FHd0, conj[FHu0]};
dirac[[11]] = {HC, FHdm, conj[FHup]};
dirac[[12]] = {Fd1, FdL, 0};
dirac[[13]] = {Fd2, 0, FdR};
dirac[[14]] = {Fu1, FuL, 0};
dirac[[15]] = {Fu2, 0, FuR};
dirac[[16]] = {Fe1, FeL, 0};
dirac[[17]] = {Fe2, 0, FeR};


(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            *)
            
SpectrumFile= None;		

	

