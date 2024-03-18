<!-- General CSS Files -->
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/app.min.css">
<!-- Template CSS -->

<link rel="stylesheet" href="<?php echo base_url()?>assets/bundles/datatables/datatables.min.css">
<link rel="stylesheet" href="<?php echo base_url()?>assets/bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">

<link rel="stylesheet" href="<?php echo base_url()?>assets/bundles/prism/prism.css">

<link rel="stylesheet" href="<?php echo base_url()?>assets/css/style.css">
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/components.css"> 
<!-- Custom style CSS -->
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/custom.css">
<div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="card card-primary">
              <div class="card-header">
                <h4>Forgot Password..?</h4>
              </div>
              <?php if(!empty($this->session->flashdata('message'))):?>
                  <div class="alert alert-danger" role="alert">
                      <?php echo $this->session->flashdata('message')?>
                  </div>
              <?php endif;?>
              <div class="card-body">
                <form method="POST" action="<?php echo base_url("auth/forgot_password");?>" class="needs-validation" novalidate="">
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email" type="text" class="form-control" value="<?php echo set_value('identity')?>" name="identity" tabindex="1" placeholder="Please fill email address" required autofocus>
                    <div class="invalid-feedback">Please fill in your email/userid</div>
                    <?php echo form_error('identity', '<div style="color:red">', '</div>')?>
                  </div>
                  <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
                      Submit
                    </button>
                  </div>
                </form>
                <!---->
              </div>
            </div>
<!--             <div class="mt-5 text-muted text-center"> -->
<!--               Don't have an account? <a href="auth-register.html">Create One</a> -->
<!--             </div> -->
          </div>
        </div>
      </div>
    </section>
  </div>
