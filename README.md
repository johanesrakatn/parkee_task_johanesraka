# parkee_task_johanesraka

format nama file <jenis soal>_<nomor soal>
ex : linux_1.sh -> script untuk soal bagin Linux no. 1

---
## Linux

1. linux_1.sh
   Usage : `bash linux_1.sh -d [directory] -e [extension (without '.') ]`
2. linux_2.sh
   Usage : `bash linux_2.sh -s [source directory] -b [backup destination (directory)]`
   Asumsi : 
   - saya membuat hasil nama file backup menjadi `<nama directory yang dibackup>_<timestamp dalam WIB>.tar.gz`
   - jika directory lokasi backup tidak ada, maka akan dibuat
3. linux_3.sh
   Usage : `bash linux_3.sh -d [directory]`
4. linux_4.sh
   Usage : `bash linux_4.sh -s [source directory] -b [backup destination (directory)]`
   Asumsi : 
   - saya berasumsi backup lama yang dihapus juga berada di destinasi backup baru (directory sama)
   - asumsi lainnya sama seperti no. 2
5. linux_5.sh
   Usage : `bash linux_5.sh`
6. linux_6.sh
   Usage : `bash linux_6.sh -d [directory] -n [key name]`
7. linux_7.sh
   Usage : `bash linux_7.sh -p [public_key path (include filename and .pub)] -u [username] -i [server ip]`
8. linux_8.sh
   Usage : `bash linux_8.sh -u [username] -i [server ip]`
   Asumsi :
   - saya berasumsi script ini untuk cek apakah user bisa ssh tanpa password sehingga saya menggunakan `-o BatchMode=yes` pada command ssh
9. linux_9.sh
   Usage : `bash linux_9.sh -p [public_key path (include filename and .pub)] -u [username]`
10. linux_10.sh
    Usage : `bash linux_10.sh -s [unique string] -u [username]`
11. linux_11.sh
    Usage : `bash linux_11.sh -a [action (start, stop, status)] -s [service name]`
12. a. linux_12_scp.sh (with scp)
    Usage : `bash linux_12_scp.sh -f [directory name] -u [username] -i [server ip] -k [path to public_key]` (parameter -k bisa dipakai untuk menspesifikasi public key yang digunakan, parameter ini optional)
    Asumsi : Karena disoal ditulis "copy direktori" maka saya memakai -r dalam scp
    b. linux_12_rsync.sh (with scp)
    Usage : `bash linux_12_scp.sh -f [directory name] -u [username] -i [server ip]`
    Asumsi : Karena disoal ditulis "copy direktori" maka saya memakai -a dalam rsync
13. linux_13.sh
    Usage : `bash linux_13.sh -f [filename of python script]`
    Asumsi : 
    - harus dispesifikasikan nama python script yang ingin dijadikan service
14. linux_14.sh
    Usage : `bash linux_14.sh`
15. linux_15.sh
    Usage : `bash linux_15.sh -f [filename of python script]`
    Asumsi : 
    - Karena service yang digunakan merupakan notify-send, saya berasumsi system sudah mempunyai notidy-send package
16. linux_16.sh
    Usage : `bash linux_16.sh`
17. linux_17.sh
    Usage : `bash linux_17.sh`
    Asumsi : koneksi yang diijinkan masuk berjenis tcp saja
18. linux_18.sh
    Usage : `bash linux_18.sh`
19. python_csv.py
    Usage : `python3 python_csv.py`
    Asumsi : saya berasumsi hasil akhir dataframe di print ke terminal
20. python_api.py
    Usage : `python3 python_api.py -c <country, default = "United States"> -s <state-province filter option, default = 0`
    Penjelasan : untuk flag `-s` ada 3 nilai : 
    - **0** = display all data, tidak ada pemfilteran 'state-province' (nilai default)
    - **1** = hapus data yang tidak memiliki 'state-province'
    - **2** = display semua data yang tidak memiliki 'state-province'
    - opsi lain akan default ke opsi **0**
    Asumsi : 
    - saya berasumsi hasil akhir dataframe di print ke terminal, tetapi karena hasilnya banyak sekali saya hanya print .head() nya saja
    - maaf untuk filtering data "state-province" karena saya tidak yakin maksud pastinya, maka saya berikan opsi untuk ketiganya

