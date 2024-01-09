CONFIG="org_mc_aerial_block9"

# train coarse global GS
CUDA_VISIBLE_DEVICES=1 python train_large.py --config config/$CONFIG.yaml --port 314

# train GS cell
# for num in {0..15}  
# do  
# python train_large.py --config config/$CONFIG.yaml --block_id $num
# done 

TEST_PATH="data/matrix_city/aerial/test/block_9_test"
python render_custom.py --config config/$CONFIG.yaml --custom_test $TEST_PATH  --skip_train --skip_test
python metrics_custom.py -m output/$CONFIG -t block_9_test