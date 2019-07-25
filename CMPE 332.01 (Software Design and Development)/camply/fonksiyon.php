<?php
@session_start();
// null !== session_start() ? session_start() : '';


include("baglanti.php");

		if(isset($_SESSION["kadi"])) {
			$s =	$_SESSION['kadi'];
			$kullanici_bul = mysqli_query($conn, "SELECT * FROM kullanicilar where kadi='$s'");
			$kullanici = mysqli_fetch_array($kullanici_bul);
 			$grup = $kullanici["grup"]; // if it is 1, it is admin
		} 
		
?>