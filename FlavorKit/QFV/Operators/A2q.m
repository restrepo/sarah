(* Code automatically generated by 'PreSARAH' *) 
(* Expressions for amplitudes are obtained by FeynArts/FormCalc *) 
(* This file is supposed to be loaded and used by SARAH *) 
(* Created at 11:59 on 3.4.2014 *) 
 
 
PrintDebug["   ... ",A2q]; 
NamesParticles =  {DownQuark, bar[DownQuark], PseudoScalar}; 
 NamesOperators =  {OAh2qSL, OAh2qSR}; 
 NameProcess = A2q; 
 
Generate[A2q][file_]:=Block[{i,j,k}, 
 

 (* Creating all possible processes; extract information about involved masses/couplings *) 


(* ------------------------------- *)
(* {DownQuark, bar[DownQuark], PseudoScalar} *)
(* ------------------------------- *)
 
GetInformtion2Fermion1BosonProcess[DownQuark,bar[DownQuark],PseudoScalar,A2q,file]; 
NeededMassesAll=Intersection[NeededMasses];
NeededCouplingsAll=Intersection[NeededCouplings];
WriteCodeObservablePreSARAH[A2q][NeededMassesAll,NeededCouplingsAll,TreeContributions,WaveContributions,PenguinContributions,file]; 
NeededMassAllSaved[A2q] = masses 
]; 

