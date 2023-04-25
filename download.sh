#!/bin/sh

mkdir checkpoints

echo "downloading models ..."
!gdown 1oPD-0Ni5iNqf5xFam55z24JmRk4nfvOe # color-model.pth
!gdown 1oRwIFtwV3VP3cAhQhZAdMrF3XwWuR0_9 # depth-model.pth
!gdown 1oRevcIYAdlIDdytjjTAXJyHX6YwrDGHB # edge-model.pth
!gdown 1oUM3KNJ-E6mVsYauNInf45WSuhy1c5Ec # model.pt

mv color-model.pth checkpoints/.
mv depth-model.pth checkpoints/.
mv edge-model.pth checkpoints/.
mv model.pt MiDaS/.

echo "cloning from BoostingMonocularDepth ..."
git clone https://github.com/compphoto/BoostingMonocularDepth.git
mkdir -p BoostingMonocularDepth/pix2pix/checkpoints/mergemodel/

echo "downloading mergenet weights ..."
!gdown 1oPBsmT3jo-eAFJBY4ASf0nn7LaMQlIal # latest-net-G.pth
mv latest_net_G.pth BoostingMonocularDepth/pix2pix/checkpoints/mergemodel/
wget https://github.com/intel-isl/MiDaS/releases/download/v2/model-f46da743.pt
mv model-f46da743.pt BoostingMonocularDepth/midas/model.pt
