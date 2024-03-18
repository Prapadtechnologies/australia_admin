<h1>Add Permission</h1>

<div id="infoMessage"><?php echo $message;?></div>

<?php echo form_open();?>

<p >
    <?php echo form_label('Key :', 'perm_key');?> <br />
    <?php echo form_input('perm_key', set_value('perm_key')); ?> <br />
    <?php echo form_error('perm_key'); ?>
</p>

<p>
    <?php echo form_label('Name :', 'perm_name');?> <br />
    <?php echo form_input('perm_name', set_value('perm_name')); ?> <br />
    <?php echo form_error('perm_name'); ?>
</p>
<p>	
	<?php echo form_label('Parent Status :', 'parent_status');?> <br />
	<select name="parent_status">
		<option value='0' selected disabled>--select--</option>
		<?php foreach ($permissions as $permission):?>
			<option value="<?php echo $permission['id']?>"><?php echo $permission['perm_name']?></option>
		<?php endforeach;?>
	</select>
    <?php echo form_error('parent_status'); ?>
</p>
<p>
    <?php echo form_label('Description :', 'desc');?> <br />
    <?php echo form_input('desc', set_value('desc')); ?> <br />
    <?php echo form_error('desc'); ?>
</p>

<p>
    <?php echo form_submit('submit', 'Save');?>
    <?php echo form_submit('cancel', 'Cancel');?>
</p>

<?php echo form_close();?>
