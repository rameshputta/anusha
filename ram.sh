#!env bash
start=1
end=584
for counter in {1..447509}
do
   #echo $counter. "\$start = " $start " and \$end = " $end

KP=`grep -E -o "5grancpe.{0,30}" newfile.csv |  head -$end | awk -F"," '{print $3}' | awk '{ total += $1; count++ } END { print total/count }'`

timestampstart=1495223431
#echo "\$KP" $counter. "\$start = " $start " and \$end = " $end
echo "Timestamp="$(( $timestampstart + $counter ))  "Imsi=311489003000008" "avg for "$counter "is" $KP


   if [[ $start -eq 1 ]];
   then
      start=0
   fi
   start=$(($start+584))
   end=$(($end+584))
   if [[ $end -ge 447509 ]];
   then
      break
   fi
done
