    <div class="page-content">
        <nav class="page-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Tables</a></li>
                <li class="breadcrumb-item active" aria-current="page">Data Penyuluhan</li>
            </ol>
        </nav>

        <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
                <div class="card shadow">
                    <div class="card-body">
                        
                        <?php if (session()->getFlashdata('success')): ?>
                        <div class="alert alert-success">
                            <?= session()->getFlashdata('success'); ?>
                        </div>
                        <?php elseif (session()->getFlashdata('error')): ?>
                        <div class="alert alert-danger">
                            <?= session()->getFlashdata('error'); ?>
                        </div>
                        <?php endif; ?>

                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h6 class="card-title mb-0">Data Penyuluhan</h6>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="addDataDropdown"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i data-feather="plus"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="addDataDropdown">
                                    <a class="dropdown-item" href="#" id="addData">Tambah Data</a>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table id="dataTablePeserta" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>ID Penyuluhan</th>
                                        <th>Nama Penyuluhan</th>
                                        <th>Tanggal Pelaksanaan</th>
                                        <th>No SK</th>
                                        <th>Surat Kinerja</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($penyuluhan as $item): ?>
                                    <tr>
                                        <td><?= $item['id_penyuluhan']; ?></td>
                                        <td><?= $item['nama_penyuluhan']; ?></td>
                                        <td><?= $item['tanggal_pelaksanaan']; ?></td>
                                        <td><?= $item['no_sk']; ?></td>
                                        <td><a href="<?= base_url($item['surat_kinerja']) ?>" target="_blank"><?= $item['surat_kinerja'] ? "Open File" : "null"; ?></a></td>
                                        <td>
                                            <a href="javascript:void(0)" class="edit-link"
                                                data-id="<?= $item['id_penyuluhan']; ?>"
                                                data-nama="<?= $item['nama_penyuluhan']; ?>"
                                                data-tanggal="<?= $item['tanggal_pelaksanaan']; ?>"
                                                data-nosk="<?= $item['no_sk']; ?>"
                                                data-surat="<?= $item['surat_kinerja']; ?>">Edit</a> |
                                            <a href="<?= base_url('/penyuluhan/delete/' . $item['id_penyuluhan']) ?>"
                                                onclick="return confirm('Are you sure?')">Delete</a>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Add Class -->
        <div class="modal fade" id="addClassModal" tabindex="-1" aria-labelledby="addClassModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="addClassModalLabel">Tambah Penyuluhan</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="addClassForm" action="<?= base_url('/penyuluhan/create') ?>" method="post"
                        enctype="multipart/form-data">
                        <div class="modal-body">
                            <!-- Nama Penyuluhan -->
                            <div class="mb-3">
                                <label for="nama_penyuluhan" class="form-label">Nama Penyuluhan</label>
                                <input type="text" class="form-control" id="nama_penyuluhan" name="nama_penyuluhan"
                                    placeholder="Enter Name">
                            </div>

                            <!-- Tanggal Pelaksanaan -->
                            <div class="mb-3">
                                <label for="tanggal_pelaksanaan" class="form-label">Tanggal Pelaksanaan</label>
                                <input type="date" class="form-control" id="tanggal_pelaksanaan" name="tanggal_pelaksanaan">
                            </div>

                            <!-- Nomor SK -->
                            <div class="mb-3">
                                <label for="no_sk" class="form-label">Nomor SK</label>
                                <input type="text" class="form-control" id="no_sk" name="no_sk"
                                    placeholder="Enter SK Number">
                            </div>

                            <!-- Surat Kinerja (Upload File) -->
                            <div class="mb-3">
                                <label for="surat_kinerja" class="form-label">Surat Kinerja</label>
                                <input type="file" class="form-control" id="surat_kinerja" name="surat_kinerja">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
    $(document).ready(function() {
        $('#addData').click(() => {
            // Mengatur action form dan teks judul modal
            $('#addClassForm').attr('action', '<?= base_url('/penyuluhan/create') ?>');
            $('#addClassModalLabel').text('Tambah Penyuluhan');

            // Memasukkan data ke dalam input form
            $('#nama_penyuluhan').val('');
            $('#tanggal_pelaksanaan').val('');
            $('#no_sk').val('');

            $('#addClassModal').modal('show');
        });

        $('.edit-link').click(function() {
            var id = $(this).data('id');
            var nama = $(this).data('nama');
            var tanggal = $(this).data('tanggal');
            var noSk = $(this).data('nosk');
            var surat = $(this).data('surat');

            // Mengatur action form dan teks judul modal
            $('#addClassForm').attr('action', '<?= base_url('/penyuluhan/update/') ?>' + id);
            $('#addClassModalLabel').text('Update Penyuluhan');

            // Memasukkan data ke dalam input form
            $('#nama_penyuluhan').val(nama);
            $('#tanggal_pelaksanaan').val(tanggal);
            $('#no_sk').val(noSk);

            $('#addClassModal').modal('show');
        });
    });
    </script>