
<?php  if (count($errorList) > 0) : ?>
  <!-- TO BE USED FOR ERROR RETURNS IN RESPECTIVE PAGES -->
  <div class="error">
  	<?php foreach ($errorList as $error) : ?>
  	  <p><?php echo $error ?></p>
  	<?php endforeach ?>
  </div>
<?php  endif ?>