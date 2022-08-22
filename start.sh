#!/bin/bash


#mount NFS, ensure this ec2 instance is in the correct security group.
mkdir /efs
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-09ddb74e0c26c1e69.efs.us-east-2.amazonaws.com:/ /efs

#modules and module paths
yum install -y evironment-modules
mkdir -p /cm/shared/modulefiles
ln -s /efs/modules/bbc /cm/shared/modulefiles/bbc

#software mount points
mkdir -p /varidata/research/software
ln -s /efs/software/BBC /varidata/research/software
mkdir -p /primary/vari
ln -s /efs/software /primary/vari/

echo export MODULEPATH=/cm/local/modulefiles:/cm/shared/modulefiles > /etc/profile.d/modules.sh
echo source /usr/share/Modules/init/bash >> /etc/profile.d/modules.sh

#TODO set up nss-cache and bring in the nss-cache input database

#TODO set up s3 lab mounts
mkdir -p /varidata/research/projects
#mount .. .. ..
