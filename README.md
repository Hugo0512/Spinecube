# Spinecube
Spinecube is an intelligence agent for diagnosing the scoliosis and evaluating the severity of scoliosis.

Please feel free to contact us for any questions or comments: Kai Zhang, E-mail: Hugo88315@163.com.

All codes for deep-learning convolutional neural networks were executed in the Caffe (Convolutional Architecture for Fast Feature Embedding) framework with Ubuntu 16.04 64bit + CUDA (Compute Unified Device Architecture).

The codes for Faster-RCNN were executed in the Caffe (Convolutional Architecture for Fast Feature Embedding) framework with Ubuntu 16.04 64bit + CUDA (Compute Unified Device Architecture). Please refer to https://github.com/rbgirshick/py-faster-rcnn to obtain Faster-RCNN and the specification of it.

The trainning data is grouped in four groups (0-10 degree, 11-20 degree, 21-45 degree, larger than 45 degree).

The detailed steps to implement Faster-RCNN as follows:
1) Use LabelImg (https://github.com/tzutalin/labelImg) tool to annotate the back of all images with rectangle mode.
2) Deploy the py-faster-rcnn in your environment:

3) 
    git clone --recursive https://github.com/rbgirshick/py-faster-rcnn.git
   
    cd py-faster-rcnn/lib
   
    cp Makefile.config.example MAkefile.config
   
    make all -j8
   
    make pycaffe
   
5) Move your own dataset into directory …/py-faster-rcnn/data/ as this architecture:
    Vocdevkit2007-VoC2007
   
            Annotations
   
                000001.xml
                000002.xml
                000003.xml
                000004.xml
                000005.xml
                000006.xml
                000007.xml
                000008.xml
                000009.xml
                000010.xml
                000011.xml
                000012.xml
                000013.xml
                000014.xml
                000015.xml
            Imagesets
                Main
                    train.txt
                    test.txt
                    val.txt
                    trainval.txt
            JPEGImages
                000001.jpg
                000002.jpg
                000003.jpg
                000004.jpg
                000005.jpg
                000006.jpg
                000007.jpg
                000008.jpg
                000009.jpg
                000010.jpg
                000011.jpg
                000012.jpg
                000013.jpg
                000014.jpg
                000015.jpg

6)  Use the script ./data/scripts/fetch_imagenet_models.sh to download the pretrained ZF network model and put it into directory /py-faster-rcnn/data/imagenet_models; 
    Modify the prototxt files: the class numbers: 'num_classes' and the output: 'num_output' in /py-faster-rcnn/models/pascal_voc/ZF/faster_rcnn_end2end/train.prototxt; 
    Modify self._classes in pascal_voc.py with 'back':
    
    self._classes = ('__background__', # always index 0
                         'back')
    
    Then train the model with command python ./tools/train_net.py --gpu 0


The detailed steps to implement ResNet101 with Caffe as follows:
1) prepare the classification dataset and put it into directory ./caffe/models/ResNet-101/data as follows (cross validation):
   
    test1
   
    test2
   
    test3
   
    test4
   
    train1
   
    train2
   
    train3
   
    train4
   
    train1.txt
   
    train2.txt
   
    train3.txt
   
    train4.txt
   
    test1.txt
   
    test2.txt
   
    test3.txt
   
    test4.txt
   
    where txt files contain the labels of all images that are saved in test1-4 and train1-4 folders (totally 4 pairs).
2） 1. Use the tool convert_imageset.sh in build/tools to cinvert your data into leveldb/imdb format; and compute the mean values with the tool make_imagenet_mean.sh in build/tools, which will be used in the training of models.
    2. Modify the prototxt file resnet_101.prototxt and deploy-101.prototxt (the original file is https://github.com/KaimingHe/deep-residual-networks/blob/master/prototxt/ResNet-101-deploy.prototxt):
        replace the mean value in step 1 into these two protxt files.
    resnet_101_solver.prototxt:
        parameter net, base_lr etc.
    Then train the model with script train_alexnet_finetuning-9.sh




