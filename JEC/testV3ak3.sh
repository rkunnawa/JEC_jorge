#! /bin/sh -f
echo "Running for dijet........... "
# Generate the response

jet_response_analyzer_x  largeEta_binning_ptRebin.config -input dijet_pp_mergedpthatbins_2013MCV3ak3.root -useweight true -algs ak3PFJetAnalyzer -drmax 0.3 -output jra_hiF_ak3PF_dijet.root
jet_response_analyzer_x  largeEta_binning_ptRebin.config -input dijet_pp_mergedpthatbins_2013MCV3ak3.root -useweight true -algs ak3CaloJetAnalyzer -drmax 0.3 -output jra_hiF_ak3Calo_dijet.root

# Get the l3 corrections

jet_l3_correction_x -input jra_hiF_ak3PF_dijet.root -era JEC_ak3PF_dijet  -batch true -formats pdf -algs ak3PFJetAnalyzer -output jra_hiF_ak3PF_l3_dijet.root
jet_l3_correction_x -input jra_hiF_ak3Calo_dijet.root -era JEC_ak3Calo_dijet -batch true -formats pdf -algs ak3CaloJetAnalyzer -output jra_hiF_ak3Calo_l3_dijet.root

# use the l3 output and response output to get l2 corrections

jet_l2_correction_x -input jra_hiF_ak3PF_dijet.root -l3input jra_hiF_ak3PF_l3_dijet.root -era JEC_ak3PF_dijet -batch true -formats pdf -algs ak3PFJetAnalyzer -output jra_hiF_ak3PF_l2_dijet.root
jet_l2_correction_x -input jra_hiF_ak3Calo_dijet.root -l3input jra_hiF_ak3Calo_l3_dijet.root -era JEC_ak3Calo_dijet -batch true -formats pdf -algs ak3CaloJetAnalyzer -output jra_hiF_ak3Calo_l2_dijet.root

jet_draw_l2_correction_x -alg ak3PFJetAnalyzer -filename jra_hiF_ak3PF_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf
jet_draw_l2_correction_x -alg ak3CaloJetAnalyzer -filename jra_hiF_ak3Calo_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf

jet_draw_corrections_x -algs ak3pf -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_ak3PF_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf
jet_draw_corrections_x -algs ak3calo -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_ak3Calo_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf

/bin/mv -f jra_hiF_ak3*root JEC*txt L3*pdf Closure_ak3*root Corrections_Overview_*.root testCorrectionFiles/


