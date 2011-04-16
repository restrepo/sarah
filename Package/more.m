(*******************************************************************
This file was generated automatically by the Mathematica front end.
It contains Initialization cells from a Notebook file, which
typically will have the same name as this file except ending in
".nb" instead of ".m".

This file is intended to be loaded into the Mathematica kernel using
the package loading commands Get or Needs.  Doing so is equivalent
to using the Evaluate Initialization Cells menu command in the front
end.

DO NOT EDIT THIS FILE.  This entire file is regenerated
automatically each time the parent Notebook file is saved in the
Mathematica front end.  Any changes you make to this file will be
overwritten.
***********************************************************************)


(* Begin["`More`"] *)

(*-----------------------------------------------*)
(* 
  Additional Functions *)
(*-----------------------------------------------*)
\


(* ------------- Check Gauge Anomalies ----------*)


CheckAnomalies :=Block[{i,j},
      
      Print["Check Anomalies"];
      
      For[gaugeNr=1,gaugeNr\[LessEqual]Length[Gauge],
        sumAno=0;
        If[Gauge[[gaugeNr,2]]=!=SU[2],
          For[i=1,i\[LessEqual]Length[Fields],
            states=Fields[[i,2]];
            For[k=1,k\[LessEqual]AnzahlGauge,
              If[(k=!=gaugeNr) && (Gauge[[k,2]]=!=U[1]), 
                states *= Abs[FieldDim[i,k]];
                ];
              k++;];
            If[Gauge[[gaugeNr,2]]===U[1],
              sumAno+=states*FieldDim[i,gaugeNr]^3;
              ChargeFactorField[gaugeNr,Fields[[i,3]]]=FieldDim[i,gaugeNr];,
              If[FieldDim[i,gaugeNr]=!=1,
                  If[FieldDim[i,gaugeNr]>1,
                      
                      nrInd=TestDim[FieldDim[i,gaugeNr],
                          Gauge[[gaugeNr,2,1]]];
                      sumAno+=states*(nrInd[[2]]-nrInd[[3]])^3;,
                      
                      nrInd=TestDim[Abs[FieldDim[i,gaugeNr]],
                          Gauge[[gaugeNr,2,1]]];
                      sumAno+=-states*(nrInd[[2]]-nrInd[[3]])^3;
                      ];
                  ];
              ];
            i++;];
          If[Simplify[sumAno]===0, 
            Print["     No (",Gauge[[gaugeNr,3]] ,")^3 Gauge Anomaly"];,
            If[Cases[sumAno,x_?SymbolQS,2]==={},
                
                Print["     WARNING!  (",Gauge[[gaugeNr,3]] ,
                    ")^3 Gauge Anomaly!"];,
                
                Print["     WARNING!  (",Gauge[[gaugeNr,3]] ,
                    ")^3 Gauge Anomaly depends on choice of" <> 
                      ToString[Cases[sumAno,x_?SymbolQS,2]] ];
                ];
            ];,
          sumDoub=0;
          For[i=1,i\[LessEqual]Length[Fields],
            states=Fields[[i,2]];
            For[k=1,k\[LessEqual]AnzahlGauge,
              If[(k=!=gaugeNr) && (Gauge[[k,2]]=!=U[1]), 
                states *= Abs[FieldDim[i,k]];
                ];
              k++;];
            If[FieldDim[i,gaugeNr]\[Equal]2, 
              sumDoub=sumDoub+states;
              ];
            i++;];
          If[EvenQ[sumDoub]===True, 
            Print["     No Witten Anomaly"];,
            Print["     WARNING!  Odd number of doublets: Witten Anomaly!"];
            ];
          ];
        
        For[gaugeNr2=1,gaugeNr2\[LessEqual]Length[Gauge],
          sumAno=0;
          If[Gauge[[gaugeNr2,2]]===U[1] && gaugeNr2=!= gaugeNr,
            If[Gauge[[gaugeNr,2]]=!=U[1], 
                For[i=1,i\[LessEqual]Length[Fields],
                  states=Fields[[i,2]];
                  For[k=1,k\[LessEqual]AnzahlGauge,
                    
                    If[(k=!=gaugeNr) && (k=!=gaugeNr2) && (Gauge[[k,2]]=!=
                            U[1]), 
                      states *= Abs[FieldDim[i,k]];
                      ];
                    k++;];
                  If[FieldDim[i,gaugeNr]=!=1,
                    If[FieldDim[i,gaugeNr]>1,
                        
                        nrInd=TestDim[FieldDim[i,gaugeNr],
                            Gauge[[gaugeNr,2,1]]];
                        
                        sumAno+=
                          states*
                            FieldDim[i,gaugeNr2]*(nrInd[[2]]-nrInd[[3]])^2;,
                        
                        nrInd=TestDim[Abs[FieldDim[i,gaugeNr]],
                            Gauge[[gaugeNr,2,1]]];
                        
                        sumAno+=
                          states*
                            FieldDim[i,gaugeNr2]*(nrInd[[2]]-nrInd[[3]])^2;
                        ];
                    ];
                  i++;];
                If[Simplify[sumAno]===0,
                  
                  Print["     No (",Gauge[[gaugeNr2,3]] ,")x(",
                      Gauge[[gaugeNr,3]] ,")^2  Gauge Anomaly"];,
                  If[Cases[sumAno,x_?SymbolQS,2]==={},
                      
                      Print["     WARNING!  (",Gauge[[gaugeNr2,3]] ,")x(",
                          Gauge[[gaugeNr,3]] ,")^2 Gauge Anomaly!"];,
                      
                      Print["     WARNING!  (",Gauge[[gaugeNr2,3]] ,")x(",
                          Gauge[[gaugeNr,3]] ,
                          ")^2 Gauge Anomaly depends on choice of "<>ToString[
                              Cases[sumAno,x_?SymbolQS,2]] ];
                      ];
                  ];,
                For[i=1,i\[LessEqual]Length[Fields],
                  states=Fields[[i,2]];
                  For[k=1,k\[LessEqual]AnzahlGauge,
                    
                    If[(k=!=gaugeNr) && (k=!=gaugeNr2) && (Gauge[[k,2]]=!=
                            U[1]), 
                      states *= Abs[FieldDim[i,k]];
                      ];
                    k++;];
                  sumAno+=states*FieldDim[i,gaugeNr2]*FieldDim[i,gaugeNr]^2;
                  i++;];
                If[Simplify[sumAno]===0,
                  
                  Print["     No (",Gauge[[gaugeNr2,3]] ,")x(",
                      Gauge[[gaugeNr,3]] ,")^2  Gauge Anomaly"];,
                  If[Cases[sumAno,x_?SymbolQS,2]==={},
                      
                      Print["     WARNING!  (",Gauge[[gaugeNr2,3]] ,")x(",
                          Gauge[[gaugeNr,3]] ,")^2 Gauge Anomaly!"];,
                      
                      Print["     WARNING!  (",Gauge[[gaugeNr2,3]] ,")x(",
                          Gauge[[gaugeNr,3]] ,
                          ")^2 Gauge Anomaly depends on choice of "<>ToString[
                              Cases[sumAno,x_?SymbolQS,2]]];
                      ];
                  ];
                For[gaugeNr3=1,gaugeNr3\[LessEqual]Length[Gauge],
                  sumAno=0;
                  
                  If[Gauge[[gaugeNr3,2]]===U[1] && gaugeNr3=!= gaugeNr && 
                      gaugeNr3=!= gaugeNr2,
                    For[i=1,i\[LessEqual]Length[Fields],
                      states=Fields[[i,2]];
                      For[k=1,k\[LessEqual]AnzahlGauge,
                        
                        If[(k=!=gaugeNr) && (k=!=gaugeNr2) && (k=!=
                                gaugeNr3) && (Gauge[[k,2]]=!=U[1]), 
                          states *= Abs[FieldDim[i,k]];
                          ];
                        k++;];
                      
                      sumAno+=states*FieldDim[i,gaugeNr2]*FieldDim[i,gaugeNr]*
                          FieldDim[i,gaugeNr3],
                      i++;];
                    If[Simplify[sumAno]===0,
                      If[Cases[sumAno,x_?SymbolQS,2]==={},
                          
                          Print["     No (",Gauge[[gaugeNr2,3]] ,")x(",
                              Gauge[[gaugeNr,3]] ,")x(",Gauge[[gaugeNr3,3]] ,
                              ")  Gauge Anomaly"];,
                          
                          Print["     WARNING!  (",Gauge[[gaugeNr2,3]] ,")x(",
                              Gauge[[gaugeNr,3]] ,")x(",Gauge[[gaugeNr3,3]] ,
                              ") Gauge Anomaly!"];,
                          
                          Print["     WARNING!  (",Gauge[[gaugeNr2,3]] ,")x(",
                              Gauge[[gaugeNr,3]] ,")x(",Gauge[[gaugeNr3,3]] ,
                              ") Gauge Anomaly depends on choice of "<>
                                ToString[Cases[sumAno,x_?SymbolQS,2]]];
                          ];
                      ];
                    ];
                  gaugeNr3++;];
                ];
            ];
          gaugeNr2++;];
        gaugeNr++;];
      
      CheckU1mixing;
      
      ];

