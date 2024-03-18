<html>
<body>
	<h1><?php echo sprintf(lang('email_activate_heading'), $identity);?></h1>
	<p><a href="<?php echo base_url()?>auth/reset_password/?id=<?php echo $id; ?>">Reset Password..</a></p>
	<p><?php // echo sprintf(lang('email_activate_subheading'), anchor('auth/activate/'. $id .'/'. $activation, lang('email_activate_link')));?></p>
	<!-- <p>After Activation Use This Passwor For Login: <?=$password;?></p> -->
</body>
</html>