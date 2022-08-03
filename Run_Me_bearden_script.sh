#!/bin/bash

echo " "
echo "Setting codec"
fpgautil -b config_codec.bit.bin

sleep 2
echo " "
echo "Loading Dennis Beardens bin file"
fpgautil -b design_1_wrapper.bit.bin

sleep .1
echo " "
echo "Printing counter register"
devmem 0x43c0000c w

sleep .5

devmem 0x43c0000c w

sleep .5

devmem 0x43c0000c w

sleep .5

devmem 0x43c0000c w

sleep .5

echo " "
echo "Tuning radio test 30Mhz and 30.1Mhz play back"
devmem 0x43c00004 w 30000000
devmem 0x43c00000 w 30001000

sleep 2

echo " "
echo "Compiling and running Dennis Bearden's test radio"
gcc bearden_test_radio.c -o bearden_test_radio
./bearden_test_radio