SymbolQS[x_]:=If[Head[x]===Symbol,Return[True],Return[False]]

(* ---------- Calculate Tadpole Equations ------- *)

 CalcTadpoleEquations[pot_,vevDef_]:=Block[{TadpoleEquations,vevEx={}},
      
      
      potSave=pot;
      
      Print["Calculate Tadpole Equations"];
      
      TadpoleEquations = {};
      
      For[i=1,i\[LessEqual] Length[vevDef],
        If[FreeQ[vevEx,vevDef[[i,2,1]]],
          
          TadpoleEquations = 
            Join[TadpoleEquations, {Simplify[
                  makeSumAll[
                    CalcDelta[
                        DPV[pot,vevDef[[i,2,1]],1,1]/.Map[vacHead,
                                vacuum]/.Mom[_]\[Rule]0 /.zero[a_]\[Rule]0*
                              a  ]/.sum[gt1,a___]\[Rule]1]]}];
          vevEx = Join[vevEx,{vevDef[[i,2,1]]}];
          ];
        i++;];
      
      Return[TadpoleEquations] /. subAlways;
      
      ]; 

CheckChargeConservation:=Block[{i,j,i1,sum,violation},
      violation=False;
      Print["Checking charge conservation of superpotential"];
      For[i1=1,i1\[LessEqual]Length[Gauge],
        For[i=1,i\[LessEqual]Length[Fields],
          If[Gauge[[i1,2]]===U[1],
            ChargeFactorField[i1,Fields[[i,3]]]=Fields[[i,3+i1]];,
            If[FieldDim[i,i1]\[Equal]1,
                ChargeFactorField[i1,Fields[[i,3]]]=0;,
                If[FieldDim[i,i1]>1,
                    nrInd=TestDim[FieldDim[i,i1],Gauge[[i1,2,1]]];
                    
                    ChargeFactorField[i1,Fields[[i,3]]]=
                      nrInd[[2]]-nrInd[[3]];,
                    nrInd=TestDim[-FieldDim[i,i1],Gauge[[i1,2,1]]];
                    
                    ChargeFactorField[i1,
                        Fields[[i,3]]]=-(nrInd[[2]]-nrInd[[3]]);
                    ];
                ];
            ];
          i++;];
        i1++;];
      
      
      
      For[i=1,i\[LessEqual]Length[SuperPotential],
        For[i1=1,i1\[LessEqual]Length[Gauge],
          sum=0;
          For[j=1,j\[LessEqual]Length[SuperPotential[[i,2]]],
            sum +=ChargeFactorField[i1,SuperPotential[[i,2,j]]];
            j++;];
          If[FullSimplify[sum]=!=0,
            If[Gauge[[i1,2]]===U[1],
                If[Cases[sum,x_?SymbolQS,2]==={},
                  
                  Print["     WARNING! ",Gauge[[i1,3]]," not conserved in ",
                      SuperPotential[[i,2]]];,
                  
                  Print["     WARNING! Conservation of ",Gauge[[i1,3]]," in ",
                      SuperPotential[[i,2]]," depends on choice of ",
                      Cases[sum,x_?SymbolQS,2]];
                  ];
                violation=True;,
                If[Mod[sum,Gauge[[i1,2,1]]]=!=0, 
                    
                    Print["     WARNING! ",Gauge[[i1,3]]," not conserved in ",
                      SuperPotential[[i,2]]];
                    violation=True;
                    ];
                ];
            ];
          i1++;];
        i++;];
      
      
      If[violation\[Equal]False,
        Print["     No violation of charge conservation in superpotential"];
        ];
      
      ];



