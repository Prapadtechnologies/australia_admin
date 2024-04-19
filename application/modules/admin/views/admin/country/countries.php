<div class="row">
<!--   <div class="col-lg-12">
    <a href="<?= base_url('add_countries'); ?>" class="btn btn-info w-200" alt="Add new notes"><b>+ </b>Add</a>
 </div> -->
 <div class="card-body">
    <div class="card">
      <div id="message" class="alert" style="display: none;"></div>
      <div class="card-header">
        <h4 class="ven">List of countries</h4>
        <div class="col-sm-11">
          <a href="<?= base_url('add_countries'); ?>" class="btn btn-info w-250 float-right" alt="Add new notes"><b>+ </b>Add Countries</a>
        </div>
     </div>
     <div class="card-body">
        <div class="table-responsive">
          <table class="table table-striped table-hover" id="tableExport" style="width: 100%;">
            <thead>
              <tr>
                <th>Country Code </th>
                <th>Country Name</th>
                <th>code</th>
                <th>Actions</th>
             </tr>
          </thead>
          <tbody>
           <?php if (!empty($categories)) { ?>
             <?php foreach ($categories as $category) { ?>
               <tr>
                 <td><?= $category['countrycode']; ?></td>
                 <td><?= $category['countryname']; ?></td>
                 <td><?= $category['code']; ?></td>
                 <td>
                   

               <a href="<?php echo base_url('admin/edit_countries?id=' . $category['id']); ?>" class="mr-2"> <i class="fas fa-pencil-alt"></i> </a>
               <a href="#" onclick="confirmcountryDelete(<?php echo $category['id']; ?>)" class="mr-2 text-danger"><i class="far fa-trash-alt"></i></a>
          </td>
       </tr>
    <?php } ?>
 <?php } else { ?>
    <tr>
      <td colspan="4">No data available</td>
   </tr>
<?php } ?>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div>

