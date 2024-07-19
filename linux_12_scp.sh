#parse flags arg
while getopts f:u:i:k:: flag
do
    case "${flag}" in
        f) file=${OPTARG};;
        u) username=${OPTARG};;
        i) dest_ip=${OPTARG};;
        i) key=${OPTARG};;
    esac
done

#if key is provided, use key
if [ -n "$key" ]; then
  scp -i $key $file ${username}@${dest_ip}:~
  exit 0
fi

# Copy the file using scp
scp $file ${username}@${dest_ip}:~