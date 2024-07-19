#parse flags arg
while getopts f:u:i:k:: flag
do
    case "${flag}" in
        f) file=${OPTARG};;
        u) username=${OPTARG};;
        i) dest_ip=${OPTARG};;
    esac
done

# Copy the file using scp
rsync -av $file ${username}@${dest_ip}:~