WriteCodeObservablePreSARAH[A2q][masses_,couplings_,tree_,wave_,penguin_,file_] :=Block[{i,j,k,fermions,scalars}, 
 
NeededMassesAllSaved[A2q] = masses; 
NeededCouplingsAllSaved[A2q] = couplings; 
NeededCombinations[A2q] = {{2, 1, ALL}, {3, 1, ALL}, {3, 2, ALL}}; 
PrintDebug["     writing SPheno code for ",A2q]; 
MakeSubroutineTitle["CalculateA2q",Flatten[{masses,couplings}],{"gt1","gt2","gt3","OnlySM"}, 
{"OAh2qSL", "OAh2qSR"},file]; 
WriteString[file,"! ---------------------------------------------------------------- \n"]; 
WriteString[file,"! Code based on automatically generated SARAH extensions by 'PreSARAH' \n"]; 
WriteString[file,"! Expressions for amplitudes are obtained by FeynArts/FormCalc \n"]; 
WriteString[file,"! Based on user input for process A2q \n"]; 
WriteString[file,"! 'PreSARAH' output has been generated  at 11:59 on 3.4.2014 \n"]; 
WriteString[file,"! ---------------------------------------------------------------- \n \n"]; 
 
 
WriteString[file,"Implicit None \n"]; 
MakeVariableList[Flatten[{couplings,masses}],",Intent(in)",file];
WriteString[file,"Integer,Intent(in) :: gt1, gt2,gt3 \n"];
WriteString[file,"Integer :: gt4 \n"];
WriteString[file,"Logical, Intent(in) :: OnlySM \n"];
WriteString[file,"Integer :: iprop, i1, i2, i3, i4 \n"];
WriteString[file,"Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx12,MassEx22,MassEx32 \n"];
WriteString[file,"Complex(dp), Intent(out) :: OAh2qSL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: OAh2qSR \n"]; 
WriteString[file,"Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  \n"];
WriteString[file,"Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  \n"];
WriteString[file,"Complex(dp) ::  chargefactor  \n"];
WriteString[file,"Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R \n\n"];

WriteString[file,"Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 \n\n"];

WriteString[file,"Iname=Iname+1 \n"];
WriteString[file,"NameOfUnit(Iname)='CalculateA2q' \n
"];
 
AddCalcSquaredMasses[masses,file]; 
(* Initaliziation *)
WriteString[file,"Finite=1._dp \n"];
WriteString[file,"MassEx1="<>SPhenoMass[DownQuark,gt1]<>"  \n"];
WriteString[file,"MassEx12="<>SPhenoMassSq[DownQuark,gt1]<>" \n"];
WriteString[file,"MassEx2="<>SPhenoMass[bar[DownQuark],gt2]<>"  \n"];
WriteString[file,"MassEx22="<>SPhenoMassSq[bar[DownQuark],gt2]<>" \n"];
WriteString[file,"MassEx3="<>SPhenoMass[PseudoScalar,gt3]<>"  \n"];
WriteString[file,"MassEx32="<>SPhenoMassSq[PseudoScalar,gt3]<>" \n"];
WriteString[file,"! ------------------------------ \n "];
WriteString[file,"! Amplitudes for external states \n "];
WriteString[file,"! {DownQuark, bar[DownQuark], PseudoScalar} \n "];
WriteString[file,"! ------------------------------ \n \n"];
WriteString[sphenoTeX,"\\section{External states: $"<>TeXOutput[{DownQuark[{gt1}], bar[DownQuark][{gt2}], PseudoScalar[{gt3}]}]<>"$} \n"];
WriteString[file,"OAh2qSL=0._dp \n"]; 
WriteString[file,"OAh2qSR=0._dp \n"]; 
WriteDiagramsObservable[A2q,tree, wave, penguin, file];
WriteString[file,"OAh2qSL=oo16pi2*OAh2qSL \n"]; 
WriteString[file,"OAh2qSR=oo16pi2*OAh2qSR \n"]; 
WriteString[file,"Iname=Iname-1\n\n"]; 
WriteString[file,"End Subroutine CalculateA2q \n\n"]; 
]; 
AddTreeResultPreSARAH[A2q][top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
 Switch[top,  (* Check topology *) 
  1, 
	 	 WriteString[file,"  OAh2qSL=OAh2qSL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OAh2qSR=OAh2qSR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
]; 


AddPenguinResultPreSARAH[A2q][top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
 Switch[top,  (* Check topology *) 
  1, 
  Switch[type,  (* Check the generic type of the diagram *) 
	SFF, 
	 	 WriteString[file,"  int1=B0(0._dp, mF12, mF22)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(0, mF12, mF22)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C0m(mF22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C0m(mF22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C1m(mF22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C1m(mF22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int4=C2m(mF22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_4= & "<> StringReplace["C2m(mF22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OAh2qSL=OAh2qSL+chargefactor*(coup1R*MassEx1*(coup2R*coup3L*int4*MassEx2 - 1.*coup2L*(coup3R*int3*mF1 + coup3L*(int2 + int3)*mF2)) + coup1L*(coup2R*MassEx2*(coup3L*(int3 + int4)*mF1 + coup3R*(int2 + int3 + int4)*mF2) - 1.*coup2L*(coup3L*int2*mF1*mF2 + coup3R*(int1 + int3*MassEx12 - 1.*int2*MassEx22 - 1.*int3*MassEx22 - 1.*int4*MassEx22 + int2*mS12))))\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSL= & "<> StringReplace["chargefactor (coup1R MassEx1 (coup2R coup3L I_4 MassEx2 - coup2L (coup3R I_3 mF1 + coup3L (I_2 + I_3) mF2)) + coup1L (coup2R MassEx2 (coup3L (I_3 + I_4) mF1 + coup3R (I_2 + I_3 + I_4) mF2) - coup2L (coup3L I_2 mF1 mF2 + coup3R (I_1 + I_3 MassEx12 - I_2 MassEx22 - I_3 MassEx22 - I_4 MassEx22 + I_2 mS12))))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OAh2qSR=OAh2qSR+chargefactor*(coup1L*MassEx1*(coup2L*coup3R*int4*MassEx2 - 1.*coup2R*(coup3L*int3*mF1 + coup3R*(int2 + int3)*mF2)) + coup1R*(coup2L*MassEx2*(coup3R*(int3 + int4)*mF1 + coup3L*(int2 + int3 + int4)*mF2) - 1.*coup2R*(coup3R*int2*mF1*mF2 + coup3L*(int1 + int3*MassEx12 - 1.*int2*MassEx22 - 1.*int3*MassEx22 - 1.*int4*MassEx22 + int2*mS12))))\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSR= & "<> StringReplace["chargefactor (coup1L MassEx1 (coup2L coup3R I_4 MassEx2 - coup2R (coup3L I_3 mF1 + coup3R (I_2 + I_3) mF2)) + coup1R (coup2L MassEx2 (coup3R (I_3 + I_4) mF1 + coup3L (I_2 + I_3 + I_4) mF2) - coup2R (coup3R I_2 mF1 mF2 + coup3L (I_1 + I_3 MassEx12 - I_2 MassEx22 - I_3 MassEx22 - I_4 MassEx22 + I_2 mS12))))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FSS, 
	 	 WriteString[file,"  int1=C0m(mF12, mS22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["C0m(mF12, mS22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C1m(mF12, mS22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C1m(mF12, mS22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C2m(mF12, mS22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C2m(mF12, mS22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OAh2qSL=OAh2qSL+chargefactor*coup3*(coup1R*coup2L*int3*MassEx1 + coup1L*coup2R*int2*MassEx2 - 1.*coup1L*coup2L*int1*mF1)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSL= & "<> StringReplace["chargefactor coup3 (coup1R coup2L I_3 MassEx1 + coup1L coup2R I_2 MassEx2 - coup1L coup2L I_1 mF1)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OAh2qSR=OAh2qSR+chargefactor*coup3*(coup1L*coup2R*int3*MassEx1 + coup1R*coup2L*int2*MassEx2 - 1.*coup1R*coup2R*int1*mF1)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSR= & "<> StringReplace["chargefactor coup3 (coup1L coup2R I_3 MassEx1 + coup1R coup2L I_2 MassEx2 - coup1R coup2R I_1 mF1)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	VFF, 
	 	 WriteString[file,"  int1=B0(0._dp, mF12, mF22)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(0, mF12, mF22)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C0m(mF22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C0m(mF22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C1m(mF22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C1m(mF22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int4=C2m(mF22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_4= & "<> StringReplace["C2m(mF22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OAh2qSL=OAh2qSL+2.*chargefactor*(-1.*coup1R*coup2R*MassEx1*(coup3L*int3*mF1 + coup3R*(int2 + int3)*mF2) + coup1L*(coup2L*MassEx2*(coup3R*(int3 + int4)*mF1 + coup3L*(int2 + int3 + int4)*mF2) + coup2R*(2.*coup3R*int2*mF1*mF2 - 1.*coup3L*(Finite - 2.*int1 - 2.*int3*MassEx12 + 2.*int2*MassEx22 + 2.*int3*MassEx22 + 2.*int4*MassEx22 - 2.*int2*mV12))))\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSL= & "<> StringReplace["2 chargefactor (-(coup1R coup2R MassEx1 (coup3L I_3 mF1 + coup3R (I_2 + I_3) mF2)) + coup1L (coup2L MassEx2 (coup3R (I_3 + I_4) mF1 + coup3L (I_2 + I_3 + I_4) mF2) + coup2R (2 coup3R I_2 mF1 mF2 - coup3L (1 - 2 I_1 - 2 I_3 MassEx12 + 2 I_2 MassEx22 + 2 I_3 MassEx22 + 2 I_4 MassEx22 - 2 I_2 mV12))))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OAh2qSR=OAh2qSR+2.*chargefactor*(-1.*coup1L*coup2L*MassEx1*(coup3R*int3*mF1 + coup3L*(int2 + int3)*mF2) + coup1R*(coup2R*MassEx2*(coup3L*(int3 + int4)*mF1 + coup3R*(int2 + int3 + int4)*mF2) + coup2L*(2.*coup3L*int2*mF1*mF2 - 1.*coup3R*(Finite - 2.*int1 - 2.*int3*MassEx12 + 2.*int2*MassEx22 + 2.*int3*MassEx22 + 2.*int4*MassEx22 - 2.*int2*mV12))))\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSR= & "<> StringReplace["2 chargefactor (-(coup1L coup2L MassEx1 (coup3R I_3 mF1 + coup3L (I_2 + I_3) mF2)) + coup1R (coup2R MassEx2 (coup3L (I_3 + I_4) mF1 + coup3R (I_2 + I_3 + I_4) mF2) + coup2L (2 coup3L I_2 mF1 mF2 - coup3R (1 - 2 I_1 - 2 I_3 MassEx12 + 2 I_2 MassEx22 + 2 I_3 MassEx22 + 2 I_4 MassEx22 - 2 I_2 mV12))))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FSV, 
	 	 WriteString[file,"  int1=B0(0._dp, mS12, mV22)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(0, mS12, mV22)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C0m(mF12, mV22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C0m(mF12, mV22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C1m(mF12, mV22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C1m(mF12, mV22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int4=C2m(mF12, mV22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_4= & "<> StringReplace["C2m(mF12, mV22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OAh2qSL=OAh2qSL+chargefactor*coup3*(-1.*coup1R*MassEx1*(coup2L*(2.*int3 + int4)*MassEx2 + coup2R*(2.*int2 + int4)*mF1) + coup1L*(coup2L*(int2 - 1.*int3)*MassEx2*mF1 + coup2R*(int1 + 2.*int4*MassEx12 - 1.*int3*MassEx22 + int2*mF12)))\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSL= & "<> StringReplace["chargefactor coup3 (-(coup1R MassEx1 (coup2L (2 I_3 + I_4) MassEx2 + coup2R (2 I_2 + I_4) mF1)) + coup1L (coup2L (I_2 - I_3) MassEx2 mF1 + coup2R (I_1 + 2 I_4 MassEx12 - I_3 MassEx22 + I_2 mF12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OAh2qSR=OAh2qSR+chargefactor*coup3*(-1.*coup1L*MassEx1*(coup2R*(2.*int3 + int4)*MassEx2 + coup2L*(2.*int2 + int4)*mF1) + coup1R*(coup2R*(int2 - 1.*int3)*MassEx2*mF1 + coup2L*(int1 + 2.*int4*MassEx12 - 1.*int3*MassEx22 + int2*mF12)))\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSR= & "<> StringReplace["chargefactor coup3 (-(coup1L MassEx1 (coup2R (2 I_3 + I_4) MassEx2 + coup2L (2 I_2 + I_4) mF1)) + coup1R (coup2R (I_2 - I_3) MassEx2 mF1 + coup2L (I_1 + 2 I_4 MassEx12 - I_3 MassEx22 + I_2 mF12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FVS, 
	 	 WriteString[file,"  int1=B0(0._dp, mS22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(0, mS22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C0m(mF12, mS22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C0m(mF12, mS22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C1m(mF12, mS22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C1m(mF12, mS22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int4=C2m(mF12, mS22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_4= & "<> StringReplace["C2m(mF12, mS22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OAh2qSL=OAh2qSL+chargefactor*coup3*(coup1R*MassEx1*(coup2R*(int3 + 2.*int4)*MassEx2 + coup2L*(-1.*int2 + int4)*mF1) + coup1L*(coup2R*(2.*int2 + int3)*MassEx2*mF1 - 1.*coup2L*(int1 - 1.*int4*MassEx12 + 2.*int3*MassEx22 + int2*mF12)))\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSL= & "<> StringReplace["chargefactor coup3 (coup1R MassEx1 (coup2R (I_3 + 2 I_4) MassEx2 + coup2L (-I_2 + I_4) mF1) + coup1L (coup2R (2 I_2 + I_3) MassEx2 mF1 - coup2L (I_1 - I_4 MassEx12 + 2 I_3 MassEx22 + I_2 mF12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OAh2qSR=OAh2qSR+chargefactor*coup3*(coup1L*MassEx1*(coup2L*(int3 + 2.*int4)*MassEx2 + coup2R*(-1.*int2 + int4)*mF1) + coup1R*(coup2L*(2.*int2 + int3)*MassEx2*mF1 - 1.*coup2R*(int1 - 1.*int4*MassEx12 + 2.*int3*MassEx22 + int2*mF12)))\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSR= & "<> StringReplace["chargefactor coup3 (coup1L MassEx1 (coup2L (I_3 + 2 I_4) MassEx2 + coup2R (-I_2 + I_4) mF1) + coup1R (coup2L (2 I_2 + I_3) MassEx2 mF1 - coup2R (I_1 - I_4 MassEx12 + 2 I_3 MassEx22 + I_2 mF12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FVV, 
	 	 WriteString[file,"  int1=C0m(mF12, mV22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["C0m(mF12, mV22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C1m(mF12, mV22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C1m(mF12, mV22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C2m(mF12, mV22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C2m(mF12, mV22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OAh2qSL=OAh2qSL+-2.*chargefactor*coup3*(coup1R*coup2R*int3*MassEx1 + coup1L*coup2L*int2*MassEx2 + 2.*coup1L*coup2R*int1*mF1)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSL= & "<> StringReplace["-2 chargefactor coup3 (coup1R coup2R I_3 MassEx1 + coup1L coup2L I_2 MassEx2 + 2 coup1L coup2R I_1 mF1)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OAh2qSR=OAh2qSR+-2.*chargefactor*coup3*(coup1L*coup2L*int3*MassEx1 + coup1R*coup2R*int2*MassEx2 + 2.*coup1R*coup2L*int1*mF1)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSR= & "<> StringReplace["-2 chargefactor coup3 (coup1L coup2L I_3 MassEx1 + coup1R coup2R I_2 MassEx2 + 2 coup1R coup2L I_1 mF1)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
];]; 


AddWaveResultPreSARAH[A2q][top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
 Switch[top,  (* Check topology *) 
  1, 
  Switch[type,  (* Check the generic type of the diagram *) 
	FS | SF , 
	 	 WriteString[file,"  int1=B0(MassEx12, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx12, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx12, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx12, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx12 - 1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSL= & "<> StringReplace["(chargefactor coup3L (coup1L coup2R I_2 MassEx12 - coup1R coup2R I_1 MassEx1 mF1 + coup1R coup2L I_2 MassEx1 MFin - coup1L coup2L I_1 mF1 MFin))/(MassEx12 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx12 - 1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSR= & "<> StringReplace["(chargefactor coup3R (coup1R coup2L I_2 MassEx12 - coup1L coup2L I_1 MassEx1 mF1 + coup1L coup2R I_2 MassEx1 MFin - coup1R coup2R I_1 mF1 MFin))/(MassEx12 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FV | VF , 
	 	 WriteString[file,"  int1=B0(MassEx12, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx12, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx12, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx12, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1R*MassEx1*(-2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)*MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSL= & "<> StringReplace["(chargefactor coup3L (coup1R MassEx1 (-2 coup2L (1 - 2 I_1) mF1 + coup2R (1 + 2 I_2) MFin) + coup1L (coup2L (1 + 2 I_2) MassEx12 - 2 coup2R (1 - 2 I_1) mF1 MFin)))/(MassEx12 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1L*MassEx1*(-2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)*MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSR= & "<> StringReplace["(chargefactor coup3R (coup1L MassEx1 (-2 coup2R (1 - 2 I_1) mF1 + coup2L (1 + 2 I_2) MFin) + coup1R (coup2R (1 + 2 I_2) MassEx12 - 2 coup2L (1 - 2 I_1) mF1 MFin)))/(MassEx12 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
,
  2, 
  Switch[type,  (* Check the generic type of the diagram *) 
	FS | SF , 
	 	 WriteString[file,"  int1=B0(MassEx22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx22 - 1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSL= & "<> StringReplace["(chargefactor coup3L (coup1L coup2R I_2 MassEx22 - coup1R coup2R I_1 MassEx2 mF1 + coup1R coup2L I_2 MassEx2 MFin - coup1L coup2L I_1 mF1 MFin))/(MassEx22 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx22 - 1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSR= & "<> StringReplace["(chargefactor coup3R (coup1R coup2L I_2 MassEx22 - coup1L coup2L I_1 MassEx2 mF1 + coup1L coup2R I_2 MassEx2 MFin - coup1R coup2R I_1 mF1 MFin))/(MassEx22 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FV | VF , 
	 	 WriteString[file,"  int1=B0(MassEx22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1L*MassEx2*(-2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)*MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSL= & "<> StringReplace["(chargefactor coup3L (coup1L MassEx2 (-2 coup2R (1 - 2 I_1) mF1 + coup2L (1 + 2 I_2) MFin) + coup1R (coup2R (1 + 2 I_2) MassEx22 - 2 coup2L (1 - 2 I_1) mF1 MFin)))/(MassEx22 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1R*MassEx2*(-2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)*MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OAh2qSR= & "<> StringReplace["(chargefactor coup3R (coup1R MassEx2 (-2 coup2L (1 - 2 I_1) mF1 + coup2R (1 + 2 I_2) MFin) + coup1L (coup2L (1 + 2 I_2) MassEx22 - 2 coup2R (1 - 2 I_1) mF1 MFin)))/(MassEx22 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
];]; 


