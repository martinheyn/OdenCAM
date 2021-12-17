#!/bin/bash

#sleep 40
#echo 45 > /sys/class/gpio/export
#echo in > /sys/class/gpio/gpio45/direction
#echo 44 > /sys/class/gpio/export
#echo in > /sys/class/gpio/gpio44/direction
#echo 23 > /sys/class/gpio/export
#echo in > /sys/class/gpio/gpio23/direction
#echo 26 > /sys/class/gpio/export
#echo in > /sys/class/gpio/gpio26/direction

#echo 21 > /sys/class/gpio/export
#echo out > /sys/class/gpio/gpio21/direction
#echo 0 > /sys/class/gpio/gpio21/value
#echo 22 > /sys/class/gpio/export
#echo out > /sys/class/gpio/gpio22/direction
#echo 0 > /sys/class/gpio/gpio22/value
#echo 23 > /sys/class/gpio/export
#echo out > /sys/class/gpio/gpio23/direction
#echo 0 > /sys/class/gpio/gpio23/value
#echo 24 > /sys/class/gpio/export
#echo out > /sys/class/gpio/gpio24/direction
#echo 0 > /sys/class/gpio/gpio24/value

#knopf_1_addr="/sys/class/gpio/gpio45/value"
#knopf_2_addr="/sys/class/gpio/gpio44/value"
#knopf_3_addr="/sys/class/gpio/gpio23/value"
#knopf_4_addr="/sys/class/gpio/gpio26/value"
#led_1_addr="/sys/class/gpio/gpio21/value"
#led_2_addr="/sys/class/gpio/gpio22/value"
#led_3_addr="/sys/class/gpio/gpio23/value"
#led_4_addr="/sys/class/gpio/gpio24/value"

while true; do

        #knopf_1=$(< "$knopf_1_addr")
        #knopf_2=$(< "$knopf_2_addr")
        #knopf_3=$(< "$knopf_3_addr")
        #knopf_4=$(< "$knopf_4_addr")

        #echo "$knopf_1"
        #echo "$knopf_2"
        #echo "$knopf_3"
        #echo "$knopf_4"

        #comp=$1
echo "   U  ___ u  ____  U _____ u _   _     ";
echo "    \/\"_ \/ |  _\"\ \| ___\"|/| \ |\"|    ";
echo "    | | | |/| | | | |  _|\" <|  \| |>   ";
echo ".-,_| |_| |U| |_| |\| |___ U| |\  |u   ";
echo " \_)-\___/  |____/ u|_____| |_| \_|    ";
echo "      \\     |||_   <<   >> ||   \\,-. ";
echo "     (__)   (__)_) (__) (__)(_\")  (_/  ";
echo ""
echo "====>>>>                          <<<<===="
echo "====>>>> Oden's 360 camera system <<<<===="
echo "====>>>>                          <<<<===="
echo ""
echo "0: Synchronise with NTP and NAS server"
echo "1: Run 360 camera on 1.0 fps"
echo "2: Run 360 camera on 0.5 fps"
echo "3: Run 360 camera on 0.2 fps"
echo "4: Run 360 camera on 0.1 fps"
echo "5: Run 360 camera on 0.00167 fps"
echo "9: Stop the camera"
read -p "Please choose: " keys

	if [ "$keys" -eq "0" ]
        then    systemctl start rtc_ds3231.service
		sleep 20
		systemctl start nfs_share.service
		sleep 10
		echo "The time has been synchronised and the NAS is connected"
	else
	systemctl stop get_O360.service
	fi

	if [ "$keys" -eq "1" ]
        then    echo "1" > var_FPS360.arctic
	        systemctl start get_O360.service
                echo "The 360 camera now operates with 1 fps"
 #               echo 1 > "$led_1_addr"
#				echo 1 > "$led_2_addr"
#				echo 1 > "$led_3_addr"
#				echo 1 > "$led_4_addr"
				
        elif [ "$keys" -eq "2" ]
        then    echo "2" > var_FPS360.arctic
		        systemctl start get_O360.service
                echo "The 360 camera now operates with 0.5 fps"
 #               echo 1 > "$led_1_addr"
	#			echo 1 > "$led_2_addr"
	#			echo 1 > "$led_3_addr"
	#			echo 0 > "$led_4_addr"
				
        elif [ "$keys" -eq "3" ]
        then    echo "5" > var_FPS360.arctic
		        systemctl start get_O360.service
                echo "The 360 camera now operates with 0.2 fps"
     #           echo 1 > "$led_1_addr"
		#		echo 1 > "$led_2_addr"
		#		echo 0 > "$led_3_addr"
		#		echo 0 > "$led_4_addr"
        elif [ "$keys" -eq "4" ]
        then    echo "10" > var_FPS360.arctic
		        systemctl start get_O360.service
                echo "The 360 camera now operates with 0.1 fps"
         #       echo 1 > "$led_1_addr"
			#	echo 0 > "$led_2_addr"
			#	echo 0 > "$led_3_addr"
			#	echo 0 > "$led_4_addr"
        elif [ "$keys" -eq "5" ]
        then    echo "600" > var_FPS360.arctic
		        systemctl start get_O360.service
                echo "The 360 camera now operates with 0.00167 fps"
             #   echo 1 > "$led_1_addr"
				#echo 0 > "$led_2_addr"
			#	echo 1 > "$led_3_addr"
			#	echo 0 > "$led_4_addr"
        elif [ "$keys" -eq "9" ]
        then    echo "The 360 camera has been stopped. Have a good day."
		     #   echo 0 > "$led_1_addr"
			#	echo 0 > "$led_2_addr"
			#	echo 0 > "$led_3_addr"
			#	echo 0 > "$led_4_addr"
        fi
sleep 1
# fi
done #while
