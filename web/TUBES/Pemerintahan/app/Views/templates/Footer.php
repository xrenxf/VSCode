<!-- partial:../../partials/_footer.html -->
<footer
    class="footer d-flex flex-column flex-md-row align-items-center justify-content-between px-4 py-3 border-top small">
    <p class="text-muted mb-1 mb-md-0">Copyright © 2021 <a href="https://www.nobleui.com" target="_blank">Tamu
            Access</a>.</p>
    <p class="text-muted">Handcrafted With <i class="mb-1 text-primary ms-1 icon-sm" data-feather="heart"></i></p>
</footer>
<!-- partial -->

</div>
</div>

<!-- core:js -->
<script src="<?= base_url('assets/vendors/core/core.js'); ?>"></script>
<!-- endinject -->

<!-- Plugin js for this page -->
<script src="<?= base_url('assets/vendors/datatables.net/jquery.dataTables.js'); ?>"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="<?= base_url('assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js'); ?>"></script>
<!-- End plugin js for this page -->

<!-- inject:js -->
<script src="<?= base_url('assets/vendors/feather-icons/feather.min.js'); ?>"></script>
<script src="<?= base_url('assets/js/template.js'); ?>"></script>
<!-- endinject -->

<!-- Custom js for this page -->
<script src="<?= base_url('assets/js/data-table.js'); ?>"></script>
<!-- End custom js for this page -->

<script>
// Tampilkan animasi loading saat halaman dimuat
$(window).on('load', function() {
    $('#loader').fadeOut('slow');
});

// Tampilkan animasi loading saat halaman direload
$(document).ready(function() {
    $('#loader').show();
});

$(document).ready(function() {
    $('#dataTableJurnal').DataTable();
    $('#dataTablePeserta').DataTable();
});
</script>

<script>
$(document).ready(function() {
    setTimeout(function() {
        $(".alert").fadeOut("slow");
    }, 5000); // Waktu tunggu adalah 5000 milidetik (5 detik)
});
</script>


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/jsqr@1.4.0/dist/jsQR.min.js"></script>

</body>

</html>