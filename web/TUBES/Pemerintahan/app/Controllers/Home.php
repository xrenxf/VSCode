<?php

namespace App\Controllers;

use App\Models\PenyuluhanModel;

class Home extends BaseController
{
    protected $penyuluhanModel;

    public function __construct()
    {
        $this->penyuluhanModel = new PenyuluhanModel();
    }

    public function index()
    {
        $data['active_page'] = 'penyuluhan';
        $data['username'] = 'admin';
        $data['role'] = 'admin';
        $data['penyuluhan'] = $this->penyuluhanModel->findAll();
        $data['path'] = 'uploads/penyuluhan';

        echo view('templates/Header', $data);
        echo view('admin/Penyuluhan', $data);
        echo view('templates/Footer');
    }

    public function createPenyuluhan()
    {
        if ($this->request->getMethod() === 'post') {
            $data = $this->request->getPost();
            $file = $this->request->getFile('surat_kinerja');

            if ($file->isValid() && !$file->hasMoved()) {
                // Mengubah path ke direktori public
                $folderPath = FCPATH . 'uploads/penyuluhan';
                if (!is_dir($folderPath)) {
                    mkdir($folderPath, 0777, true);
                }

                $fileName = $file->getRandomName();
                $file->move($folderPath, $fileName);
                $data['surat_kinerja'] = 'uploads/penyuluhan/' . $fileName;
            }

            if ($this->penyuluhanModel->save($data)) {
                session()->setFlashdata('success', 'Data berhasil ditambahkan.');
            } else {
                session()->setFlashdata('error', 'Data gagal ditambahkan.');
            }
            return redirect()->to('/penyuluhan');
        }

        // Tampilkan form jika method bukan POST
        return redirect()->to('/penyuluhan');
    }


    public function updatePenyuluhan($id)
    {
        if ($this->request->getMethod() === 'post') {
            $data = $this->request->getPost();
            $existingData = $this->penyuluhanModel->find($id);

            $file = $this->request->getFile('surat_kinerja');
            if ($file->isValid() && !$file->hasMoved()) {
                // Mengubah path ke direktori public
                $folderPath = FCPATH . 'uploads/penyuluhan';
                $fileName = $file->getRandomName();
                $file->move($folderPath, $fileName);

                // Hapus file lama jika ada
                if (!empty($existingData['surat_kinerja']) && file_exists($folderPath . '/' . $existingData['surat_kinerja'])) {
                    unlink($folderPath . '/' . $existingData['surat_kinerja']);
                }

                $data['surat_kinerja'] = 'uploads/penyuluhan/' . $fileName;
            } else {
                // Jangan update kolom surat_kinerja jika tidak ada file baru
                unset($data['surat_kinerja']);
            }

            if ($this->penyuluhanModel->update($id, $data)) {
                session()->setFlashdata('success', 'Data berhasil diperbarui.');
            } else {
                session()->setFlashdata('error', 'Data gagal diperbarui.');
            }
            return redirect()->to('/penyuluhan');
        }

        // Tampilkan form update jika method bukan POST
        $data['penyuluhan'] = $this->penyuluhanModel->find($id);
        return redirect()->to('/penyuluhan');
    }


    public function deletePenyuluhan($id)
    {
        $data = $this->penyuluhanModel->find($id);
        // Mengubah path ke direktori public
        $folderPath = FCPATH . 'uploads/penyuluhan';

        if (file_exists($folderPath . '/' . $data['surat_kinerja'])) {
            unlink($folderPath . '/' . $data['surat_kinerja']);
        }

        if ($this->penyuluhanModel->delete($id)) {
            session()->setFlashdata('success', 'Data berhasil dihapus.');
        } else {
            session()->setFlashdata('error', 'Data gagal dihapus.');
        }
        return redirect()->to('/penyuluhan');
    }

}
