<?php
include("fonksiyon.php");
$statusMsg = '';

$baslik = isset($_POST["baslik"]) ? $_POST["baslik"] : '';
$aciklama = isset($_POST["aciklama"]) ? $_POST["aciklama"] : '';;
$fiyat = isset($_POST["fiyat"]) ? $_POST["fiyat"] : '';
$olusturan = $_SESSION['kadi'];


if($baslik == true) {
	
	// File upload path
$targetDir = "uploads/";
$fileName = basename($_FILES["file"]["name"]);
$targetFilePath = $targetDir . $fileName;

$fileType = pathinfo($targetFilePath,PATHINFO_EXTENSION);

	if(isset($_POST["submit"]) && !empty($_FILES["file"]["name"])){
    // Allow certain file formats
    $allowTypes = array('jpg','png','jpeg','gif','pdf');
    if(in_array($fileType, $allowTypes)){
        // Upload file to server
        if(move_uploaded_file($_FILES["file"]["tmp_name"], $targetFilePath)){
            // Insert image file name into database
			
			     if(is_numeric($fiyat)) {
  	         $sql = "INSERT INTO camp
              (baslik,aciklama,fiyat,foto1,olusturan,tarih) VALUES ('$baslik', '$aciklama', '$fiyat', '".$fileName."', '$olusturan', NOW())";
  		        if ($conn->query($sql) === TRUE) {
  			         echo 'Kamp Kaydı Başarılı';
  			         echo '<meta http-equiv="refresh" content="2;URL=anasayfa">';
  		        } else {
  			         echo "Error: " . $sql . "<br>" . $conn->error;
             }
          } else {
              echo 'Fiyatı doğru giriniz!';
              echo '<meta http-equiv="refresh" content="2;URL=olustur">';
           }
        }else{
            $statusMsg = "Sorry, there was an error uploading your file.";
        }
    }else{
        $statusMsg = 'Sorry, only JPG, JPEG, PNG, GIF, & PDF files are allowed to upload.';
    }
}else{
    $statusMsg = 'Please select a file to upload.';
}}

// Display status message
echo $statusMsg;
 
?>

<div class="nav">
  <div class="nav-header">
    <div class="nav-title" style="color: #777777;">
      CAMPLY
    </div>
  </div>
  <div class="nav-links">
    <a style="color: #777777;">Signed In As <?php echo $_SESSION['kadi'] ?></a>
    <a href="anasayfa" style="color: #777777;">Homepage</a>
    <a href="cikis" style="color: #777777;">Log Out</a>
  </div>
</div>

<h3 style="color: black; text-align: center; font-family: 'Righteous', cursive; font-size: 36px;">Add a New Campground</h3>
<div id="wrapper">
  <form method="POST" id="form" enctype="multipart/form-data">

    <input type="text" id="baslik" name="baslik" placeholder="Name" />

    <input type="text" id="aciklama" name="aciklama" placeholder="Description" />

    <input type="text" id="fiyat" name="fiyat" placeholder="Price" />

	  <input class="file" type="file" name="file" placeholder="Image">

    <input style="font-size: 20px" type="submit" value="Submit!" name="submit" id="submit" />
  </form>
</div>

<style>

#wrapper {
  font-family: 'Roboto';
  margin: 30px auto;
  padding: 30px;
  font-size: 14px;
  width: 100%;
  max-width: 400px;
}

input {
  height: 18px;
  padding: 20px;
  width: 100%;
  margin-top: 10px;
  border-radius: 15px;
}

textarea {
  height: 150px;
  width: 100%;
  padding: 15px;
  border: 1px solid #fff;
}

input[type="text"]:hover,
textarea:hover {
  border-radius: 15px;
}

input#submit {
  text-align: center;
  color: #fff;
  height: 50px;
  padding: 0;
  margin-top: 50px;
  border: 1px solid transparent;
  background: #337ab7;
}

input#submit:hover {
/*  color: #ccc;*/
  cursor: pointer;
  background: #2e6da4;
}

label {
  text-transform: uppercase;
  font-size: 14px;
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

.file {

}

</style>