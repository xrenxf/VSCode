<?php

namespace App\Models;

use CodeIgniter\Model;

class InformasiJurnalModel extends Model
{
    protected $table = 'informasi_jurnal'; // Nama tabel
    protected $primaryKey = 'id_jurnal'; // Kunci utama tabel

    protected $useAutoIncrement = true; // Gunakan auto increment untuk primaryKey
    protected $returnType = 'array'; // Tipe data yang dikembalikan

    protected $allowedFields = [
        'judul_jurnal',
        'penulis',
        'tanggal_publikasi',
        'file_jurnal'
    ]; // Daftar field yang dapat diisi

    protected $useTimestamps = true; // Mengaktifkan penggunaan timestamps
    protected $createdField  = 'created_at'; // Field untuk 'created_at'
    protected $updatedField  = 'updated_at'; // Field untuk 'updated_at'

    protected $dateFormat = 'datetime'; // Format tanggal

    // Jika Anda ingin menambahkan validasi, tambahkan rules di sini
    protected $validationRules = [];
    protected $validationMessages = [];
    protected $skipValidation = false;

    // Anda juga dapat menambahkan fungsi-fungsi khusus jika diperlukan
}
