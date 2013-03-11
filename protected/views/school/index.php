<div id="google_map" style="height:100%; width:100%"></div>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDeTbbaUbaoslV0OY-Jyoex6kfMBXRRIZk&sensor=false&libraries=panoramio"></script>

<script type="text/javascript" src="/static/js/map.js"></script>
<script type="text/javascript">
	<?php printf("var picList = %s; \n", CJSON::encode($picList));?>
	
	$(function() {
		var map = new larkMap();
		map.init();
	});
</script>