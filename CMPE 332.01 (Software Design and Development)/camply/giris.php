<?php
		include("fonksiyon.php");
		if($_POST) { 
    // Post Parametreleri
    /**
     * kullanici adi = kadi
     * sifre = sifre
     */
		$kadi = $_POST['kadi'];
		$sifre = $_POST['sifre'];
		$sql = mysqli_query($conn, "select * from kullanicilar where kadi = '$kadi' and sifre = '$sifre'") or die ("Failed to query database" .mysqli_error());
		$row = mysqli_fetch_array($sql);

		if ($row['kadi'] == $kadi && $row['sifre'] == $sifre) {
				echo "Tamamlanıyor...";
        echo '<hr>';
        
				$_SESSION["login"] = "true";
        $_SESSION["kadi"] = $kadi;

        // URL=anasayfa
				echo '<meta http-equiv="refresh" content="5;URL=anasayfa">';
			} else {
				echo "<div class=\"alert alert-danger\"><strong>Hata</strong> Bilgiler Yanlış.</div>";
				echo '<hr>';
      }
      
		}
?>

<?php  if(isset($_SESSION['login']) ? $_SESSION['login'] : '' != true) { ?>

<div class="nav">
  <div class="nav-header">
    <div class="nav-title" style="color: #777777;">
      CAMPLY
    </div>
  </div>
  <div class="nav-links">
    <a href="giris" style="color: #777777;">Login</a>
    <a href="kayit" style="color: #777777;">Sign Up</a>
  </div>
</div>


<div class="vid-container">
  <video class="bgvid" src="loginbackground.mp4" autoplay="autoplay" muted="muted" preload="auto" loop>
  </video>
  <div class="inner-container">
    <div class="box">
       <form method="POST">
        <h1>LOGIN NOW</h1>
        <input type="text" name="kadi" placeholder="Username"/>
        <input type="Password" name="sifre" placeholder="Password"/>
        <button>LOGIN</button>
      </form>
      <p>Not a member? <span class="signup">Sign Up</span></p>
    </div>
  </div>
</div>

<?php } else { ?>

Tamamlanıyor...
<meta http-equiv="refresh" content="1111;URL=anasayfa">

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

.vid-container{
  position:relative;
  height:100vh;
  overflow:hidden;
}

.bgvid{
  position:absolute;
  left:0;
  top:0;
  width:100vw;
}

.inner-container{
  width:400px;
  height:400px;
  position:absolute;
  top:calc(50vh - 200px);
  left:calc(50vw - 200px);
  overflow:hidden;
}

.bgvid.inner{
  top:calc(-50vh + 200px);
  left:calc(-50vw + 200px);
  filter: url("data:image/svg+xml;utf9,<svg%20version='1.1'%20xmlns='http://www.w3.org/2000/svg'><filter%20id='blur'><feGaussianBlur%20stdDeviation='10'%20/></filter></svg>#blur");
  -webkit-filter:blur(10px);
  -ms-filter: blur(10px);
  -o-filter: blur(10px);
  filter:blur(10px);
}

.box{
  position:absolute;
  height:100%;
  width:100%;
  font-family:Helvetica;
  color:#fff;
  background: #565656;
  padding:30px 0px;
  opacity: 0.8;
}

.box .signup{
  color: #668bae;
}

.box h1{
  text-align:center;
  margin:30px 0;
  font-size:30px;
}

.box input{
  display:block;
  width:300px;
  margin:20px auto;
  padding:15px;
  background:rgba(0,0,0,0.2);
  color:#fff;
  border:2px solid white;
  border-radius: 50px;
}

.box input:focus,.box input:active,.box button:focus,.box button:active{
  outline:none;
}

.box button{
  background:#fea400;
  border:0;
  color:#fff;
  padding:10px;
  font-size:20px;
  width:150px;
  margin:20px auto;
  display:block;
  cursor:pointer;
  border-radius: 50px;
}

.box button:active{
  background:#27ae60;
}

.box p{
  font-size:14px;
  text-align:center;
}

.box p span{
  cursor:pointer;
  color:#666;
}

</style>