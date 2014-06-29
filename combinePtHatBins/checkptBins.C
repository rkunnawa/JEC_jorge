#include <TROOT.h>
#include <iostream>
#include <algorithm>
#include <vector>
#include <TVector3.h> 
#include <stdio.h>
#include <string.h>
#include <TFile.h>
#include <TTree.h>
#include <TH1F.h>
#include <TMath.h>
#include <TCanvas.h>
#include <TCut.h>

#define PI 3.14159;
const double leadingjetcut = 20. ; 
bool SavePlot = kTRUE ; 

enum Algo_t {kPF1, kPF2, kPF3, kPF4, kPF5, kPF6, kCalo1, kCalo2, kCalo3, kCalo4, kCalo5, kCalo6} ;

const char* AlgoNames[] = {"ak1PF","ak2PF","ak3PF","ak4PF","ak5PF","ak6PF","ak1Calo","ak2Calo","ak3Calo","ak4Calo","ak5Calo","ak6Calo"};
const Int_t nBin = 12 ;

const Double_t jetPtBin[] = {10, 20, 30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,400};
const int nJetPtBin = sizeof(jetPtBin)/sizeof(Double_t)-1 ;

void makeMultiPanelCanvas(TCanvas*& canv, const Int_t columns, 
                          const Int_t rows, const Float_t leftOffset=0.,
                          const Float_t bottomOffset=0., 
                          const Float_t leftMargin=0.2, 
                          const Float_t bottomMargin=0.2,
                          const Float_t edge=0.05);

void checkptBins.C(){

//  gROOT->ProcessLine(".x rootlogon.C");
  gROOT->ProcessLine(".L format1Dhisto.C");
  gROOT->ProcessLine(".L formatTGraph.C");
//  gROOT->ProcessLine(".x betterColors.C");
  //TFile *FileA = TFile::Open(Form("correctedFileForBtag.root"));




}
