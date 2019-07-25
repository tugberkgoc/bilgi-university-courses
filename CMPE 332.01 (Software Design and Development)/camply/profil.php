<?php
include("fonksiyon.php");
?>


<div class="nav">
  <div class="nav-header">
    <div class="nav-title" style="color: #777777;">
      CAMPLY
    </div>
  </div>
  <div class="nav-links">
    <a style="color: #777777;">Signed In As <?php echo $_SESSION['kadi'] ?></a>
    <a href="anasayfa" style="color: #777777;">Home</a>
    <a href="cikis" style="color: #777777;">Log Out</a>
  </div>
</div>

<?php
include("fonksiyon.php");
$query = mysqli_query($conn, "SELECT * FROM camp where id=".$_GET['id']."");
$row = mysqli_fetch_array($query);
?>


<!-- <img class="images" src="<?php // echo 'uploads/'.$row['foto1']; ?>"> -->

<div class="wrap">
<div class="tooltip">
  	<!-- <span class="tooltiptext"><?php echo $row['baslik']; ?>	
 	</span> -->
	<div class="box one" style="background: url(<?php echo 'uploads/'.$row['foto1']; ?>); background-repeat: no-repeat; background-size: cover; background-position: center;">
		<div class="date">
			<h4 style="color: white"><?php echo $row['tarih']; ?></h4>
		</div>
			<h1 style="background-color: white;">
		<div class="baslik common"><?php echo $row['baslik']; ?> 
			
		</div>
		<div class="fiyat common" style="font-weight: bold;"><?php echo $row['fiyat']." $/day"; ?>
				
		</div>

<div class="aciklama"><?php echo $row['aciklama']; ?></div>

<div class="submitted">Submitted By <?php echo $row['olusturan']; ?></div>

</h1>

			<!-- <div class="poster p1">
				<h4>Z</h4>
			</div> -->
	</div>
</div>

</div>


<div class="yorumlar">

<h2 style="margin-left: 20px;">Comments :</h2>

<div style="margin-top: 20px; border-bottom-style: ridge;"></div>

<?php
		$query = mysqli_query($conn, "SELECT * FROM comment where pid=".$row['id']."");
			while ($com = mysqli_fetch_array($query)) {
	?>
<span style="font-weight:bold;color:black; margin-left: 20px;"><?php echo $com['author']; ?> :</span><br />

<div style="padding-top: 10px;"></div>

<span style="margin-left: 20px;"><?php echo $com['yorum']; ?></span>

<div style="padding-top: 10px;"></div>

<?php
$s = $_SESSION["kadi"];
if($s == $com['author'] || $grup == 1){ ?>
<form method="post">
  <input type="hidden" name="pid" value="<?php echo $row['id']; ?>">
  <input type="hidden" name="yorum" value="<?php echo $com['yorum']; ?>">
  <input style="background-color: red; color: white; margin-left: 18px; border-radius: 7px;" type="submit" name="delete" value="Delete">
</form>
<?php
}
?>
<hr>
<?php } ?>


<?php
if(isset($_POST['comment']) ? $_POST['comment'] : '' == true) {
	$pid = $_POST['pid'];
	$yorum = $_POST['yorum'];
	$s = $_SESSION["kadi"];
	$sql = "INSERT INTO comment (pid,yorum,author) VALUES ('$pid', '$yorum', '$s')";
		if ($conn->query($sql) === TRUE) {
			echo 'Yorum Başarılı ile eklendi.';
			echo '<META http-equiv="Refresh" content="0;">';
		} else {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}
}
?>

<?php
if(isset($_POST['delete']) ? $_POST['delete'] : '' == true) {
	$pid = $_POST['pid'];
	$yorum = $_POST['yorum'];
	$s = $_SESSION["kadi"];
	$query = mysqli_query($conn, "SELECT * FROM comment WHERE pid='$pid' AND yorum='$yorum'");
	$com = mysqli_fetch_array($query);
				
	if($com['author'] == $s) {
		$id = $com['id'];
		$sql = "DELETE FROM comment WHERE id='$id' AND pid='$pid' AND yorum='$yorum'";
			if ($conn->query($sql) === TRUE) {
				echo 'Yorum Başarılı ile silindi.';
				echo '<META http-equiv="Refresh" content="0;">';
			} else {
				echo "Error: " . $sql . "<br>" . $conn->error;
			}
		}			
}
?>

