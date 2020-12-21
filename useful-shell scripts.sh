#Sum every few lines
awk -F, '{sum+=$1}{if(NR % 7==0){print sum;sum=0}fi} END {if ( NR % 7!=0 ) print sum fi} ' test.txt