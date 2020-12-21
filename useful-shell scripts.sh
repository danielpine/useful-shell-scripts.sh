#Sum every few lines
awk -F, '{sum+=$1}{if(NR % 7==0){print sum;sum=0}fi} END {if ( NR % 7!=0 ) print sum fi} ' test.txt
#View the GC parameters that can be configured in real time
java -XX:+PrintFlagsFinal -version | grep manageable
#View the service process number
jps
#Open the dump file before full GC + means on - means off.
#18881 represents the application process number
jinfo -flag +HeapDumpBeforeFullGC 18881
jinfo -flag HeapDumpPath=/elab/spring-boot/logs/dump_file 18881
#Check to see if the configuration is in effect
jinfo -flag HeapDumpPath 18881
#View the current JVM configuration in application
jinfo -flags 18881
#Sum by rows
awk -F, '{print $2}' test.txt | xargs -n7 | awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7} END {print a1,a2,a3,a4,a5,a6,a7}'
## whole number print
awk -F, '{print $2}' test.txt | xargs -n7 | awk '{a1+=$1;a2+=$2;a3+=$3;a4+=$4;a5+=$5;a6+=$6;a7+=$7} END {printf("%f,%f,%f,%f,%f,%f,%f\n",a1,a2,a3,a4,a5,a6,a7)}'
#Quickly clear a directory
## 1) make a empty directory
touch /data/blank
## 2) clear files using command rsync
rsync --delete-before -d /data/blank /target_dir
