
ParticleDefinitions[GaugeES] = {
      {SdL,  {  Description -> "Left Down-Squarks"}},
      {SdR,  { Description -> "Right Down-Squarks"}},
      {SuL,  { Description -> "Left Up-Squarks"}}, 
      {SuR,  { Description -> "Right Up-Squarks" }},                
      {SeL,  { Description -> "Left Selectron"}}, 
      {SeR,  { Description -> "Right Selectron"}},                         
      {SvL,  { Description -> "Left Sneutrino"}},                         
      {SHd0, { Description -> "Neutral Down-Higgs"}},                         
      {SHdm, { Description -> "Charged Down-Higgs"}}, 
      {SHu0, { Description -> "Neutral Up-Higgs"}},                         
      {SHup, { Description -> "Charged Up-Higgs"}},                                                   
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}},    
      {Glu,  { Description -> "Gluino"}},
      {Wino, { Description -> "Wino"}},
      {Bino, { Description -> "Bino"}},                                                                                           
      {H0,   { Description -> "Neutral Higgsinos"}},
      {HC,   { Description -> "Charged Higgsinos"}},
      {Fd1,  { Description -> "Dirac Left Down-Quark"}},
      {Fd2,  { Description -> "Dirac Right Down-Quark"}},
      {Fu1,  { Description -> "Dirac Left Up-Quark"}},
      {Fu2,  { Description -> "Dirac Right Up-Quark"}},
      {Fe1,  { Description -> "Dirac Left Electron"}},
      {Fe2,  { Description -> "Dirac Right Electron"}},
      {Fv1,   { Description -> "Neutrinos" }},
      {FVR,   { LaTeX -> "\\nu^R",
                OutputName -> "FVR",
               FeynArtsNr -> 61,
               PDG -> {0,0,0} }},
      {SvR,  { Description -> "Right Sneutrino",
               LaTeX ->"\\tilde{\\nu}_R",
               PDG -> {0,0,0} }},
      {SsR,  { Description -> "Singlet",
               PDG -> {0,0,0}}},
      {FS, {Description -> "Singlino",
               PDG -> {0,0,0} }}
      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
      {Sd ,  { Description -> "Down-Squarks"}},
      {Su ,  { Description -> "Up-Squarks"}},   
      {Se ,  { Description -> "Sleptons"}}, 
      {SvRe,  { Description -> "CP-even Sneutrino",
		PDG->{1000012,1000014,1000016,2000012,2000014,2000016,3000012,3000014,3000016},
                PDG.IX ->{201000001,201000002,201000003,201000004,201000005,201000006,201000007,201000008,201000009}}},
      {SvIm ,  {Description -> "CP-odd Sneutrino",
		 PDG->{4000012,4000014,4000016,5000012,5000014,5000016,6000012,6000014,6000016},
                PDG.IX ->{202000001,202000002,202000003,202000004,202000005,202000006,202000007,202000008,202000009}}},                              
      {hh ,  { Description -> "Higgs"}}, 
      {Ah ,  { Description -> "Pseudo-Scalar Higgs"}},                       
      {Hpm,  { Description -> "Charged Higgs"}},                                                   
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson"}}, 
      {VG,   { Description -> "Gluon" }},          
      {VWm,  { Description -> "W-Boson" }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWm,  { Description -> "Negative W-Boson Ghost"}}, 
      {gWmC, { Description -> "Positive W-Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},             
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos",
               PDG -> {12,14,16,112,114,116,212,214,218},
               PDG.IX ->{111000001,111000002,111000003,111000004,111000005,111000006,111000007,111000008,111000009 } }},  
      {Glu,  { Description -> "Gluino" }},
      {Chi,  { Description -> "Neutralinos"}},
      {Cha,  { Description -> "Charginos"}}                                                                                               
        };    
        
        
        
 WeylFermionAndIndermediate = {
       {FHd0, { Description -> "Neutral Down-Higgsino"}},      
       {FHu0, { Description -> "Neutral Up-Higgsino" }}, 
       {FHdm, { Description -> "Charged Down-Higgsino"}},       
       {FHup, { Description -> "Charged Up-Higgsino"}},
       {L0,   { Description -> "Neutralino Weyl-Spinor"}},
       {Lm,   { Description -> "Negative Chargino Weyl-Spinor"}},
       {Lp,   { Description -> "Positive Chargino Weyl-Spinor"}}, 
       {fG,   { Description ->"Gluino Weyl-Spinor"}},
       {fWB,  { Description ->"Wino Weyl-Spinor"}},
       {fW0,  { Description ->"Neutral Wino" }},
       {fWm,  { Description ->"Negative Wino"}},                 
       {fWp,  { Description ->"Positive Wino"}},                 
       {fB,   { Description ->"Bino Weyl-Spinor"}},    
       {phid, { Description -> "Scalar Down"}},                                                                       
       {phiu, { Description -> "Scalar Up"}}, 
       {sigmad,   { Description -> "Pseudo Scalar Down"}},                                                                                        
       {sigmau,   { Description -> "Pseudo Scalar Up" }},
       {SHd,  { Description -> "Down-Higgs"}},
       {SHu,  { Description -> "Up-Higgs"}},
       {Sl,   { Description -> "Left Slepton" }},
       {Sq,   { Description -> "Left Squark" }},
       {FeL,  { Description -> "Left Electron" }},
       {FeR,  { Description -> "Right Electron" }} ,
       {FdL,  { Description -> "Left Down-Quark" }},
       {FdR,  { Description -> "Right Down-Quark" }},              
       {FuL,  { Description -> "Left Up-Quark" }},
       {FuR,  { Description -> "Right Up-Quark" }},
       {FEL,  { Description -> "Rotated Left Electron" }},
       {FER,  { Description -> "Rotated Right Electron" }} ,
       {FDL,  { Description -> "Rotated Left Up-Quark" }},
       {FDR,  { Description -> "Rotated Right Up-Quark" }},              
       {FUL,  { Description -> "Rotated Left Down-Quark"}},
       {FUR,  { Description -> "Rotated Right Down-Quark" }},                
       {FHd,  { Description -> "Down-Higgsino" }},
       {FHu,  { Description -> "Up-Higgsino" }},
       {Fl,   { Description -> "Left Leptons"}},
       {Fq,   { Description -> "Left Quarks"}},  
       {FvL,  { Description -> "Left Neutrino"}}, 
       {FV,   { Description -> "Left-Neutrino-Masseigenstate"}}, 
       {e,    { Description -> "Right Electron Superfield" }},
       {d,    { Description -> "Right Down-Quark Superfield" }},                 
       {q,    { Description -> "Left Quark Superfield" }},                 
       {u,    { Description -> "Right Up-Quark Superfield" }},                 
       {l,    { Description -> "left Lepton Superfield" }},  
       {Hd,   { Description -> "Down-Higgs Superfield"}},                                         
       {Hu,   { Description -> "Up-Higgs Superfield" }},                 
       {G,    { Description -> "Gluon Superfield" }},                 
       {B,    { Description -> "B Superfield" }},                 
       {WB,   { Description -> "W Superfield" }},
       {FvR,  { Description -> "Right Neutrino"}},   
       {v,    { Description -> "Right Neutrino Superfield" }}, 
       {s,    { Description -> "Singlet Superfield" }}, 
       {FsR,   { Description -> "Weyl Spinor of Singlino" }},
       {sigmaS, {LaTeX -> "\\sigma_S"}},
       {sigmaL, {LaTeX -> "\\sigma_L"}},
       {sigmaR, {LaTeX -> "\\sigma_R"}},
       {phiS, {LaTeX -> "\\phi_S"}},
       {phiL, {LaTeX -> "\\phi_L"}},
       {phiR, {LaTeX -> "\\phi_R"}}
      
    
    };                 
