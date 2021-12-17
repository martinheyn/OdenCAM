#!/bin/bash

while true; do

        
echo "   U  ___ u  ____  U _____ u _   _     ";
echo "    \/\"_ \/ |  _\"\ \| ___\"|/| \ |\"|    ";
echo "    | | | |/| | | | |  _|\" <|  \| |>   ";
echo ".-,_| |_| |U| |_| |\| |___ U| |\  |u   ";
echo " \_)-\___/  |____/ u|_____| |_| \_|    ";
echo "      \\     |||_   <<   >> ||   \\,-. ";
echo "     (__)   (__)_) (__) (__)(_\")  (_/  ";
echo ""
echo "====>>>>                          <<<<===="
echo "====>>>>     MAIA			        <<<<===="
echo "====>>>>                          <<<<===="
echo ""
echo "0: Synchronise with NTP and NAS server"
echo "1: Start a new recording"
echo "2: Stop recording"
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
