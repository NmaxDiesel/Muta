#!/bin/bash

# Array untuk menyimpan daftar barang
declare -a daftar_barang

echo "Selamat datang di Program Manajemen Barang!"
echo "-----------------------------------------"

# Fungsi untuk menampilkan daftar barang
tampilkan_daftar_barang() {
    echo "Daftar Barang:"
    echo "--------------"
    for ((i=0; i<${#daftar_barang[@]}; i++))
    do
        echo "$(($i+1)). ${daftar_barang[$i]}"
    done
    echo "--------------"
}

# Loop utama program
while true
do
    echo "Menu:"
    echo "1. Tambah Barang"
    echo "2. Hapus Barang"
    echo "3. Lihat Daftar Barang"
    echo "4. Keluar"

    read -p "Pilih menu: " pilihan_menu

    case $pilihan_menu in
        1)
            read -p "Masukkan nama barang: " nama_barang
            daftar_barang+=("$nama_barang")
            echo "Barang berhasil ditambahkan!"
            ;;
        2)
            tampilkan_daftar_barang
            read -p "Pilih nomor barang yang ingin dihapus: " nomor_barang
            if [[ $nomor_barang -ge 1 && $nomor_barang -le ${#daftar_barang[@]} ]]; then
                unset daftar_barang[$(($nomor_barang-1))]
                daftar_barang=("${daftar_barang[@]}")
                echo "Barang berhasil dihapus!"
            else
                echo "Nomor barang tidak valid!"
            fi
            ;;
        3)
            tampilkan_daftar_barang
            ;;
        4)
            echo "Terima kasih telah menggunakan Program Manajemen Barang!"
            exit 0
            ;;
        *)
            echo "Menu tidak valid!"
            ;;
    esac

    echo "-----------------------------------------"
done
