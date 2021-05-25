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
#View linux version
cat /proc/version
uname -a
cat /etc/issue
cat /etc/redhat-release
lsb_release -a
#Statistics the number of occurrences of a specified field in text
grep -Po "(?<=\"name\": \").*(?=\")" dashboard/data.json | sort | uniq -c | sort -rn
#Sum by same column tag
awk '{seen[$1]+=$2} END { for (i in seen) print i,seen[i] }' dashboard/count_by_same_column_tag.txt
#pip -i
pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/

git log --author="your name" --since=2021-04-13 --until=2021-07-14 --pretty=tformat: --numstat | awk '{add += 2; loc += 2} END {printf "added lines:%s removed lines:%s total lines: %s\n", add,subs,loc}'
git log --since=2021-04-13 --until=2021-07-14 --pretty=tformat: --numstat | awk '{add += 2; loc += 2} END {printf "added lines:%s removed lines:%s total lines: %s\n", add,subs,loc}'


i=1

for name in `ls`;
do
echo $((i=i+1))
newname=`printf "%05d.jpg" $i`
echo $newname
mv $name $newname
done


