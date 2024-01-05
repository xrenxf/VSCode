<?php

namespace App\Controllers;

use App\Models\InformasiJurnalModel;

class Jurnal extends BaseController
{
    protected $jurnalModel;

    public function __construct()
    {
        $this->jurnalModel = new InformasiJurnalModel();
    }

    public function index()
    {
        $data['active_page'] = 'jurnal';
        $data['username'] = 'admin';
        $data['role'] = 'admin';
        $data['jurnal'] = $this->jurnalModel->findAll();
        $data['path'] = 'uploads/jurnal';

        echo view('templates/Header', $data);
        echo view('admin/Jurnal', $data);
        echo view('templates/Footer');
    }

    public function create()
    {
        if ($this->request->getMethod() === 'post') {
            $data = $this->request->getPost();
            $file = $this->request->getFile('file_jurnal');

            if ($file->isValid() && !$file->hasMoved()) {
                // Ubah path ke direktori public
                $folderPath = FCPATH . 'uploads/jurnal';
                if (!is_dir($folderPath)) {
                    mkdir($folderPath, 0777, true);
                }

                $fileName = $file->getRandomName();
                // Pindahkan file ke folder dalam direktori public
                $file->move($folderPath, $fileName);
                $data['file_jurnal'] = 'uploads/jurnal/' . $fileName;
            }

            if ($this->jurnalModel->save($data)) {
                session()->setFlashdata('success', 'Jurnal berhasil ditambahkan.');
            } else {
                session()->setFlashdata('error', 'Jurnal gagal ditambahkan.');
            }
        }
        return redirect()->to('/jurnal');
    }


    public function update($id)
    {
        if ($this->request->getMethod() === 'post') {
            $data = $this->request->getPost();
            $existingData = $this->jurnalModel->find($id);
            $file = $this->request->getFile('file_jurnal');
    
            if ($file->isValid() && !$file->hasMoved()) {
                // Mengubah path ke direktori public
                $folderPath = FCPATH . 'uploads/jurnal';
                $fileName = $file->getRandomName();
                $file->move($folderPath, $fileName);
    
                // Menghapus file lama jika ada
                if (!empty($existingData['file_jurnal']) && file_exists($folderPath . '/' . $existingData['file_jurnal'])) {
                    unlink($folderPath . '/' . $existingData['file_jurnal']);
                }
    
                $data['file_jurnal'] = 'uploads/jurnal/' . $fileName;
            }
    
            if ($this->jurnalModel->update($id, $data)) {
                session()->setFlashdata('success', 'Jurnal berhasil diperbarui.');
            } else {
                session()->setFlashdata('error', 'Jurnal gagal diperbarui.');
            }
        }
        return redirect()->to('/jurnal');
    }
    
    public function delete($id)
    {
        $data = $this->jurnalModel->find($id);
        // Mengubah path ke direktori public
        $folderPath = FCPATH . 'uploads/jurnal';
    
        if (file_exists($folderPath . '/' . $data['file_jurnal'])) {
            unlink($folderPath . '/' . $data['file_jurnal']);
        }
    
        if ($this->jurnalModel->delete($id)) {
            session()->setFlashdata('success', 'Jurnal berhasil dihapus.');
        } else {
            session()->setFlashdata('error', 'Jurnal gagal dihapus.');
        }
        return redirect()->to('/jurnal');
    }
    
}
