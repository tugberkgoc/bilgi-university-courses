<?php
include("fonksiyon.php");
?>

<?php if($_SESSION['login'] == true) { ?>

<div class="nav">
  <div class="nav-header">
    <div class="nav-title" style="color: #777777;">
      CAMPLY
    </div>
  </div>
  <div class="nav-links">
  	<a style="color: #777777;">Signed In As <?php echo $_SESSION['kadi'] ?></a>
    <a href="olustur" style="color: #777777;">Create new campsite</a>
    <a href="cikis" style="color: #777777;">Log Out</a>
  </div>
</div>

<header>
	<h4 style="font-family: 'Roboto'; font-size: 50px; margin-left:25vw;">Welcome to the Camply!</h1>
	<button id="create" style="width: 180px; height: 40px; background-color: #337ab7; border-color: #2e6da4; border-radius: 4px; margin-bottom: 0; color: white; margin-left: 5vw;">Create new campsite</button>
    <!-- <span style="background: white; width: 10px; margin-left: 40vw;" id="down">&#8595;</span> -->
</header>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
window.onbeforeunload = function () {
  window.scrollTo(0, 0);
}

	$(document).ready( function () {
	// $('#down').on('click',function () {
	// 	$("html").scrollTop(0);
	// 	console.log("Clicked!");
	// 	 $('html, body').animate({
 //        scrollTop: $(".main").offset().top
 //    }, 1000);
	// });
	$('#create').on('click',function () {
		window.open("http://localhost/camply/olustur");
	});
});
</script>

<div class="main">
<div class="container">

	<div class="wrap">
	
		<?php
			$query = mysqli_query($conn, "SELECT * FROM camp");
				while ($row = mysqli_fetch_array($query)) {
		?>
		
	<div class="tooltip">
  	<span class="tooltiptext"><?php echo $row['baslik']; ?></span>

	<a style="text-decoration: none" href="profil?id=<?php echo $row['id']; ?>">
		<div class="box one" style="background: url(<?php echo'uploads/'.$row['foto1']; ?>); background-repeat: no-repeat;
		background-size: cover;
		background-position: center;">
			<div class="date">
				<h4 style="color: white"><?php echo $row['tarih']; ?></h4>
			</div>
			<h1>More info</h1>
			<!-- <div class="poster p1">
				<h4>Z</h4>
			</div> -->
		</div>
	</a>
	</div>
	
	<?php } ?>
	</div>

</div>
</div>


<?php } else { ?>
You should log in, first.
<meta http-equiv="refresh" content="1;URL=giris">
<?php } ?>

<style>

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

.conatiner {
	width: 100%;
	height: 500px;
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
	width: 300px;
	height: 490px;
	text-align: center;
	border-radius: 3px;
	-webkit-transition: 200ms ease-in-out;
	-o-transition: 200ms ease-in-out;
	transition: 200ms ease-in-out;
	-webkit-box-shadow: 0 0 15px rgba(0,0,0,0.3);
	        box-shadow: 0 0 15px rgba(0,0,0,0.3);
}
.box:hover {
	margin-bottom: -10px;
	-webkit-box-shadow: 0 0 5px rgba(0,0,0,0.7);
	        box-shadow: 0 0 5px rgba(0,0,0,0.7);
}
.box h1 {
	text-decoration: none;
	color: #fff;
	width: 40%;
	margin-left: 25%;
	padding: 20px;
	margin-top: 359px;
	text-align: center;
	font-weight: 100;
	font-size: 25px;
	border-radius: 15px;
	background: #337ab7;
	-webkit-box-shadow: 0 0 30px rgba(0,0,0,0.7);
	        box-shadow: 0 0 30px rgba(0,0,0,0.8);
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

header {
	height: 30vh;
	width: 80vw;
	background: url(https://images.pexels.com/photos/4827/nature-forest-trees-fog.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260) center center / cover no-repeat;
	display: flex;
	flex-direction: column;
	margin-bottom: 30px;
	margin-left: 10vw;
	border-radius: 15px;
	margin-top: 25px;
}

.main {
	width: 90%;
	max-width: 100%;
	margin: 10px 5% 0 5%;
	margin-left: 5vw;
	font-size: 1.4em;
	line-height: 1.4em;
	/*padding: 15px;*/
	height: 100vh;
}

#down:hover{
	cursor: pointer;
	background-color: #eee;
	opacity: 0.8;
}

</style>