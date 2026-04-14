# This is a script to extract the ROIs for the Three Layers of Self, from Qin et al. 2020 (Table 2)
current_dir=$(pwd)

template_image=TEMPLATE_IMG_PATH_HERE
sample_epi_image=IMG_PATH_HERE
output_dir=OUTPUT_DIR_HERE
mkdir $output_dir

3dresample \
-input $template_image \
-master $sample_epi_image \
-prefix $output_dir/Resample_MNI152_2009.nii.gz
echo "Resampling template image to sample EPI image"

# ROI creation from MNI152_2009
# step(9- ...) = sqrt 9 = radius 3mm sphere
# step(16- ...) = sqrt 16 = radius 4mm sphere

cd $output_dir
echo "Processing ..."

a=34; b=14; c=12
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Interoception_R_Insula.nii.gz

a=0; b=4; c=48
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Interoception_L_Dorsal_anterior_cingulate_cortex.nii.gz

a=12; b=-14; c=4
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Interoception_R_Thalamus.nii.gz

a=30; b=-4; c=-24
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Interoception_R_Parahippocampal_gyrus.nii.gz

a=-20; b=-4; c=-20
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Interoception_L_Parahippocampal_gyrus.nii.gz

a=-40; b=-2; c=2
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Interoception_L_Insula_1.nii.gz

a=-36; b=24; c=4
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Interoception_L_Insula_2.nii.gz

a=56; b=-26; c=26
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Interoception_R_Inferior_parietal_lobule.nii.gz

a=4; b=24; c=48
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Interoception_R_Superior_frontal_gyrus.nii.gz

a=-56; b=6; c=6
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Interoception_L_Superior_temporal_gyrus.nii.gz

a=-48; b=-16; c=32
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Interoception_L_Postcentral_gyrus.nii.gz

a=48; b=-58; c=-12
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_R_Fusiform_gyrus.nii.gz

a=48; b=40; c=8
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_R_Inferior_frontal_gyrus.nii.gz

a=50; b=8; c=26
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_R_Premotor_cortex.nii.gz  

a=40; b=8; c=0
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_R_Insula.nii.gz

a=-44; b=-68; c=-6
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_L_Fusiform_gyrus.nii.gz

a=26; b=-72; c=44
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_R_Superior_parietal_lobule.nii.gz

a=58; b=-22; c=38
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_R_Postcentral_gyrus.nii.gz

a=36; b=-50; c=56
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_R_Inferior_parietal_lobule.nii.gz

a=-36; b=18; c=-4
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_L_Insula.nii.gz

a=38; b=-80; c=-2
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_R_Inferior_occipital_gyrus.nii.gz

a=-46; b=-34; c=40
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_L_Inferior_parietal_lobule.nii.gz

a=-22; b=-64; c=50
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_L_Superior_parietal_lobule.nii.gz

a=4; b=8; c=38
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_R_Cingulate_gyrus.nii.gz

a=-6; b=60; c=22
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Exteroception_L_Medial_prefrontal_cortex.nii.gz

a=-6; b=48; c=0
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_L_Anterior_cingulate_cortex.nii.gz    

a=-4; b=-54; c=28
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_L_Posterior_cingulate_cortex.nii.gz

a=-36; b=22; c=-2
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_L_Insula.nii.gz

a=-48; b=-66; c=28
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_L_Middle_temporal_gyrus.nii.gz

a=-8; b=2; c=8
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_L_Thalamus.nii.gz

a=-20; b=36; c=46
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_L_Superior_frontal_gyrus_1.nii.gz

a=0; b=-18; c=40
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_Cingulate_gyrus.nii.gz

a=-62; b=-6; c=-18
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_L_Inferior_temporal_gyrus.nii.gz

a=54; b=-60; c=24
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_R_Middle_temporal_gyrus.nii.gz

a=52; b=10; c=-6
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_R_Insula.nii.gz

a=-24; b=50; c=22
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_L_Superior_frontal_gyrus_2.nii.gz

a=46; b=6; c=24
3dcalc \
-a $output_dir/Resample_MNI152_2009.nii.gz \
-expr "step(16-(x+$a)*(x+$a)-(y+$b)*(y+$b)-(z-$c)*(z-$c))" \
-prefix Cognition_R_Premotor_cortex.nii.gz

3dcalc \
-a Interoception_R_Insula.nii.gz \
-b Interoception_L_Dorsal_anterior_cingulate_cortex.nii.gz \
-c Interoception_R_Thalamus.nii.gz \
-d Interoception_R_Parahippocampal_gyrus.nii.gz \
-e Interoception_L_Parahippocampal_gyrus.nii.gz \
-f Interoception_L_Insula_1.nii.gz \
-g Interoception_L_Insula_2.nii.gz \
-h Interoception_R_Inferior_parietal_lobule.nii.gz \
-i Interoception_R_Superior_frontal_gyrus.nii.gz \
-j Interoception_L_Superior_temporal_gyrus.nii.gz \
-k Interoception_L_Postcentral_gyrus.nii.gz \
-expr 'step(a+b+c+d+e+f+g+h+i+j+k)' \
-prefix Interoception.nii.gz

3dcalc \
-a Exteroception_R_Fusiform_gyrus.nii.gz \
-b Exteroception_R_Inferior_frontal_gyrus.nii.gz \
-c Exteroception_R_Premotor_cortex.nii.gz \
-d Exteroception_R_Insula.nii.gz \
-e Exteroception_L_Fusiform_gyrus.nii.gz \
-f Exteroception_R_Superior_parietal_lobule.nii.gz \
-g Exteroception_R_Postcentral_gyrus.nii.gz \
-h Exteroception_R_Inferior_parietal_lobule.nii.gz \
-i Exteroception_L_Insula.nii.gz \
-j Exteroception_R_Inferior_occipital_gyrus.nii.gz \
-k Exteroception_L_Inferior_parietal_lobule.nii.gz \
-l Exteroception_L_Superior_parietal_lobule.nii.gz \
-m Exteroception_R_Cingulate_gyrus.nii.gz \
-n Exteroception_L_Medial_prefrontal_cortex.nii.gz \
-expr 'step(a+b+c+d+e+f+g+h+i+j+k+l+m+n)' \
-prefix Exteroception.nii.gz

3dcalc \
-a Cognition_L_Anterior_cingulate_cortex.nii.gz \
-b Cognition_L_Posterior_cingulate_cortex.nii.gz \
-c Cognition_L_Insula.nii.gz \
-d Cognition_L_Middle_temporal_gyrus.nii.gz \
-e Cognition_L_Thalamus.nii.gz \
-f Cognition_L_Superior_frontal_gyrus_1.nii.gz \
-g Cognition_Cingulate_gyrus.nii.gz \
-h Cognition_L_Inferior_temporal_gyrus.nii.gz \
-i Cognition_R_Middle_temporal_gyrus.nii.gz \
-j Cognition_R_Insula.nii.gz \
-k Cognition_L_Superior_frontal_gyrus_2.nii.gz \
-l Cognition_R_Premotor_cortex.nii.gz \
-expr 'step(a+b+c+d+e+f+g+h+i+j+k+l)' \
-prefix Cognition.nii.gz
