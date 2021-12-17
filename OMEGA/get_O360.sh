#!/bin/sh -

get_images_to()
{

	save_to=${1}
	base_url_s=${2}
	base_url_p=${3}
    wget_params='-b --no-cache -q -a wget.log'
    cam_params='?res=full&quality=21&doublescan=0'
    img_idx=1
	
    call_wget()
    {
        if [ $img_idx -lt 10 ]; then
            img_idx_lz="0"$img_idx
        else
            img_idx_lz=$img_idx
        fi
        wget ${wget_params} ${base_url}${cha}${cam_params} -O ${save_to}/${img_idx_lz}.jpg > /dev/null
    }
    
   
    #base_url='http://192.168.128.76/image'
	base_url=$base_url_s # Change to starboard camera
		
		cha=1
        #wget ${wget_params} ${base_url}${cha}${cam_params} -O ${save_to}/${img_idx}.jpg > /dev/null
		call_wget
        img_idx=$((img_idx+1))
		
		#cha=2
		#wget ${wget_params} ${base_url}${cha}${cam_params} -O ${save_to}/${img_idx}.jpg > /dev/null
		#call_wget
        #img_idx=$((img_idx+1))
		
		cha=4
		#wget ${wget_params} ${base_url}${cha}${cam_params} -O ${save_to}/${img_idx}.jpg > /dev/null
		call_wget
        img_idx=$((img_idx+1))
		
		cha=3
		#wget ${wget_params} ${base_url}${cha}${cam_params} -O ${save_to}/${img_idx}.jpg > /dev/null
		call_wget
        img_idx=$((img_idx+1))
				
    #echo -n " "
    
	#base_url='http://192.168.128.77/image'
	base_url=$base_url_p # Change to port camera

                #cha=1
        #wget ${wget_params} ${base_url}${cha}${cam_params} -O ${save_to}/${img$
                #call_wget
        #img_idx=$((img_idx+1))

                cha=4
                #wget ${wget_params} ${base_url}${cha}${cam_params} -O ${save_t$
                call_wget
        img_idx=$((img_idx+1))

                cha=3
                #wget ${wget_params} ${base_url}${cha}${cam_params} -O ${save_t$
                call_wget
        img_idx=$((img_idx+1))

                cha=2
		#wget ${wget_params} ${base_url}${cha}${cam_params} -O ${save_t$
                call_wget
        img_idx=$((img_idx+1))

    echo 

} #get_images_to()

#echo F360 Camera Capture
echo

#SHOT_EVERY=1
typeset -i SHOT_EVERY=$(cat var_FPS360.arctic)

#IMG360_PATH='/media/F360cam/'
IMG360_PATH=$(head -n 1 config_PATH360.arctic)

base_url_s=$(head -n 1 config_ADRS360s.arctic)
base_url_p=$(head -n 1 config_ADRS360p.arctic)
	

cd $IMG360_PATH

echo Shot every $SHOT_EVERY seconds.
echo Work in directory: $(pwd)
echo

s0=$(date +%-S)
s0=$(($s0/SHOT_EVERY))
s0=$(($s0+1))
s0=$(($s0*$SHOT_EVERY))
s0=$(($s0%60))

next_shot_at=$s0
#echo -n "Next shot at: ${next_shot_at}"
echo

while true; do

# current time seconds
ss=$(date +%-S)

#echo $ss $next_shot_at

if [ $ss -eq $next_shot_at ]; then

    next_shot_at=$(($next_shot_at+$SHOT_EVERY))
    next_shot_at=$(($next_shot_at%60))

    #echo 1 > "/sys/class/gpio/gpio69/value"

    shot_dir=$(date +%Y%m%d)/$(date +%H)/$(date +%Y%m%d_%H%M%S)
    mkdir -p $shot_dir

    echo
    echo -n "Retrieving images to $shot_dir"

    get_images_to $shot_dir $base_url_s $base_url_p

    echo -n "Next shot at: ${next_shot_at}"

else
    #echo 0 > "/sys/class/gpio/gpio69/value"
    sleep 0.2
    #echo -n .
fi

done #while


