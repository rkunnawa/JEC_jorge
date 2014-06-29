JEC_jorge
=========

All the JEC macros and setup scripts taken from Jorge after he left. 

here is the email from Jorge about the setup 


The JEC is located here
/net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen


The general Idea of the JEC procedure could be outlined in the following:

-Once the  MC samples (in pTHat bins format) are ready, they need to be stitched up using the cross-section for corresponding to each bin. The script (combinePtHatBins/testV3_PbP.sh) does this. It executes the root macro (weight_PtHatBins_DijetsV4.C) which read in one ptHat root file at a time and sets a weight value for all the entries in the pThat bin, this weight is set using the assigned cross-sectiona and the number of events. The all the different ptHat bin files with different weight value each, are put together into a single root file using "hadd". To make sure the stitching worked fine, plot the jtpt distribution using the weights

t->Draw("jtpt","weight*(jtpt>30 && jtpt<400 && abs(jteta<2))")

It is important to use the weight this way. The "jtpt" distribution should be smooth, without any kinks.

-The next step is to actually calculate the corrections using the script in (JEC/testV3_Pbp.sh) This script executes a few macros in sequence, these macros are actually located in here:
/net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/JetMETAnalysis/JetAnalyzers/bin

  * jet_response_analyzer_x: Sets the binning, reading in "largeEta_binning_ptRebin.config", it also reads in the stitched root file, once the weight have been set. Outputs a root file "jra_hiF_ak3PF_dijet.root" for each jet algorithm.
  * jet_l3_correction_x: Takes the output of the previous binary as input, The L3 correction fits the pT spectrum for all \eta. This  is a very rough approach to fitting the spectrum. This binary will attempt a different fitting function for each algorithm being defined, we usually stick to PF and Calo. This is one of the things we had to deal with, attempting the fits with different functions. The L3 fits usually are good, if they don't look ok something serious is going on. The binary tries to fit the Corrections and the Response individually.  The functions used to fit the spectrum are a bit obscure, no real physics behind their definition, they just do a "good job" fitting the spectrum. A txt file with the correction values should be produced for each algo.
  * jet_l2_correction_x: Takes the output of the previous binary as input. The L2 Correction fits the pT spectrum again, only that it does a fit for every \eta bin. The L2 are more susceptible to see weird spikes and making the fits go awry. Same deal with the function used for the fits as for L3. If the fits are not good a few things should be checked. A txt file with the correction values should be produced for each algo.
       a\ Check that you have enough statistics in each \eta,\pT bin, if you have weird fluctuation due to statistics. You might want to change your bin definitions in the .confifg file
      b\ Check that the the first pT does indeed starts at a higher value that the lowest edge of the pThat bins or the MC data.
      c\ Try different fit functions
      d\ Make sure that the reconstruction threshold(when requesting MC samples) is set at 1 GeV, the default for HI is 10 GeV, but for JEC estimation we need it at 1.
  * jet_draw_l2_correction_x: This binary takes the L2 correction output files and draw the various fits in pdf format for easy viewing. There should be a root file where the plots can also be accessed.
  * jet_draw_corrections_x: This makes Pdf version of the L3 corrections.

Anytime you make a change to these binaries make sure you recompile.

Once the fits look decent, there should a plot that shows the correction values themselves, the should be un the range [0.8,3] a correction factor of error a very large number will give problems.  A crazy number as a correction points to a bad fit. 

-The next step is to apply the corrections and test that they actually make sense. The idea is to get the "stitched" file, read all the entries of the file and correct pT of each jet as a function of pT and \eta. That is done with the script (combinePtHatBins/testV3_corr_PbP.sh). It actually executes the same root macro used to stitch the file together, only with a boolean set as true. This will fill a variable called "corrpt" which is the corrected pT. using the txts file that were produced.  The naming convention of the txt file matter here, be careful.

-Once the corrections have been filled into corrpt, is necessary to make a closure test, this is to compare the generated pT distribution to the once that were reconstructed and corrected. the expected value should be at 1 The plotting of the corrections i done with a macro named (JetResponseMacro_Pt.C & JetResponseMacro_Eta.C). They plot the the width and mean of the distributions of corr/refpt  as a function of refpt, using Guassian fits. It is expected to have the mean around 1 (good closure) and the width to be as small as possible (good resolution). 

The next step is to generated the DB payloads, the ones included in the GlobalTags so the corrections are done as part of the regular HI reconstruction, will send that in a separate email. 