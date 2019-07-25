-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 24 May 2019, 19:16:45
-- Sunucu sürümü: 10.1.38-MariaDB
-- PHP Sürümü: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `test`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `camp`
--

CREATE TABLE `camp` (
  `id` int(11) NOT NULL,
  `baslik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `aciklama` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiyat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto1` varchar(255) NOT NULL,
  `olusturan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarih` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `camp`
--

INSERT INTO `camp` (`id`, `baslik`, `aciklama`, `fiyat`, `foto1`, `olusturan`, `tarih`) VALUES
(1, 'Bozcaada Ada Camping Kamp Alanı, Bozcaada', 'Tahmin ediyorum, Bozcaada deyince aklınızda butik oteller ya da şarap bağları arasında oteller canlanıyor. Bozcaada Ada Camping, lüks odalar vaadetmese de Türkiye’ de En İyi Kamp Alanları listesine en üst sıralardan girmeyi hakediyor. Butik otel tatiline alternatif olarak Ayazma Plajına yürüme mesafesinde uzaklığı, güzel ve geniş mutfağı, ortak kullanım için büyük bir mangalı bulunuyor', '10', 'ca.png', 'arda', '2019-05-12'),
(2, 'Kabak Koyu Kamp Alanı, Fethiye', 'Eğer En İyi Kamp Alanları’ndan konuşuyorsak Fethiye’deki Kabak Koyu’nun baş oyunculardan biri olacağı tartışılmaz bir gerçek. Sadece Kabak’ta yetişen bir sürü bitki türü olmasından, doğal yaşamı korumak için Kabak’taki işletmecilerin kendi aralarından kabul ettikleri kurallardan, hala ulaşım için gerçekten emek harcamanız gerektiğinden başlayabilirim mesela anlatmaya', '20', 'kabakkoyu.jpg', 'burak', '2019-05-12'),
(3, 'Le Val de Cantobre in Aveyron, France', 'Located within the grounds of a medieval farmhouse, the pitches at this campsite are attractively arranged on original terraces, looking down into a picturesque valley. Close to many small local villages, such as Nant, don’t be fooled by Le Val’s rustic atmosphere! They’ve just finished construction on a new pool complex, and new campsite facilities. A great site for all ages, the surrounding region encompasses some of France’s most beautiful natural landscapes', '19', '003.jpg', 'mert', '2019-05-12'),
(4, 'Château de Lacomté Country Club, Lot and Dordogne Valley, France', 'Found deep within one of the most picturesque regions of France, the Château de Lacomté Country Club is an adults only site. You can choose from one of their 88 fully serviced pitches, a rustic log cabin, or bring your caravan or mobile home. It’s located just 12 kms south of the Medieval Pilgramage Village of Rocamadour – Frances second most visited tourist site. Filled with wildlife, the Château is a great choice for anyone with an interest in bird watching, botany or astrology – this area experiences virtually no noise, air or light pollution. The Château is beautiful, and our favorite for a peaceful European campsite.', '46', '004.jpg', 'tugberk', '2019-05-12'),
(5, 'Unkervatnet, Ørnes, Norway', 'Unkervatnet is a gorgeous remote lake in the municipality of Hattfjelldal in Nordland county. This lake offers two popular campsites, both on the shore side. Ørnes camping is available on the eastern end of the lake, and Tjolmen, on the north side of the lake, near the middle. This is outdoor living at its best and you can also enjoy rafting, swimming and bathing here', '20', '005.jpg', 'arda', '2019-05-12'),
(6, 'Brighouse Bay Holiday Park', 'Spacious family and pet-friendly park with a country park feel Indoor pool, café, lounge bar, amusement room and fitness room Sandy beach, 18-hole golf course, fishing, pony treks and more If the kids say they’re bored at Brighouse Bay Holiday Park at Kirkcudbright on the Dumfries and Galloway coast, you might want to send them home. Sublime sea views, heaps of on-site activities, six fishing ponds, a private beach and around 1200 acres of also-sublime countryside walks on the doorstep are all here all year round, tucked on a secluded and peaceful peninsula with views over the Irish Sea', '30', '001.jpg', 'burak', '2019-05-12'),
(7, 'Loch Tay Highland Lodges', 'Warm and comfy glamping with Highlands loch views Archery, canoeing, fishing, kayaking and mountain biking all available Restaurant with open fire and Loch Tay views Wake up in heated glamping accommodation and drink in the views of a Central Highlands loch, take a boat out to hook a fishy supper, or settle down to a boathouse restaurant meal with views to take your breath away… easy options at Loch Tay Highland Lodges, where you can snuggle down for some warm and cosy glamping and the best of Highland highlights. The park is tucked away high on a hill overlooking Loch Tay and stunning scenery – use it as a base for sightseeing around central Scotland and the Highlands, or do some day tripping and shopping in Glasgow, Edinburgh and Stirling an accessible drive away.', '40', '002.jpg', 'mert', '2019-05-12'),
(9, 'Kıyıköy', 'Kıyıköy, İstanbul’a ortalama 140 km uzaklıkta ve Kırklareli’ne bağlı. Bu sevimli sahil beldesine İstanbul’dan en hızlı Çerkezköy-Saray karayolu üzerinden ulaşılıyor ve yol yaklaşık 2 saat sürüyor. Kıyıköy’de zaten herhangi bir lüks tesis olmadığı için gelenler çoğunlukla kamp yapıyorlar. Yaz aylarında gittiğinizde buranın dalgalı denizine de girebilir, biraz Karadeniz’in tuzunun tadına bakabilirsiniz.', '10', 'kiyikoy.jpg', 'arda', '2019-05-13'),
(10, 'D’Olde Kamp, Ansen, Netherlands', 'This woodland site has a choice of open field camping or more private pitches, and finishing touches such as coffee on tap, warm bread to order, fire pits, an outdoor pizza oven and free wifi. It offers all the benefits of a countryside location without the feeling of roughing it. Goats, donkeys, chickens and rabbits are your neighbours – kids can help feed them with the farmer and get a “farming diploma”.', '30', '2048.jpg', 'burak', '2019-05-13');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `camp`
--
ALTER TABLE `camp`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `camp`
--
ALTER TABLE `camp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `yorum` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `comment`
--

INSERT INTO `comment` (`id`, `pid`, `yorum`, `author`) VALUES
(1, 1, 'Mangal alanları gerçekten harika ve genel olarak maliyeti az bir alan. Tavsiye ederim', 'tugberk'),
(2, 2, 'Teşekkürler...', 'tugberk'),
(3, 4, 'I want to go there. Could we talk with via phone. +905065052234', 'arda'),
(4, 3, 'çok güzel ama biraz pahalı', 'arda'),
(5, 5, '20 dolar mı? fiyat çok az yazılmış. yemek, kamp alanı şu bu derken 40 doları buluyor', 'mert'),
(6, 6, 'Inanilmaz bir kamp alani. Kesinlikle herkes gidip, denemeli...', 'mert'),
(7, 7, 'Gercekten sessiz bir kamp alani, assagisinda tertemiz bir gol bulunuyor. Kesinlikle gitmenizi tavsiye ederim.', 'burak'),
(8, 8, 'çok güzel ama biraz pahalı', 'burak'),
(9, 9, 'bazen çok kalabalık ve çekilmez oluyor. tavsiye etmem', 'burak');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(11) NOT NULL,
  `kadi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sifre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grup` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `kadi`, `sifre`, `grup`) VALUES
(1, 'tugberk', 'tugberk', 0),
(2, 'mert', 'mert', 0),
(3, 'burak', 'burak', 0),
(4, 'arda', 'arda', 0),
(5, 'admin', 'admin', 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
