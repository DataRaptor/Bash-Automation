#!/bin/bash
#

pval=$(pidof gnome-shell)
echo $pval
sudo renice -n -20 -p $pval

exit 0
















