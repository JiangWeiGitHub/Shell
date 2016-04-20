#!/bin/bash

# Create files & folders with specific xattr, copy Movie.wmv & Music.mp3 & Pic.jpg from /trynode folder

# tree:
# root@wisnuc:/john# tree /mnt/
# /mnt/
# |-- 1
# |   |-- 12.txt
# |   `-- 5
# |-- 11.txt
# |-- 2
# |   `-- 6
# |       |-- 12.txt
# |       `-- 7
# |-- 3
# |   `-- 6
# |       `-- 9
# |           |-- 10
# |           `-- 12.txt
# |-- 4
# |   |-- animal
# |   |   |-- 0814a5d63978f9d2a482fd8b11a2679a.jpg
# |   |   |-- 17f60e2d67cba70f7b98c230878da6d6.jpg
# |   |   |-- 3ee4e2e779d084f84b610f62cde2e11e.jpg
# |   |   |-- 59a0d6998c242410c3a9b4abe5a4f835.jpg
# |   |   |-- 741ae98ec46e57811036782a0c381635.jpg
# |   |   |-- 97e35a219401419386c1e1bec25b695b.jpg
# |   |   |-- 9cdc32deaf0d607e211afb0d2e001737.jpg
# |   |   |-- ad028de86ed700f9582aeb48f8493b8e.jpg
# |   |   |-- b1bb05a3f2cfceb29871d10182e8108c.jpg
# |   |   |-- b1d210e01ab72cd168d466534d42e969.jpg
# |   |   |-- b32a9e461bee0687b6433bf61410af20.jpg
# |   |   |-- cc523a7c6a1770cd6b2e0f1fda57f871.jpg
# |   |   |-- d7bec948e6548d0297f2277ba772d10f.jpg
# |   |   |-- ea6a7bcb8e3b6163d653bf66bd1e425f.jpg
# |   |   `-- f0a7f879298f32f6c35535dddcb7950b.jpg
# |   |-- car
# |   |   |-- 14d839fee64695d21861c366af84b6a1.jpg
# |   |   |-- 1d4e3cc82a8f4aef7393251650fd4d7.jpg
# |   |   |-- 213f27bbeeb5ca3a56ea3b5b562d0562.jpg
# |   |   |-- 3873e85c87a81bc92a43b8433e97ce21.jpg
# |   |   |-- 4a43eca5da2890f41c50f4ee11c4ea99.jpg
# |   |   |-- 6738ae6bd6f918215b.jpg
# |   |   |-- 6980f9def6a1e7e31a4c4a26eaff43a4.jpg
# |   |   |-- 8ea1817412bd33c5c8fa8371cb71889b.jpg
# |   |   |-- ab1fcc84f700046806.jpg
# |   |   |-- cea43b34191ac68ec1ab84871042857c.jpg
# |   |   `-- fb2a0eb63f523ef02b1ff90ee48ca527.jpg
# |   |-- couple
# |   |   |-- 010daa9560f7345963d2f036b058fc16.jpg
# |   |   |-- 079f631431674e2ada48a7862ca73a2d.jpg
# |   |   |-- 07a1b78783110e2f35f2948154236f60.jpg
# |   |   |-- 0e6cc898a66c002c09bc4a70a3ef14d6.jpg
# |   |   |-- 0ebdfa36dddb20539ad7288e70c36849.jpg
# |   |   |-- 105bde8ce8926175fd29ed42fe1e7420.jpg
# |   |   |-- 1508c9190b5174e563e1fcca1a381.jpg
# |   |   |-- 1508c9190b5174e563e1fcca1a381df3.jpg
# |   |   |-- 16bccca8de987404755d850da1672937.jpg
# |   |   |-- 1762af4b7b82b932a358813d7343f0bb.jpg
# |   |   |-- 1b9b85018d2457e5ba697818257d42e4.jpg
# |   |   |-- 26bb6e09867ce0454d0d27ea45a9807d.jpg
# |   |   |-- 27fbf4d17fd26902a4666e19d32b9d38.jpg
# |   |   |-- 3155dcab381e6159ff9f3b46bd1a491e.jpg
# |   |   |-- 3bef9c5747d8b57e9348c6a84c77b1d5.jpg
# |   |   |-- 3e9df106ea894afb1243b29d33447139.jpg
# |   |   |-- 3f9e934646c91fd6333a5180b20a87e5.jpg
# |   |   |-- 42da0cae5595ab784963ee4a26337474.jpg
# |   |   |-- 436a54127a5df6a224e4df399edacda6.jpg
# |   |   |-- 447619aef0462de61405d77c8251f2d6.jpg
# |   |   |-- 45a861f0fa95a5bdd7fcbff3433debc1.jpg
# |   |   |-- 474f533176fca76ba383856ecb66eb58.jpg
# |   |   |-- 4b37b12688c35c47e598ac7fa476f6fc.jpg
# |   |   |-- 4cce509dff4a37d280bd68c0ab04a0b7.jpg
# |   |   |-- 4d152e06a4a4ebcdb796495f4076333e.jpg
# |   |   |-- 4e2c8d26940499f293bb7c63556f4e3b.jpg
# |   |   |-- 4ea7c993251266d88615367837ed618.jpg
# |   |   |-- 4ea7c993251266d88615367837ed6181.jpg
# |   |   |-- 5676623e63a87e4a2a27a547864f3805.jpg
# |   |   |-- 576f2325dfcd79b5b25c30e7862ab513.jpg
# |   |   |-- 5df3b430d7d8171a38a268f7e8b97e82.jpg
# |   |   |-- 63c2d1155e2804c7d74f211aa2638110.jpg
# |   |   |-- 65a06c6a1a66f13edea8202c136be077.jpg
# |   |   |-- 6daecd1c5ab06904d606bfb212d30e7.jpg
# |   |   |-- 6daecd1c5ab06904d606bfb212d30e72.jpg
# |   |   |-- 7297f49d3c2c2e62463e6f01a9112f29.jpg
# |   |   |-- 747b724b7bef4af447aa3d1030d6bdd9.jpg
# |   |   |-- 80950ff3315d8eb4cfaa4a4a4789b28f.jpg
# |   |   |-- 89a8ad6a172e0885efd8b7173b9987d.jpg
# |   |   |-- 89a8ad6a172e0885efd8b7173b9987d5.jpg
# |   |   |-- 8b7c4cc95f7186f037e6f8e8125d8ed9.jpg
# |   |   |-- 8fb75044deb977112674efaf37f406.jpg
# |   |   |-- 8fb75044deb977112674efaf37f4062a.jpg
# |   |   |-- 94d6985da01ab1c1158ba180abbfbf8c.jpg
# |   |   |-- 9721eeff99d679efeb6ed4e24f646646.jpg
# |   |   |-- 9a4a042cb8514dd51dcc2656b0d983c1.jpg
# |   |   |-- 9bf2d64dc1b175793474adb0e9a7735f.jpg
# |   |   |-- 9d99fd69c5c3713149ba93b906accd32.jpg
# |   |   |-- 9edb5dd8bae3811f2b557400e8a474aa.jpg
# |   |   |-- a1c67a033957388856aa832333800f90.jpg
# |   |   |-- a27319d8895cdcb2d474a7820df0d.jpg
# |   |   |-- a27319d8895cdcb2d474a7820df0d403.jpg
# |   |   |-- a87967de39f19cbc7288e1ef247c763b.jpg
# |   |   |-- b585f974d7addcc6aff52e6fb28c6551.jpg
# |   |   |-- b625236526dc9e9d4336f76ae0e5fb94.jpg
# |   |   |-- b99e7e8b003c970fb52387b5367ac8c.jpg
# |   |   |-- b99e7e8b003c970fb52387b5367ac8c9.jpg
# |   |   |-- bee820c13d55b5c81cce3ab9c5481c16.jpg
# |   |   |-- c3d51d86a57c7efad90a165e77fca64a.jpg
# |   |   |-- c6adc3431694df4e88e3083bb95c5d9d.jpg
# |   |   |-- c7cc565f385af255107d9559876028a0.jpg
# |   |   |-- c8cab15ab19c7321c3397d0543518071.jpg
# |   |   |-- cf67046a388dbd587cd17e1a97b.jpg
# |   |   |-- cf67046a388dbd587cd17e1a97b0e750.jpg
# |   |   |-- d83c34866952776fd76250a091503a3e.jpg
# |   |   |-- dd3d5e56a858c9b95714031006f9647e.jpg
# |   |   |-- df9732d52393c4bb5fa53bcbd4419734.jpg
# |   |   |-- e3ebf90720b08b5b30fcf052e039e1c9.jpg
# |   |   |-- e71c0a50db41ebdc0519c97e60a734ef.jpg
# |   |   |-- e7d61a3b9856cb61f83968606331b7b2.jpg
# |   |   |-- ef28f531051a7fb9f8c36de4879ae504.jpg
# |   |   |-- f08c9ae4169c5f1ee0fbac6c8d4b2b1d.jpg
# |   |   |-- f38f1d5b373fb06e4b693340ed5a980b.jpg
# |   |   |-- f3950bf7d85372d20690757b48bd3e30.jpg
# |   |   |-- f6068fd7014096c26a2bf7937f5a3749.jpg
# |   |   |-- f7295f0c0a5c04c397.jpg
# |   |   |-- f759c4c2e44937842ee07c2fe805ce55.jpg
# |   |   |-- fc24dc80bb30a8efefba5d6e03a1cc9c.jpg
# |   |   |-- fdc8d2658fca3224b6119be62ef8478f.jpg
# |   |   `-- fe557931a3a14a666c0b5bd6e32cc53b.jpg
# |   `-- scenery
# |       |-- 005b8ed13ebb0b44aac650070f853485.jpg
# |       |-- 5bc53964689936b74d93f4ea91228e6a.jpg
# |       |-- 68dec9a0707e4d100a29e08e11176261.jpg
# |       |-- 74c858eb71242cf2151be1151d5f2398.jpg
# |       |-- 83e0e98ec971fc3aec55c8f9c50f2198.jpg
# |       |-- 952d1d103f402551e3b73b7e94ae7ecd.jpg
# |       |-- ae9f587824b6de65052ef3b7d670287d.jpg
# |       |-- d6ea542ed8656a7a5766b72a98d529a3.jpg
# |       |-- e213db409960b1e1fa4edae95f5cdb24.jpg
# |       `-- e9af9b0399a6f7e0d1121f211a36c6c7.jpg
# |-- Movie.wmv
# |-- Music.mp3
# `-- Pic.jpg
# 
# 14 directories, 123 files

