#!bin/bash/

for fname in $(ls *zip); 
do
   echo unpacking $fname;
   unzip -o $fname; rm -r $fname;
done

