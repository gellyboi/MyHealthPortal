
<?php  if (count($errors) > 0) : ?>
  <!-- TO BE USED FOR ERROR RETURNS IN RESPECTIVE PAGES -->
  <div class="error">
  	<?php foreach ($errors as $error) : ?>
  	  <p><?php echo $error ?></p>
  	<?php endforeach ?>
  </div>
<?php  endif ?>