admin_uuid="c31a2e99-987d-4f65-9559-22e22ff603da"

setFileHashXattr()
{
  originalStr=`sha256sum $1`
  processedStr=${originalStr:0:64}
  
  setfattr -n user.hash -v "${processedStr}" "$1"
}

setFolderHashXattr()
{
  setfattr -n user.hash -v "" "$1"
}

setUUIDXattr()
{
  setfattr -n user.uuid -v "$2" "$1"
}

setFolderTypeXattr()
{
  setfattr -n user.type -v "folder" "$1"
}

setFileTypeXattr()
{
  setfattr -n user.type -v "file" "$1"
}

setOwnerListXattr()
{
  setfattr -n user.owner -v "$2" "$1"
}

setReadListXattr()
{
  setfattr -n user.readlist -v "$2" "$1"
}

setWriteListXattr()
{
  setfattr -n user.writelist -v "$2" "$1"
}

#####################################################

path=`pwd`

if [ -e "/mnt" ]
then
  rm -rf /mnt/*
fi
mkdir -p /mnt
cd /mnt

#####################################################

mkdir 1
setFolderHashXattr "1"
setUUIDXattr "1" "854237a4-3582-48c1-8420-4536fa4263c7"
setFolderTypeXattr "1"
setOwnerListXattr "1" "$admin_uuid"
setReadListXattr "1" "$admin_uuid"
setWriteListXattr "1" " "

cd 1
touch 12.txt
echo "12.txt" > 12.txt
setFileHashXattr "12.txt"
setUUIDXattr "12.txt" "d03232a4-9b35-439f-b91b-ff20f6de6dc6"
setFileTypeXattr "12.txt"
setOwnerListXattr "12.txt" "$admin_uuid"
setReadListXattr "12.txt" "$admin_uuid"
setWriteListXattr "12.txt" " "

mkdir 5

# return to 1
cd ..

#####################################################

touch 11.txt
echo "11.txt" > 11.txt
setFileHashXattr "11.txt"
setUUIDXattr "11.txt" "ba6823f5-9e8c-47e9-abfd-84cb5d4253ab"
setFileTypeXattr "11.txt"
setOwnerListXattr "11.txt" "$admin_uuid"
setReadListXattr "11.txt" " "
setWriteListXattr "11.txt" " "

#####################################################

mkdir 2
setFolderHashXattr "2"
setUUIDXattr "2" "8a4dfc46-0820-4612-903c-7a4d050de594"
setFolderTypeXattr "2"
setOwnerListXattr "2" "$admin_uuid"
setReadListXattr "2" "$admin_uuid"
setWriteListXattr "2" " "

#####################################################

cd 2
mkdir 6
setFolderHashXattr "6"
setUUIDXattr "6" "7a7c1334-01f3-437d-8088-5e628afb6242"
setFolderTypeXattr "6"
setOwnerListXattr "6" " "
setReadListXattr "6" "$admin_uuid"
setWriteListXattr "6" "$admin_uuid"

#####################################################

cd 6
touch 12.txt
echo "12.txt" > 12.txt
setFileHashXattr "12.txt"
setUUIDXattr "12.txt" "7c6b9c6e-01cc-40d2-ad2b-249afef75891"
setFileTypeXattr "12.txt"
setOwnerListXattr "12.txt" " "
setReadListXattr "12.txt" " "
setWriteListXattr "12.txt" "$admin_uuid"

mkdir 7

#####################################################

# return to 6
cd ..

# return to 2
cd ..

#####################################################

mkdir 3
cd 3
mkdir 6
cd 6
mkdir 9
cd 9
mkdir 10
touch 12.txt
echo "12.txt" > 12.txt
setFileHashXattr "12.txt"
setUUIDXattr "12.txt" "6737651f-1420-4696-b6f7-76fba07d95b3"
setFileTypeXattr "12.txt"
setOwnerListXattr "12.txt" "$admin_uuid"
setReadListXattr "12.txt" " "
setWriteListXattr "12.txt" "$admin_uuid"

#####################################################

# return to 9
cd ..

# return to 6
cd ..

# return to 3
cd ..

#####################################################

mkdir 4
setFolderHashXattr "4"
setUUIDXattr "4" "88eb39b6-519f-46c2-ba3e-051079e9b6ac"
setFolderTypeXattr "4"
setOwnerListXattr "4" "$admin_uuid"
setReadListXattr "4" " "
setWriteListXattr "4" " "

#####################################################

chmod 777 -R *

cd $path

########################################################################################
# Copy Three Special Files.
########################################################################################

if [ -e "/mnt/Music.mp3" ]
then
    rm /mnt/Music.mp3
fi
if [ -e "/mnt/Music.mp3" ]
then
    rm /mnt/Movie.wmv
fi
if [ -e "/mnt/Music.mp3" ]
then
    rm /mnt/Pic.jpg
fi

cp /trynode/Movie.wmv /mnt
setfattr -n user.uuid -v "5dfdbd62-b864-4824-9f7c-6c3cd8bf0d7e" "/mnt/Movie.wmv"
setfattr -n user.owner -v "$admin_uuid" "/mnt/Movie.wmv"
setfattr -n user.readlist -v " " "/mnt/Movie.wmv"
setfattr -n user.writelist -v " " "/mnt/Movie.wmv"
setfattr -n user.type -v "file" "/mnt/Movie.wmv"
originalStr=`sha256sum "/mnt/Movie.wmv"`
processedStr=${originalStr:0:64}
setfattr -n user.hash -v "${processedStr}" "/mnt/Movie.wmv"

cp /trynode/Music.mp3 /mnt
setfattr -n user.uuid -v "892a1943-33bd-4b7d-ae59-ec9d3d2a8094" "/mnt/Music.mp3"
setfattr -n user.owner -v "$admin_uuid" "/mnt/Music.mp3"
setfattr -n user.readlist -v " " "/mnt/Music.mp3"
setfattr -n user.writelist -v " " "/mnt/Music.mp3"
setfattr -n user.type -v "file" "/mnt/Music.mp3"
originalStr=`sha256sum "/mnt/Music.mp3"`
processedStr=${originalStr:0:64}
setfattr -n user.hash -v "${processedStr}" "/mnt/Music.mp3"

cp /trynode/Pic.jpg /mnt
setfattr -n user.uuid -v "3e04af9e-4148-45ad-a60d-fbbe32d000f7" "/mnt/Pic.jpg"
setfattr -n user.owner -v "$admin_uuid" "/mnt/Pic.jpg"
setfattr -n user.readlist -v " " "/mnt/Pic.jpg"
setfattr -n user.writelist -v " " "/mnt/Pic.jpg"
setfattr -n user.type -v "file" "/mnt/Pic.jpg"
originalStr=`sha256sum "/mnt/Pic.jpg"`
processedStr=${originalStr:0:64}
setfattr -n user.hash -v "${processedStr}" "/mnt/Pic.jpg"

########################################################################################
# Copy many photos.
########################################################################################

cp -rf /trynode/photo/* /mnt/4

function scandir(){
    local cur_dir parent_dir workdir
    workdir=$1
    cd ${workdir}
    if [ ${workdir} = "/" ]
    then
        cur_dir=""
    else
        cur_dir=$(pwd)
    fi

    for dirlist in $(ls ${cur_dir})
    do
        if test -d ${dirlist};then
            setFolderHashXattr ${dirlist}
            setUUIDXattr ${dirlist} /proc/sys/kernel/random/uuid
            setFolderTypeXattr ${dirlist}
            setOwnerListXattr ${dirlist} "$admin_uuid"
            setReadListXattr ${dirlist} "$admin_uuid"
            setWriteListXattr ${dirlist} "$admin_uuid"
            cd ${dirlist}
            scandir ${cur_dir}/${dirlist}
            cd ..
        else
            setFileHashXattr ${cur_dir}/${dirlist}
            setUUIDXattr ${cur_dir}/${dirlist} /proc/sys/kernel/random/uuid
            setFileTypeXattr ${cur_dir}/${dirlist}
            setOwnerListXattr ${cur_dir}/${dirlist} "$admin_uuid"
            setReadListXattr ${cur_dir}/${dirlist} " "
            setWriteListXattr ${cur_dir}/${dirlist} "$admin_uuid"
        fi
    done
}

scandir /mnt/4
