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
