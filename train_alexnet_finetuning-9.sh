#!/usr/bin/env sh

TOOLS=./build/tools

#for i in 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10 11 12 13 14 15 16 17 18 19 20 24 28 34 38 42 46 50 100 200





#for i in 1 2  4 6 7 8 9 10 11 12  14  16  18  20
#for i in 29 30 31 32 33 35 36 37 39 40 41 43 44 45 47 48 49   2  3  4  5  6  7  8  9  10 11  13 14 15 16 17 18 19 20 24 28 34 38 42 46 50
for i in 1 2 4 6 8

#for i in 16
	do
	sed -i 's/caffe_alexnet.*/caffe_alexnet_train_'$i'"/g' ./myself/slitlamp-fine-alex/solver_96-9.prototxt
	sed -i 's/pos_mult:.*/pos_mult: '$i'/g' ./myself/slitlamp-fine-alex/train_val-9.prototxt
	GLOG_logtostderr=1 $TOOLS/caffe train --solver=./myself/slitlamp-fine-alex/solver_96-9.prototxt --weights ./myself/slitlamp-fine-alex/bvlc_alexnet.caffemodel -gpu 0,1,2,3
	echo "Done."
	done


for i in 1 2 4 6 8

	do
	sed -i 's/caffe_alexnet.*/caffe_alexnet_train_'$i'"/g' ./myself/slitlamp-fine-alex/solver_96-8.prototxt
	sed -i 's/pos_mult:.*/pos_mult: '$i'/g' ./myself/slitlamp-fine-alex/train_val-8.prototxt
	GLOG_logtostderr=1 $TOOLS/caffe train --solver=./myself/slitlamp-fine-alex/solver_96-8.prototxt --weights ./myself/slitlamp-fine-alex/bvlc_alexnet.caffemodel -gpu 0,1,2,3
	echo "Done."
	done



for i in 1 2 4 6 8

	do
	sed -i 's/caffe_alexnet.*/caffe_alexnet_train_'$i'"/g' ./myself/slitlamp-fine-alex/solver_96-91.prototxt
	sed -i 's/pos_mult:.*/pos_mult: '$i'/g' ./myself/slitlamp-fine-alex/train_val-91.prototxt
	GLOG_logtostderr=1 $TOOLS/caffe train --solver=./myself/slitlamp-fine-alex/solver_96-91.prototxt --weights ./myself/slitlamp-fine-alex/bvlc_alexnet.caffemodel -gpu 0,1,2,3
	echo "Done."
	done


for i in 1 2 4 6 8

	do
	sed -i 's/caffe_alexnet.*/caffe_alexnet_train_'$i'"/g' ./myself/slitlamp-fine-alex/solver_96-10.prototxt
	sed -i 's/pos_mult:.*/pos_mult: '$i'/g' ./myself/slitlamp-fine-alex/train_val-10.prototxt
	GLOG_logtostderr=1 $TOOLS/caffe train --solver=./myself/slitlamp-fine-alex/solver_96-10.prototxt --weights ./myself/slitlamp-fine-alex/bvlc_alexnet.caffemodel -gpu 0,1,2,3
	echo "Done."
	done
