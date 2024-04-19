<div class="row">
<!--     <div class="col-lg-12">
        <a href="<?= base_url('add_sizes'); ?>" class="btn btn-info w-200" alt="Add new notes"><b>+ </b>Add</a>
    </div> -->
    <div class="card-body">
        <div class="card">
            <div id="message" class="alert" style="display: none;"></div>
            <div class="card-header">
                <h4 class="ven">List of Sizes</h4>
        <div class="col-sm-11">
          <a href="<?= base_url('add_sizes'); ?>" class="btn btn-info w-250 float-right" alt="Add new notes"><b>+ </b>Add Sizes</a>
        </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover" id="tableExport" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>Size Type</th>
                                <th>Size Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($sizes)) { ?>
                                <?php foreach ($sizes as $size) { ?>
                                    <tr>
                                        <td><?php echo $size['size_type_name']; ?></td>
                                        <td><?php echo $size['size_name']; ?></td>
                                        <td>
                                            <a href="<?= base_url('admin/edit_sizes?id=' . $size['id']); ?>" class="mr-2">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <a href="#" onclick="confirmsizeDelete(<?= $size['id']; ?>)" class="mr-2 text-danger">
                                                <i class="far fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                <?php } ?>
                            <?php } else { ?>
                                <tr>
                                    <td colspan="3">No data available</td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
