#! /bin/sh -f
echo "Running for dijet........... "
# Generate the response
jet_response_analyzer_x  largeEta_binning_ptRebin.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs ak3PFJetAnalyzer -drmax 0.3 -output jra_hiF_ak3PF_dijet.root
jet_response_analyzer_x  largeEta_binning_ptRebin.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs ak4PFJetAnalyzer -drmax 0.4 -output jra_hiF_ak4PF_dijet.root
jet_response_analyzer_x  largeEta_binning_ptRebin.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs ak5PFJetAnalyzer -drmax 0.5 -output jra_hiF_ak5PF_dijet.root
jet_response_analyzer_x  largeEta_binning_ptRebin.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs ak3CaloJetAnalyzer -drmax 0.3 -output jra_hiF_ak3Calo_dijet.root
jet_response_analyzer_x  largeEta_binning_ptRebin.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs ak4CaloJetAnalyzer -drmax 0.4 -output jra_hiF_ak4Calo_dijet.root
jet_response_analyzer_x  largeEta_binning_ptRebin.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs ak5CaloJetAnalyzer -drmax 0.5 -output jra_hiF_ak5Calo_dijet.root
# Get the l3 corrections
jet_l3_correction_x -input jra_hiF_ak3PF_dijet.root -era JEC_ak3PF_dijet  -batch true -formats pdf -algs ak3PFJetAnalyzer -output jra_hiF_ak3PF_l3_dijet.root
jet_l3_correction_x -input jra_hiF_ak4PF_dijet.root -era JEC_ak4PF_dijet  -batch true -formats pdf -algs ak4PFJetAnalyzer -output jra_hiF_ak4PF_l3_dijet.root
jet_l3_correction_x -input jra_hiF_ak5PF_dijet.root -era JEC_ak5PF_dijet  -batch true -formats pdf -algs ak5PFJetAnalyzer -output jra_hiF_ak5PF_l3_dijet.root
jet_l3_correction_x -input jra_hiF_ak3Calo_dijet.root -era JEC_ak3Calo_dijet -batch true -formats pdf -algs ak3CaloJetAnalyzer -output jra_hiF_ak3Calo_l3_dijet.root
jet_l3_correction_x -input jra_hiF_ak4Calo_dijet.root -era JEC_ak4Calo_dijet -batch true -formats pdf -algs ak4CaloJetAnalyzer -output jra_hiF_ak4Calo_l3_dijet.root
jet_l3_correction_x -input jra_hiF_ak5Calo_dijet.root -era JEC_ak5Calo_dijet -batch true -formats pdf -algs ak5CaloJetAnalyzer -output jra_hiF_ak5Calo_l3_dijet.root

# use the l3 output and response output to get l2 corrections
jet_l2_correction_x -input jra_hiF_ak3PF_dijet.root -l3input jra_hiF_ak3PF_l3_dijet.root -era JEC_ak3PF_dijet -batch true -formats pdf -algs ak3PFJetAnalyzer -output jra_hiF_ak3PF_l2_dijet.root
jet_l2_correction_x -input jra_hiF_ak4PF_dijet.root -l3input jra_hiF_ak4PF_l3_dijet.root -era JEC_ak4PF_dijet -batch true -formats pdf -algs ak4PFJetAnalyzer -output jra_hiF_ak4PF_l2_dijet.root
jet_l2_correction_x -input jra_hiF_ak5PF_dijet.root -l3input jra_hiF_ak5PF_l3_dijet.root -era JEC_ak5PF_dijet -batch true -formats pdf -algs ak5PFJetAnalyzer -output jra_hiF_ak5PF_l2_dijet.root
jet_l2_correction_x -input jra_hiF_ak3Calo_dijet.root -l3input jra_hiF_ak3Calo_l3_dijet.root -era JEC_ak3Calo_dijet -batch true -formats pdf -algs ak3CaloJetAnalyzer -output jra_hiF_ak3Calo_l2_dijet.root
jet_l2_correction_x -input jra_hiF_ak4Calo_dijet.root -l3input jra_hiF_ak4Calo_l3_dijet.root -era JEC_ak4Calo_dijet -batch true -formats pdf -algs ak4CaloJetAnalyzer -output jra_hiF_ak4Calo_l2_dijet.root
jet_l2_correction_x -input jra_hiF_ak5Calo_dijet.root -l3input jra_hiF_ak5Calo_l3_dijet.root -era JEC_ak5Calo_dijet -batch true -formats pdf -algs ak5CaloJetAnalyzer -output jra_hiF_ak5Calo_l2_dijet.root

jet_draw_l2_correction_x -alg ak3PFJetAnalyzer -filename jra_hiF_ak3PF_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf
jet_draw_l2_correction_x -alg ak4PFJetAnalyzer -filename jra_hiF_ak4PF_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf
jet_draw_l2_correction_x -alg ak5PFJetAnalyzer -filename jra_hiF_ak5PF_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf
jet_draw_l2_correction_x -alg ak3CaloJetAnalyzer -filename jra_hiF_ak3Calo_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf
jet_draw_l2_correction_x -alg ak4CaloJetAnalyzer -filename jra_hiF_ak4Calo_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf
jet_draw_l2_correction_x -alg ak5CaloJetAnalyzer -filename jra_hiF_ak5Calo_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf


jet_draw_corrections_x -algs ak3pf -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_ak3PF_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf
jet_draw_corrections_x -algs ak4pf -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_ak4PF_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf
jet_draw_corrections_x -algs ak5pf -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_ak5PF_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf
jet_draw_corrections_x -algs ak3calo -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_ak3Calo_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf
jet_draw_corrections_x -algs ak4calo -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_ak4Calo_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf
jet_draw_corrections_x -algs ak5calo -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_ak5Calo_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf






