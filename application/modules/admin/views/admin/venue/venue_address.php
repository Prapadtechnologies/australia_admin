<div class="row">
  <div class="col-lg-12">
    <a href="<?= base_url('add_venue_address'); ?>" class="btn btn-info w-200" alt="Add new notes"><b>+ </b>Add</a>
  </div>
  <div class="card-body">
    <div class="card">
      <div class="card-header">
        <h4 class="ven">List of Venue_Address</h4>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-striped table-hover" id="tableExport" style="width: 100%;">
            <thead>
              <tr>
                <th>Name</th>
                <th>Address Line One</th>
                <th>Address Line Two</th>
                <th>Capacity</th>
                <th>City</th>
                <th>Phone</th>
                <th>StateProvince</th>
                <th>Country</th>
                <th>Postal Code</th>
                <th>Is Verified</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
             <?php if (!empty($categories)) { ?>
               <?php foreach ($categories as $category) { ?>
                 <tr>
                   <td><?= $category['name']; ?></td>
                   <td><?= $category['addressLineOne']; ?></td>
                   <td><?= $category['addressLineTwo']; ?></td>
                   <td><?= $category['capacity']; ?></td>
                   <td><?= $category['city']; ?></td>
                   <td><?= $category['phone']; ?></td>
                   <td><?= $category['stateProvince']; ?></td>
                   <td><?= $category['country']; ?></td>
                   <td><?= $category['postalCode']; ?></td>
                   <!-- Is Verified -->
                   <td>
                    <span class="<?php echo $category['isVerified'] == '1' ? 'text-success' : 'text-danger'; ?>">
                      <?php echo $category['isVerified'] == '1' ? '1' : '0'; ?>
                    </span>
                  </td>

                  <td>


                   <a href="<?php echo base_url('admin/edit_venue_address?id=' . $category['id']); ?>" class="mr-2"> <i class="fas fa-pencil-alt"></i> </a>
                   <a href="#" onclick="confirmvenueDelete(<?php echo $category['id']; ?>)" class="mr-2 text-danger"><i class="far fa-trash-alt"></i></a>

                 </td>
               </tr>
             <?php } ?>
           <?php } else { ?>
            <tr>
              <td colspan="13">No data available</td>
            </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
</div>
</div>

