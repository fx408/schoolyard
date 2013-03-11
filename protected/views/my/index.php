<div>
	<ul class="school">
		<?php
		foreach($list as $id => $school) {
			printf('<li><a href="/my/%d.html">%s</a></li>', $school['id'], $school['name']);
		}
		?>
	</ul>
</div>