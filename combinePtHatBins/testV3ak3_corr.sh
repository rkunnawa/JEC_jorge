root -l -b <<EOF
.L loadfwlite.C
.x load_JEC.C 
.x weight_PtHatBins_DijetsV2_lite.C+("/mnt/hadoop/cms/store/user/dgulhan/pPb/HP04/prod13/Signal_Pythia_pt15/HiForest_v72_merged02/pt15_HP04_prod13_v72_merged_forest_0.root","/net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/combinePtHatBins/corr_pp15.root",30,5.335E-01,true)
.q
EOF
root -l -b <<EOF
.L loadfwlite.C
.x load_JEC.C 
.x weight_PtHatBins_DijetsV2_lite.C+("/mnt/hadoop/cms/store/user/dgulhan/pPb/HP04/prod13/Signal_Pythia_pt30/HiForest_v72_merged02/pt30_HP04_prod13_v72_merged_forest_0.root","/net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/combinePtHatBins/corr_pp30.root",50,3.378E-02,true)
.q
EOF
root -l -b <<EOF
.L loadfwlite.C
.x load_JEC.C 
.x weight_PtHatBins_DijetsV2_lite.C+("/mnt/hadoop/cms/store/user/dgulhan/pPb/HP04/prod13/Signal_Pythia_pt50/HiForest_v72_merged02/pt50_HP04_prod13_v72_merged_forest_0.root","/net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/combinePtHatBins/corr_pp50.root",80,3.778E-03,true)
.q
EOF
root -l -b <<EOF
.L loadfwlite.C
.x load_JEC.C 
.x weight_PtHatBins_DijetsV2_lite.C+("/mnt/hadoop/cms/store/user/dgulhan/pPb/HP04/prod13/Signal_Pythia_pt80/HiForest_v72_merged02/pt80_HP04_prod13_v72_merged_forest_0.root","/net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/combinePtHatBins/corr_pp80.root",120,4.412E-04,true)
.q
EOF
root -l -b <<EOF
.L loadfwlite.C
.x load_JEC.C 
.x weight_PtHatBins_DijetsV2_lite.C+("/mnt/hadoop/cms/store/user/dgulhan/pPb/HP04/prod13/Signal_Pythia_pt120/HiForest_v72_merged02/pt120_HP04_prod13_v72_merged_forest_0.root","/net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/combinePtHatBins/corr_pp120.root",170,6.147E-05,true)
.q
EOF
root -l -b <<EOF
.L loadfwlite.C
.x load_JEC.C 
.x weight_PtHatBins_DijetsV2_lite.C+("/mnt/hadoop/cms/store/user/dgulhan/pPb/HP04/prod13/Signal_Pythia_pt170/HiForest_v72_merged02/pt170_HP04_prod13_v72_merged_forest_0.root","/net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/combinePtHatBins/corr_pp170.root",220,1.018E-05,true)
.q
EOF
root -l -b <<EOF
.L loadfwlite.C
.x load_JEC.C 
.x weight_PtHatBins_DijetsV2_lite.C+("/mnt/hadoop/cms/store/user/dgulhan/pPb/HP04/prod13/Signal_Pythia_pt220/HiForest_v72_merged02/pt220_HP04_prod13_v72_merged_forest_0.root","/net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/combinePtHatBins/corr_pp220.root",280,2.477E-06,true)
.q
EOF
root -l -b <<EOF
.L loadfwlite.C
.x load_JEC.C 
.x weight_PtHatBins_DijetsV2_lite.C+("/mnt/hadoop/cms/store/user/dgulhan/pPb/HP04/prod13/Signal_Pythia_pt280/HiForest_v72_merged02/pt280_HP04_prod13_v72_merged_forest_0.root","/net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/combinePtHatBins/corr_pp280.root",9999,6.160E-07,true)
.q
EOF

run="no"
echo $run
if [ $run = "yes" ]; then
root -l -b <<EOF
.L loadfwlite.C
.x load_JEC.C 
.x weight_PtHatBins_DijetsV2_lite.C+("/mnt/hadoop/cms/store/user/dgulhan/pPb/HP03/prod13/Signal_Pythia_pt370/HiForest_v72_v02_merged02/pt370_HP03_prod12_v72_merged_forest_0.root","/net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/combinePtHatBins/corr_pp370.root",9999,1.088E-07,true)
.q
EOF
fi

rm -f /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/corrected_dijet_pp_mergedpthatbins_2013MCV3ak3.root
hadd /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/JEC/corrected_dijet_pp_mergedpthatbins_2013MCV3ak3.root /net/hidsk0001/d00/scratch/jrobles/YaxianJECcode/CMSSW_5_3_8_HI_patch2/src/MNguyen/combinePtHatBins/corr_pp*.root


