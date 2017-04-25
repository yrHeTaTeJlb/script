#!/system/bin/sh
tap(){
  x=$1
  y=$2
  sendevent /dev/input/event7 1 330 1    #BTN_TOUCH DOWN
  sendevent /dev/input/event7 3 57 0     #ABS_MT_TRACKING_ID
  sendevent /dev/input/event7 3 48 12    #ABS_MT_TOUCH_MAJOR
  sendevent /dev/input/event7 3 58 129   #ABS_MT_PRESSURE
  sendevent /dev/input/event7 3 53 $x    #ABS_MT_POSITION_X
  sendevent /dev/input/event7 3 54 $y    #ABS_MT_POSITION_Y
  sendevent /dev/input/event7 0 0 2      #SYN_MT_REPORT
  sendevent /dev/input/event7 0 0 0      #SYN_REPORT
  sendevent /dev/input/event7 3 57 -1    #ABS_MT_TRACKING_ID
  sendevent /dev/input/event7 0 0 0      #SYN_REPORT
  sendevent /dev/input/event7 1 330 0    #BTN_TOUCH UP
  sendevent /dev/input/event7 0 0 0      #SYN_REPORT
}
swipe(){
  x1=$1
  y1=$2
  
  x3=$3
  y3=$4
  
  x2=$(($(($x1+$x3))/2))
  y2=$(($(($y1+$y3))/2))
  
  sendevent /dev/input/event7 1 330 1    #BTN_TOUCH DOWN
  sendevent /dev/input/event7 3 57 0     #ABS_MT_TRACKING_ID
  sendevent /dev/input/event7 3 48 12    #ABS_MT_TOUCH_MAJOR
  sendevent /dev/input/event7 3 58 129   #ABS_MT_PRESSURE
  sendevent /dev/input/event7 3 53 $x1   #ABS_MT_POSITION_X
  sendevent /dev/input/event7 3 54 $y1   #ABS_MT_POSITION_Y
  sendevent /dev/input/event7 0 0 2      #SYN_MT_REPORT
  sendevent /dev/input/event7 0 0 0      #SYN_REPORT
  sendevent /dev/input/event7 3 53 $x2   #ABS_MT_POSITION_X
  sendevent /dev/input/event7 3 54 $y2   #ABS_MT_POSITION_Y
  sendevent /dev/input/event7 0 0 2      #SYN_MT_REPORT
  sendevent /dev/input/event7 0 0 0      #SYN_REPORT
  sendevent /dev/input/event7 3 53 $x3   #ABS_MT_POSITION_X
  sendevent /dev/input/event7 3 54 $y3   #ABS_MT_POSITION_Y
  sendevent /dev/input/event7 0 0 2      #SYN_MT_REPORT
  sendevent /dev/input/event7 0 0 0      #SYN_REPORT
  sendevent /dev/input/event7 3 57 -1    #ABS_MT_TRACKING_ID
  sendevent /dev/input/event7 0 0 0      #SYN_REPORT
  sendevent /dev/input/event7 1 330 0    #BTN_TOUCH UP
  sendevent /dev/input/event7 0 0 0      #SYN_REPORT
}
while true; do
  swipe 300 500 900 500
  tap 900 500
  tap 900 500
  tap 900 500
  tap 900 500
  swipe 900 500 300 500
done