CreateParameterFile:=Block[{temp,temp2,i,j,description,pos,initpar={}},
      temp = ParameterDefinitions;
        ParameterDefinitions={};
        
        For[i=1,i\[LessEqual]Length[temp],
          If[FreeQ[initpar,temp[[i,1]]],
            description = Description /. temp[[i,2]];
            
            
            If[description===Description || description === None || 
                FreeQ[ParameterDefinitionsMain,description],
              ParameterDefinitions =Join[ParameterDefinitions,{temp[[i]]}];,
              temp2=temp[[i,2]];
              pos = Position[ParameterDefinitionsMain,description][[1,1]];
              For[j=1,j\[LessEqual]Length[ParameterDefinitionsMain[[pos,1]]],
                If[FreeQ[temp2,ParameterDefinitionsMain[[pos,1,j,1]]],
                  temp2 = Join[temp2,{ParameterDefinitionsMain[[pos,1,j]]}];
                  ];
                j++;];
              
              ParameterDefinitions =
                Join[ParameterDefinitions,{{temp[[i,1]],temp2}}];
              ];
            initpar = Join[initpar,{temp[[i,1]]}];
            ];
          i++;];
      
      SA`LHList=
        Select[Table[{ParameterDefinitions[[i,
                  1]],(LesHouches /.ParameterDefinitions[[i,2]])},{i,1,
              Length[ParameterDefinitions]}],(FreeQ[#,LesHouches])&] ;
      
      ];



CreateParticleFile:=Block[{temp,temp2,tempFin,i,j,k,description,pos},
      For[k=1,k\[LessEqual]Length[NameOfStates]+1,
          If[k>Length[NameOfStates],
            temp = WeylFermionAndIndermediate;,
            temp = ParticleDefinitions[NameOfStates[[k]]];
            ];
          tempFin={};
          
          If[Head[temp]===List,
            For[i=1,i\[LessEqual]Length[temp],
              description = Description /. temp[[i,2]];
              
              
              If[description===Description || description === None || 
                  FreeQ[ParticleDefinitionsMain,description],
                tempFin =Join[tempFin,{temp[[i]]}];,
                temp2=temp[[i,2]];
                pos = Position[ParticleDefinitionsMain,description][[1,1]];
                
                For[j=1,
                  j\[LessEqual]Length[ParticleDefinitionsMain[[pos,1]]],
                  If[FreeQ[temp2,ParticleDefinitionsMain[[pos,1,j,1]]],
                    temp2 = Join[temp2,{ParticleDefinitionsMain[[pos,1,j]]}];
                    ];
                  j++;];
                tempFin =Join[tempFin,{{temp[[i,1]],temp2}}];
                ];
              i++;];
            If[k>Length[NameOfStates],
              WeylFermionAndIndermediate = tempFin;,
              ParticleDefinitions[NameOfStates[[k]]] = tempFin;
              ];
            ];
          k++;];
      ];


CheckU1mixing:=Block[{i,temp,pos,listU1,mulfac,i1,i2,pos1,pos2,sum},
      nonDiagonalU1=False;
      mulfac=Table[{0},{Length[Fields]}];
      listU1=Select[Gauge,(#[[2]]===U[1])&];
      If[Length[listU1]>1,
        Print["Checking U(1)'s for orthogonality"];
        For[i=1,i\[LessEqual]Length[Fields],
          states=Fields[[i,2]];
          For[k=1,k\[LessEqual]AnzahlGauge,
            If[(k=!=gaugeNr) && (Gauge[[k,2]]=!=U[1]), 
              states *= Abs[FieldDim[i,k]];
              ];
            k++;];
          mulfac[[i]]=states;
          i++;];
        
        For[i1=1,i1\[LessEqual]Length[listU1],
          pos1=Position[Gauge,listU1[[i1,1]]][[1,1]];
          For[i2=i1+1,i2\[LessEqual]Length[listU1],
            pos2=Position[Gauge,listU1[[i2,1]]][[1,1]];
            
            sum=Sum[mulfac[[j]] Fields[[j,3+pos1]]Fields[[j,3+pos2]],{j,1,
                  Length[Fields]}];
            If[FullSimplify[sum]=!=0,
              
              Print["   U(1)'s not orthogonality: ",Gauge[[pos1,3]]," and ",
                Gauge[[pos2,3]]];
              nonDiagonalU1 = True;
              ];
            i2++;];
          i1++;];
        ];
      
      ];





(* End[] *)