/*
I took out all of the other forms of the function because they weren't used in 
the current macro. I changed the parameter modes from pass-by-reference to 
pass-by-value (the compiler was complaining that the function call wasn't 
passing the correct types).
*/

#ifndef formatHist_h
#define formatHist_h

#include <iostream>

#include <TH1.h>
#include <TH2.h>
#include <TAxis.h>

void format1Dhisto(TH1D& h1, double Ymax, double Ymin, double& col, double& Mstyle, double& fill, double style, const char *titx, const char *tity)
{
	//void format1Dhisto(TH1& h1, string& xTitle, double Ymax, double Ymin){

	//h1.SetTitle(";XXXX;XXXX");
	if(Ymax !=- 1 && Ymin != -1)
		h1.GetYaxis()->SetRangeUser(Ymin, Ymax);
	//if(Ymax==-1 && Ymin!=-1) h1.GetYaxis()->SetMinimum(Ymin);
	h1.SetMarkerColor(col);
	h1.SetMarkerStyle(Mstyle);
	h1.SetMarkerSize(0.8);
	h1.SetLineColor(col);
	h1.SetFillColor(fill);
	h1.SetFillStyle(style);
	h1.GetXaxis()->SetTitle(titx);
	h1.GetYaxis()->SetTitle(tity);
	h1.GetXaxis()->CenterTitle();
	h1.GetYaxis()->CenterTitle();
	return;
}
void format1DhistoA(TH1D& h1, double Ymax, double Ymin, double col, double Mstyle, double fill, double style, const char *titx, const char *tity)
{
	//void format1Dhisto(TH1& h1, string& xTitle, double Ymax, double Ymin){

	//h1.SetTitle(";XXXX;XXXX");
	if(Ymax !=- 1 && Ymin != -1)
		h1.GetYaxis()->SetRangeUser(Ymin, Ymax);
	//if(Ymax==-1 && Ymin!=-1) h1.GetYaxis()->SetMinimum(Ymin);
	h1.SetMarkerColor(col);
	h1.SetMarkerStyle(Mstyle);
	h1.SetMarkerSize(0.8);
	h1.SetLineColor(col);
	h1.SetFillColor(fill);
	h1.SetFillStyle(style);
	h1.GetXaxis()->SetTitle(titx);
	h1.GetYaxis()->SetTitle(tity);
	h1.GetXaxis()->CenterTitle();
	h1.GetYaxis()->CenterTitle();
	return;
}

void scaleToBinWidth(TH1 *h1)
{
	double nBins = h1->GetXaxis()->GetNbins();
	for (int iBin = h1->GetXaxis()->GetFirst(); iBin <= h1->GetXaxis()->GetLast(); iBin++) {
		double iW = h1->GetBinWidth(iBin);
		double old = h1->GetBinContent(iBin);
		h1->SetBinContent(iBin, old/iW);
	}
}

#endif