<h1 style="margin-left: 20px;">Add New Comment</h1>
<form method="post">
  <textarea style="width: 1000px; height: 200px;" margin-left: auto; margin-right: auto;" name="yorum"></textarea>
  <input type="hidden" name="pid" value="<?php echo $row['id']; ?>">
  <input type="submit" name="comment" value="Submit">
</form>

<?php if($_SESSION['kadi'] == $row['olusturan'] || $grup == 1) { ?>
	<div style="height: 40px; text-align: center;">
		<a style="text-decoration: none" href="sil?id=<?php echo $row['id']; ?>">Delete Campground</a>
	</div>
<?php } ?>

</div>
		
	



<style>

.submitted {
	display: flex;
	justify-content: flex-start;
	margin-top: 20px;
}

.yorumlar {
	border-top-style: ridge;
	border-right-style: ridge;
  	border-bottom-style: ridge;
 	border-left-style: ridge;
 	margin-top: 260px;
 	width: 1138px;
 	margin-left: auto;
 	margin-right: auto;
}

.baslik {
  justify-content: flex-start;
  font-family: Helvetica;
  font-size: 30px;
}

.aciklama {
  display: flex;
  margin-top: 10px;
  font-family: 'Roboto';
  text-align: left;
  font-size: 20px;
}

.fiyat {
	margin-top: -28px;
  justify-content: flex-end;
  margin-left: 780px;
  margin-bottom: 20px;
  font-family: Helvetica;
  font-size: 20px;
}

.common {
	display: flex;
}

.images {
  margin-top: 40px;
  display: flex;
  justify-content: center;
  margin-left: auto;
  margin-right: auto;
  width: 1000px;
  height: 800px;
}

body {
  margin: 0px;
  padding:0;
}

.nav {
  height: 50px;
  width: 100%;
  background-color: #F8F8F8;
  position: relative;
}

.nav>.nav-header {
  display: inline;
}

.nav>.nav-header>.nav-title {
  display: inline-block;
  font-size: 22px;
  color: #fff;
  padding: 10px 10px 10px 10px;
  font-family: 'Pacifico';
}

.nav-links { /* Navigation linkleri inline yap */
  padding-top: 4px;
  display: inline;
  float: right;
  font-size: 14px;
}

.nav>.nav-links>a { /* Navigation link buttons */
  display: inline-block;
  padding: 12px 15px 12px 15px;
  text-decoration: none;
  color: #efefef;
  font-size: 16px;
  font-family: "Helvetica Neue";
}

.wrap {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	    flex-wrap: wrap;
	-webkit-box-pack: center;
	    -ms-flex-pack: center;
	        justify-content: center;
	-webkit-box-align: center;
	    -ms-flex-align: center;
	        align-items: center;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	    -ms-flex-direction: row;
	        flex-direction: row;
}

.box {
	margin: 10px;
	width: 1138px;
	height: 669px;
	text-align: center;
	/*border-style: groove;*/
	/*border-radius: 3px;*/

}

.box:hover {
	
}

.box h1 {
	text-decoration: none;
	color: black;
	width: 96.5%;
	margin-left: -0.25%;
	padding: 20px;
	margin-top: 620px;
	text-align: center;
	font-weight: 100;
	font-size: 25px;
	height: 251px;
	/*border-radius: 15px;*/
	background-color: #fcfafa;
  	border-right-style: ridge;
  	border-bottom-style: ridge;
 	border-left-style: ridge;
}

.date h4 {
	color: #444444;
	font-weight: 300;
	text-align: center;
	padding-top: 10px;
	letter-spacing: 3px;
	text-shadow: 0 0 3px rgba(0,0,0,0.9);
}

/* Tooltip container */
.tooltip {
  position: relative;
  display: inline-block;
}

/* Tooltip text */
.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: #777777;
  color: #fff;
  text-align: center;
  padding: 5px 0;
  border-radius: 6px;

  /* Position the tooltip text */
  position: absolute;
  z-index: 1;
  bottom: 100%;
  left: 50%;
  margin-left: -60px;

  /* Fade in tooltip */
  opacity: 0;
  transition: opacity 0.3s;
}

/* Tooltip arrow */
.tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

/* Show the tooltip text when you mouse over the tooltip container */
.tooltip:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}

</style>