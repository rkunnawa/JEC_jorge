#! /bin/sh -f
echo "Running for dijet........... "
# Generate the response
jet_response_analyzer_x  largeEta_binning_ptRebin_Pbp.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs akPu3PFJetAnalyzer -drmax 0.3 -output jra_hiF_akPu3PF_dijet.root
jet_response_analyzer_x  largeEta_binning_ptRebin_Pbp.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs akPu4PFJetAnalyzer -drmax 0.4 -output jra_hiF_akPu4PF_dijet.root
jet_response_analyzer_x  largeEta_binning_ptRebin_Pbp.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs akPu5PFJetAnalyzer -drmax 0.5 -output jra_hiF_akPu5PF_dijet.root
jet_response_analyzer_x  largeEta_binning_ptRebin_Pbp.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs akPu3CaloJetAnalyzer -drmax 0.3 -output jra_hiF_akPu3Calo_dijet.root
jet_response_analyzer_x  largeEta_binning_ptRebin_Pbp.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs akPu4CaloJetAnalyzer -drmax 0.4 -output jra_hiF_akPu4Calo_dijet.root
jet_response_analyzer_x  largeEta_binning_ptRebin_Pbp.config -input dijet_pp_mergedpthatbins_2013MCV4_Pbp.root -useweight true -algs akPu5CaloJetAnalyzer -drmax 0.5 -output jra_hiF_akPu5Calo_dijet.root
# Get the l3 corrections
jet_l3_correction_x -input jra_hiF_akPu3PF_dijet.root -era JEC_akPu3PF_dijet  -batch true -formats pdf -algs akPu3PFJetAnalyzer -output jra_hiF_akPu3PF_l3_dijet.root
jet_l3_correction_x -input jra_hiF_akPu4PF_dijet.root -era JEC_akPu4PF_dijet  -batch true -formats pdf -algs akPu4PFJetAnalyzer -output jra_hiF_akPu4PF_l3_dijet.root
jet_l3_correction_x -input jra_hiF_akPu5PF_dijet.root -era JEC_akPu5PF_dijet  -batch true -formats pdf -algs akPu5PFJetAnalyzer -output jra_hiF_akPu5PF_l3_dijet.root
jet_l3_correction_x -input jra_hiF_akPu3Calo_dijet.root -era JEC_akPu3Calo_dijet -batch true -formats pdf -algs akPu3CaloJetAnalyzer -output jra_hiF_akPu3Calo_l3_dijet.root
jet_l3_correction_x -input jra_hiF_akPu4Calo_dijet.root -era JEC_akPu4Calo_dijet -batch true -formats pdf -algs akPu4CaloJetAnalyzer -output jra_hiF_akPu4Calo_l3_dijet.root
jet_l3_correction_x -input jra_hiF_akPu5Calo_dijet.root -era JEC_akPu5Calo_dijet -batch true -formats pdf -algs akPu5CaloJetAnalyzer -output jra_hiF_akPu5Calo_l3_dijet.root

# use the l3 output and response output to get l2 corrections
jet_l2_correction_x -input jra_hiF_akPu3PF_dijet.root -l3input jra_hiF_akPu3PF_l3_dijet.root -era JEC_akPu3PF_dijet -batch true -formats pdf -algs akPu3PFJetAnalyzer -output jra_hiF_akPu3PF_l2_dijet.root
jet_l2_correction_x -input jra_hiF_akPu4PF_dijet.root -l3input jra_hiF_akPu4PF_l3_dijet.root -era JEC_akPu4PF_dijet -batch true -formats pdf -algs akPu4PFJetAnalyzer -output jra_hiF_akPu4PF_l2_dijet.root
jet_l2_correction_x -input jra_hiF_akPu5PF_dijet.root -l3input jra_hiF_akPu5PF_l3_dijet.root -era JEC_akPu5PF_dijet -batch true -formats pdf -algs akPu5PFJetAnalyzer -output jra_hiF_akPu5PF_l2_dijet.root
jet_l2_correction_x -input jra_hiF_akPu3Calo_dijet.root -l3input jra_hiF_akPu3Calo_l3_dijet.root -era JEC_akPu3Calo_dijet -batch true -formats pdf -algs akPu3CaloJetAnalyzer -output jra_hiF_akPu3Calo_l2_dijet.root
jet_l2_correction_x -input jra_hiF_akPu4Calo_dijet.root -l3input jra_hiF_akPu4Calo_l3_dijet.root -era JEC_akPu4Calo_dijet -batch true -formats pdf -algs akPu4CaloJetAnalyzer -output jra_hiF_akPu4Calo_l2_dijet.root
jet_l2_correction_x -input jra_hiF_akPu5Calo_dijet.root -l3input jra_hiF_akPu5Calo_l3_dijet.root -era JEC_akPu5Calo_dijet -batch true -formats pdf -algs akPu5CaloJetAnalyzer -output jra_hiF_akPu5Calo_l2_dijet.root

jet_draw_l2_correction_x -alg akPu3PFJetAnalyzer -filename jra_hiF_akPu3PF_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf
jet_draw_l2_correction_x -alg akPu4PFJetAnalyzer -filename jra_hiF_akPu4PF_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf
jet_draw_l2_correction_x -alg akPu5PFJetAnalyzer -filename jra_hiF_akPu5PF_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf
jet_draw_l2_correction_x -alg akPu3CaloJetAnalyzer -filename jra_hiF_akPu3Calo_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf
jet_draw_l2_correction_x -alg akPu4CaloJetAnalyzer -filename jra_hiF_akPu4Calo_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf
jet_draw_l2_correction_x -alg akPu5CaloJetAnalyzer -filename jra_hiF_akPu5Calo_l2_dijet.root -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -outputFormat .pdf


jet_draw_corrections_x -algs akPu3pf -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_akPu3PF_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf
jet_draw_corrections_x -algs akPu4pf -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_akPu4PF_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf
jet_draw_corrections_x -algs akPu5pf -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_akPu5PF_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf
jet_draw_corrections_x -algs akPu3calo -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_akPu3Calo_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf
jet_draw_corrections_x -algs akPu4calo -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_akPu4Calo_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf
jet_draw_corrections_x -algs akPu5calo -path "" -outputDir /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/testCorrectionFiles/ -era JEC_akPu5Calo_dijet -useL2Cor true -useL3Cor -true -outputFormat .pdf






