#include "TROOT.h"
#include "TString.h"
#include <iostream>
#include "TFile.h"
#include "TTree.h"
#include "TDirectory.h"
using namespace std;

void skimRootFile(const char *infile="/mnt/hadoop/cms/store/user/dgulhan/pPb_Q01/prod13/HiForest_v72_merged02/Q01_prod13_v72_merged_forest_0.root", const char *outfile = "output.root")
{

  //Reset ROOT and connect tree file
  gROOT->Reset();

  TFile *fin = TFile::Open(infile, "readonly");
  cout<<infile<<endl;
  TFile *fout=new TFile(outfile,"RECREATE"); 
 
  const Int_t nTrees=5;
  string* Tdir[nTrees] = {
    "hiEvtAnalyzer",
    "skimanalysis",
    "ak3PFJetAnalyzer",
    "akPu3PFCones",
    "akPu3PFCones"};

  string* Tname[nTrees] = {
    "HiTree",
    "HltTree",
    "t",
    "ntRandom0",
    "ntRandom1"};

  TTree *t_in[nTrees];
  TTree *t_out[nTrees];

  for (Int_t iT=0; iT<nTrees; iT++){ 
     
    if ( fout->cd(Form("%s",Tdir[iT]))  ==kFALSE){ 
      fout->mkdir(Form("%s",Tdir[iT]));
      cout<<"Ok I will create it then! "<<endl;
    }
    fout->cd(Form("%s",Tdir[iT]));
    
    t_in[iT] = (TTree*)fin->Get(Form("%s/%s",Tdir[iT],Tname[iT]));
    t_out[iT] = t_in[iT]->CloneTree(0);

    float fentries = (float)t_in[iT]->GetEntries();
    cout<<"in entries: "<<fentries<<endl;
    for (Long64_t i=0; i<fentries; i++){
      t_in[iT]->GetEntry(i);
      t_out[iT]->Fill();
    }
    cout<<"out entries: "<<(float)t_out[iT]->GetEntries()<<endl;
    cout<<"Copying:: "<<Form("%s",Tdir[iT])<<"/"<<Form("%s",Tname[iT])<<endl;
    t_out[iT]->AutoSave();
    }
  fout->Close();
}
