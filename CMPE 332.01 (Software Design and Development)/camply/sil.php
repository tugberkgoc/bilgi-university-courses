<?php 
include("fonksiyon.php");

	if(isset($_GET["id"])) {
		$query = "DELETE FROM camp WHERE id = '".$_GET["id"]."'";
		if(mysqli_query($conn, $query)) {
			echo 'Silme İşlemi Tamamlandı. Yönlendiriliyorsunuz.';
			echo '<meta http-equiv="refresh" content="2;URL=anasayfa">';
		}
	}

?>