<div class="page-content">
    <nav class="page-breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Jurnal</a></li>
            <li class="breadcrumb-item active" aria-current="page">Data Jurnal</li>
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
                        <h6 class="card-title mb-0">Data Jurnal</h6>
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
                        <table id="dataTableJurnal" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID Jurnal</th>
                                    <th>Judul Jurnal</th>
                                    <th>Penulis</th>
                                    <th>Tanggal Publikasi</th>
                                    <th>File Jurnal</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($jurnal as $item): ?>
                                <tr>
                                    <td><?= $item['id_jurnal']; ?></td>
                                    <td><?= $item['judul_jurnal']; ?></td>
                                    <td><?= $item['penulis']; ?></td>
                                    <td><?= $item['tanggal_publikasi']; ?></td>
                                    <td><a href="<?= base_url($item['file_jurnal']) ?>" target="_blank"><?= $item['file_jurnal'] ? "Open File" : "null"; ?></a></td>
                                    <td>
                                        <a href="javascript:void(0)" class="edit-link"
                                            data-id="<?= $item['id_jurnal']; ?>"
                                            data-judul="<?= $item['judul_jurnal']; ?>"
                                            data-penulis="<?= $item['penulis']; ?>"
                                            data-tanggal="<?= $item['tanggal_publikasi']; ?>"
                                            data-file="<?= $item['file_jurnal']; ?>">Edit</a> |
                                        <a href="<?= base_url('/jurnal/delete/' . $item['id_jurnal']) ?>"
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

    <div class="modal fade" id="addJurnalModal" tabindex="-1" aria-labelledby="addJurnalModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="addJurnalModalLabel">Tambah Jurnal</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="addJurnalForm" action="<?= base_url('/jurnal/create') ?>" method="post"
                    enctype="multipart/form-data">
                    <div class="modal-body">
                        <!-- Judul Jurnal -->
                        <div class="mb-3">
                            <label for="judul_jurnal" class="form-label">Judul Jurnal</label>
                            <input type="text" class="form-control" id="judul_jurnal" name="judul_jurnal"
                                placeholder="Enter Title">
                        </div>

                        <!-- Penulis -->
                        <div class="mb-3">
                            <label for="penulis" class="form-label">Penulis</label>
                            <input type="text" class="form-control" id="penulis" name="penulis"
                                placeholder="Enter Author">
                        </div>

                        <!-- Tanggal Publikasi -->
                        <div class="mb-3">
                            <label for="tanggal_publikasi" class="form-label">Tanggal Publikasi</label>
                            <input type="date" class="form-control" id="tanggal_publikasi" name="tanggal_publikasi">
                        </div>

                        <!-- File Jurnal (Upload File) -->
                        <div class="mb-3">
                            <label for="file_jurnal" class="form-label">File Jurnal</label>
                            <input type="file" class="form-control" id="file_jurnal" name="file_jurnal">
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


    <!-- JavaScript Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
    $(document).ready(function() {
        $('#addData').click(() => {
            $('#addJurnalModal').modal('show');
            $('#addJurnalForm').attr('action', '<?= base_url('/jurnal/create') ?>');
            $('#addJurnalModalLabel').text('Tambah Jurnal');
            // Clear form fields
            $('#judul_jurnal').val('');
            $('#penulis').val('');
            $('#tanggal_publikasi').val('');
            $('#file_jurnal').val('');
        });

        $('.edit-link').click(function() {
            var id = $(this).data('id');
            var judul = $(this).data('judul');
            var penulis = $(this).data('penulis');
            var tanggal = $(this).data('tanggal');
            var file = $(this).data('file');

            // Mengatur action form dan teks judul modal
            $('#addJurnalForm').attr('action', '<?= base_url('/jurnal/update/') ?>' + id);
            $('#addJurnalModalLabel').text('Update Jurnal');

            // Memasukkan data ke dalam input form
            $('#judul_jurnal').val(judul);
            $('#penulis').val(penulis);
            $('#tanggal_publikasi').val(tanggal);
            // File tidak bisa di-set karena keamanan browser

            $('#addJurnalModal').modal('show');
        });
    });
    </script>