#mount 129.241.143.125:/volume1/imu_share /media/imu_share
#sleep 5

#mount 129.241.143.125:/volume1/imu_data/imu_1 /media/imu_data
#sleep 5
#chmod 777 /media/imu_data

#mount 192.168.188.2:/volume1/CAMTEST /media/camdata
#sleep 5
#chmod 777 /media/camdata

mount 192.168.188.2:/volume1/arctic/O360 /media/O360
sleep 5
#chmod 777 /media/O360

mount 192.168.188.2:/volume1/arctic/IMU1 /media/imu_data
sleep 5
#chmod 777 /media/imu_data

mount 192.168.188.2:/volume1/arctic/IMU_COMMONS /media/imu_share
sleep 5
#chmod 444 /media/imu_share