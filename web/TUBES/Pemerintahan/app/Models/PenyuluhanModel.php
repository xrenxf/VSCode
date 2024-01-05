<?php

namespace App\Models;

use CodeIgniter\Model;

class PenyuluhanModel extends Model
{
    protected $table = 'penyuluhan'; // Nama tabel
    protected $primaryKey = 'id_penyuluhan'; // Kunci utama tabel

    protected $useAutoIncrement = true; // Gunakan auto increment untuk primaryKey
    protected $returnType = 'array'; // Tipe data yang dikembalikan

    protected $allowedFields = [
        'nama_penyuluhan',
        'tanggal_pelaksanaan',
        'no_sk',
        'surat_kinerja'
    ]; // Daftar field yang dapat diisi

    protected $useTimestamps = false; // Jika Anda ingin menggunakan timestamp (created_at, updated_at)

    // Jika Anda ingin menambahkan validasi, tambahkan rules di sini
    protected $validationRules = [];
    protected $validationMessages = [];
    protected $skipValidation = false;

    // Anda juga dapat menambahkan fungsi-fungsi khusus jika diperlukan
}
