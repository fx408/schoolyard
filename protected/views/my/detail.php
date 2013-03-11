<div>
	<div class="school">
		<div>
			<span class="school-name"><?php echo $data['school']['name'];?></span>
			<span class="school-type"><?php echo $types[$data['school']['type']];?></span>
			<span class="school-correct"><a href="/correct/school/id/<?php echo $data['school']['id'];?>">修正</a></span>
		</div>
		<div><?php echo $data['school']['desc'];?></div>
		<div class="school-links"></div>
	</div>

	<div class="school-zones">
		<div><h3>校区分布</h3></div>
		<?php
		foreach($data['zones'] as $zone) {
		?>
		<div>
			<span class="school-name"><?php echo $zone['name'];?></span>
			<span class="school-type"><?php echo $types[$zone['type']];?></span>
			<span class="school-correct"><a href="/correct/zone/id/<?php echo $zone['id'];?>">修正</a></span>
		</div>
		<div><?php echo $zone['desc'];?></div>
		<div><?php echo $zone['address'];?></div>
		<div><a href="javascript:;" latitude="<?php echo $zone['latitude'];?>" longitude="<?php echo $zone['longitude'];?>">位置</a></div>
		
		<?php } ?>
	</div>

	<div class="school-notes">
		<div><h3>校园记事</h3></div>
		<?php foreach($data['notes'] as $note) { ?>
		
		<div>
			<span class="school-name"><?php echo $note['title'];?></span>
			<span class="school-type"><?php echo $note['occurrence_time'];?></span>
			<span class="school-correct"><a href="/correct/note/id/<?php echo $note['id'];?>">修正</a></span>
		</div>
		<div><?php echo $note['content'];?></div>
		
		<?php } ?>
	</div>

	<div class="school-pics">
		<div><h3>校园配图</h3></div>
		<?php foreach($data['pics'] as $pic) { ?>
		
		<div>
			<span class="school-pic">
				<?php printf('<a href="%s" rel="school%d"><img src="%s/thumb/%s"></a>', 
					$pic['path'].$pic['name'], $pic['school_id'], $pic['path'], $pic['thumb']);
				?>
			</span>
			<span class="school-pic-title"><?php echo $pic['title'];?></span>
			<span class="school-correct"><a href="/correct/pic/id/<?php echo $pic['id'];?>">修正</a></span>
		</div>
		<?php } ?>
	</div>
</div>

<pre>
<?php
//print_r($data);
?>
</pre>