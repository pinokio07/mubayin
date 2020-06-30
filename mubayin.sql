-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2020 at 07:26 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mubayin`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aims` int(11) DEFAULT NULL,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cell_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanzim` set('AN','LI','KH','NI','AT','BA','AB') COLLATE utf8mb4_unicode_ci NOT NULL,
  `daerah` int(11) DEFAULT NULL,
  `cabang` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `aims`, `nama_lengkap`, `home_phone`, `cell_phone`, `alamat`, `tanzim`, `daerah`, `cabang`, `created_at`, `updated_at`) VALUES
(1, 59326, 'Bayu Nurkholis', NULL, '087788801769', 'Jl. Taman Anyelir 3, Blok J3/12, Cilodong, Depok', 'KH', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` bigint(20) NOT NULL,
  `kategori` set('kegiatan','khutbah','pembaca') NOT NULL,
  `cabang_id` int(11) DEFAULT NULL,
  `penulis` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `berita` longtext NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `status` set('unread','read','active','inactive','rejected') NOT NULL DEFAULT 'unread',
  `dibaca` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id`, `kategori`, `cabang_id`, `penulis`, `email`, `judul`, `slug`, `berita`, `foto`, `status`, `dibaca`, `created_at`, `updated_at`) VALUES
(2, 'kegiatan', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Amir Nasional Ahmadiyah Serukan Relawan Siaga Donor Darah Nasional Menyambut Ramadhan di Masa Pandemi Covid-19', 'amir-nasional-ahmadiyah-serukan-relawan-siaga-donor-darah-nasional-menyambut-ramadhan-di-masa-pandemi-covid-19', 'Ribuan Muslim Ahmadiyah sambut Ramadhan dengan menjadi relawan siaga Donor Darah Nasional.\n\nMerespon krisis stok donor darah, Amir Nasional Jemaat Ahmadiyah Indonesia, H. Abdul Basit dalam rilisnya tertanggal 28 April 2020 menyerukan seluruh anggota Jamaah Muslim Ahmadiyah yang memenuhi kriteria untuk menjadi ?Relawan Siaga Donor Darah Nasional? dalam usaha membantu masyarakat yang membutuhkan, dengan tetap mengikuti protokol kesehatan Covid-19 dan PSBB yang ditetapkan pemerintah.\n\nJamaah Muslim Ahmadiyah yang selama ini menjadi partner yang diandalkan Palang Merah Indonesia (PMI) dalam program donor darah nasional rutin, melalui sayap organisasi sosialnya Humanity First Indonesia dalam bulan Ramadan ini menargetkan 1.000 kantong darah bisa di donorkan melalui PMI.\n\nAhmadiyah sendiri selama ini memiliki sekitar 15.000 ribu pendonor darah rutin yang tergabung dalam Komunitas GiveBlood tersebar di 50 kota di Indonesia.\n\nSebelumnya, sebagaimana dilansir beberapa media nasional PMI menyatakan krisis stok darah nasional di berbagai daerah.\n\n?Pandemi Covid-19 sangat berdampak pada stok darah PMI di berbagai kota, apalagi memasuki bulan Ramadhan stok darah berkurang lebih dari 50 %, karena masyarakat takut terkena virus, sementara kebutuhan rata rata kantong darah di Jakarta misalnya per hari mencapai 700 kantong.? Ujar unit kepala Transfusi Donor Darah PMI DKI Jakarta Salimar Salim seperti di kutip Media Indonesia.\n\nSementara daerah lain seperti Surabaya, Bandung, Tangerang juga mengalami hal yang sama dengan yang dialami PMI DKI Jakarta.\n\nKetua bidang unit Donor Darah Pengurus PMI Pusat Linda Lukitasari Waseso mengaku krisis stok darah terjadi di daerah pandemi Covid-19 seperti DKI Jakarta, Jawa Barat, Jawa Tengah, Jawa Timur.\n\nSementara itu Juru Bicara Jemaat Ahmadiyah Indonesia, Yendra Budiana menambahkan selain Program Donor Darah Ramadhan, untuk membantu masyarakat yang sangat terdampak Covid-19, Satgas Covid-19 Pengurus Besar Jamaah Muslim Ahmadiyah telah merilis beragam program, mulai dari bantuan sembako, pemberian ribuan masker gratis dan bantuan ekonomi langsung pada 1.885 kepala keluarga serta terus mendorong para pengikut Jamaah Muslim Ahmadiyah untuk menjadi teladan sosial yang terbaik bagi sesama, sebagai salah satu cara memaknai ibadah Ramadhan.\n\nTerpisah, ketua FKUB Jawa Tengah, KH Drs Taslim Syahlan Msi mengatakan Ramadhan ini harus menjadi momentum untuk menguatkan solidaritas sesama umat Islam. Kita harus segera mengakhiri friksi antar kelompok umat Islam. Ramadhan adalah sarana mengasah kesalehan individual dan kesalehan sosial. Kegiatan donor darah yang dilakukan oleh Jemaat Ahmadiyah sesungguhnya merupakan bukti bahwa layanan kemanusiaan merupakan tugas mulia dalam beragama. Ini juga yang boleh saya sebut sebagi bukti kesalehan sosial. Dalam konteks berdakwah hal demikian sangat strategis. Karena tidak sebatas dakwah bil-lisaan. Tetapi lebih berdakwah bil-hal sekaligus implementasi ?khairunnas anfa?uhum linnas?. Sungguh ekpresi keberagaman yang konkrit dan luar biasa.\n\nLOVE FOR ALL HATRED FOR NONE', 'amir-nasional-ahmadiyah_1593398693.jpg', 'active', 5, '2020-06-19 09:05:37', '2020-06-29 11:41:44'),
(3, 'kegiatan', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Khalifah Muslim Ahmadiyah Serukan Shalat Idul Fitri di Rumah di Masa Pandemi Covid-19', 'khalifah-muslim-ahmadiyah-serukan-shalat-idul-fitri-di-rumah-di-masa-pandemi-covid-19', 'Pengurus Besar Jemaat Ahmadiyah Indonesia dalam surat edaran No.093/SEKUM/V/2020 tertanggal 20 Mei 2020 telah menginformasikan instruksi Khalifah Muslim Ahmadiyah, Hazrat Mirza Masroor Ahmad (aba) kepada seluruh Muslim Ahmadi agar melaksanakan sholat Idul Fitri di rumah saja, mengikuti ketentuan pemerintah setempat yang berlaku yang melarang pengumpulan orang di masjid di masa pandemi ini.\n\nUntuk teknis pelaksanaan Sholat Idul Fitri, Pengurus Besar Jemaat Ahmadiyah Indonesia telah mengirimkan pula tata cara pelaksanaan sholat ke seluruh anggota. Para Pengurus Ahmadiyah di tingkat daerah yang tersebar di 408 cabang (Jemaat lokal) yang ada di seluruh provinsi di Indonesia diminta memonitor dan memastikan seluruh anggota mengikuti surat edaran tersebut.\n\nAdapun waktu pelaksanaan sholat idul fitri sendiri, sebagaimana biasanya Muslim Ahmadiyah selalu mengikuti penetapan Idul Fitri yang diputuskan oleh pemerintah.\n\nSementara itu dalam surat edaran sebelumnya Amir Nasional Ahmadiyah Indonesia H. Abdul Basit mengingatkan kembali seluruh anggota Muslim Ahmadiyah untuk tidak mudik lebaran dan silaturahmi cukup dengan online ke seluruh kerabat, sahabat, pejabat dan aparat demi untuk kesehatan dan keamanan bersama pencegahan penyebaran Covid-19.\n\nPelaksanaan sholat Idul Fitri di rumah, lebaran di rumah saja tanpa mudik dan silaturahmi via online saja merupakan wujud kesadaran pribadi untuk taat, disiplin, peduli dan sikap bertanggung jawab dalam kehidupan bermasyarakat yang selaras dengan makna puasa dan Idul Fitri, yaitu melahirkan pribadi baru yang mampu mengontrol dirinya untuk melaksanakan amanah sebagai mahluk Tuhan, menunaikan kewajibannya pada Allah Ta?ala dan manusia.\n\nAmir Nasional Ahmadiyah mewakili seluruh pengurus dan keluarga besar Jemaat Muslim Ahmadiyah Indonesia mengucapkan\n\nEid Mubarak, Selamat Hari Raya Idul Fitri 1441 H\n\nSemoga kita semua meraih kemenangan dan mendapatkan Karunia Illahi di Masa Pandemi.\n\nLOVE FOR ALL HATRED FOR NONE', 'khalifah-muslim-ahmadiyah_1593340610.jpg', 'active', 0, '2020-06-19 09:05:37', '2020-06-28 10:36:49'),
(4, 'kegiatan', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Pemimpin Jamaah Muslim Ahmadiyah Menyampaikan Pesan Khusus Pengganti Khotbah Jumat di Tengah Pembatasan Pertemuan oleh Pemerintah', 'pemimpin-ahmadiyah-menyampaikan-pesan-khusus-pengganti-khotbah-jumat-di-tengah-pembatasan-pertemuan-oleh-pemerintah', 'Hazrat Mirza Masroor Ahmad menyiarkan pesan khusus dari kantor beliau sebagai pengganti Khotbah Jumat karena adanya pembatasan oleh Pemerintah di tengah pandemi virus corona. ', 'home_8.jpg', 'active', 0, '2020-06-19 09:05:37', '2020-06-19 09:05:37'),
(5, 'kegiatan', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Pemimpin Jamaah Muslim Ahmadiyah Berbicara tentang Pandemi Virus Corona', 'pemimpin-jamaah-muslim-ahmadiyah-berbicara-tentang-pandemi-virus-corona', 'Seiring merebaknya virus corona, Pemimpin Jamaah Muslim Ahmadiyah, Khalifah Kelima, Hazrat Mirza Masroor Ahmad (ayyadahullahu ta?ala binashrihil ?aziiz) menekankan untuk menerapkan langkah-langkah pencegahan terhadap virus dan semakin mendekatkan diri kepada Allah.\n\nBerbicara di Masjid Mubarak di Islamabad, Tilford selama Khutbah Jumat yang disampaikan pada 20 Maret 2020, Huzur mengatakan bahwa merebaknya virus corona (Covid-19) memaksa untuk orang berpikir akan keterbatasan upaya manusia dan dapat menjadikan orang cenderung kepada agama dan kembali kepada keimanan.\n\nHuzur mengutip beberapa artikel di media yang diterbitkan beberapa hari terakhir tentang dampak virus corona pada masyarakat dan bagaimana abad ke-21 telah menyaksikan peningkatan penyakit menular yang sangat drastis.\n\nDi antaranya, Huzur mengutip sebuah artikel yang baru-baru ini dimuat di Daily Telegraph, seorang kolumnis Philip Johnston menulis bagaimana dunia menjadi kacau dalam rentang beberapa minggu. Sang kolumnis berbicara bagaimana virus tersebut telah mengekspos rapuhnya sebuah kekuatan masyarakat Barat yang tampak tak tertembus.', 'home_10.jpg', 'active', 0, '2020-06-19 09:05:37', '2020-06-19 09:05:37'),
(6, 'kegiatan', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'PENYEBARAN VIRUS KEBENCIAN TERHADAP JAMAAH MUSLIM AHMADIYAH DI BOGOR DI TENGAH PERJUANGAN MELAWAN VIRUS CORONA (COVID-19)', 'penyebaran-virus-kebencian-terhadap-jamaah-muslim-ahmadiyah-di-bogor', 'Pemerintah saat ini tengah berjuang menumpas virus ujaran kebencian, virus radikalisme dan virus corona (COVID-19) di Indonesia yang sama-sama membahayakan masyarakat. Pemerintah pusat maupun pemerintah daerah Bogor telah mengedarkan himbauan untuk tidak melakukan pengumpulan orang untuk meminimalkan penyebaran virus corona (COVID-19). Namun di saat yang bersamaan massa yang mengatasnamakan Aliansi Benteng Aqidah (ABA) Bogor dengan salah satu tokoh orator demonya Muhammad Al Khaththat yang sebelumnya dikenal sebagai tokoh Forum Umat Islam (FUI)  justru mengumpulkan massa, menyebarkan kebencian, untuk menolak keberadaan Muslim Ahmadiyah yang sah secara hukum hidup di NKRI, baik sebagai warga negara maupun organisasi.\n\nMassa intoleran yang menamakan diri Aliansi Benteng Aqidah ( ABA) melakukan aksi penolakan keberadaan Ahmadiyah di Kabupaten Bogor, Jawa Barat dengan melakukan orasi di pendopo Kabupaten Bogor pada hari Senin, 16 Maret 2020 dengan target utama menekan Bupati Bogor melarang Ahmadiyah di Kabupaten Bogor, Jawa Barat.\n\nMassa yang berjumlah ratusan sebagian besar tinggal jauh dari lokasi dimana kantor pusat Jemaat Ahmadiyah Indonesia ( JAI) berada, terafiliasi pada organisasi massa yang selama ini sudah dikenal sebagai kelompok intoleran, penyebar ujaran kebencian atas nama agama.\n\nJemaat Ahmadiyah Indonesia ( JAI)  adalah organisasi agama yang sah secara hukum di Indonesia berdasarkan SK Menteri Kehakiman RI No. JA.5/23/13 tertanggal 13 Maret 1953 dan sampai saat ini keberadaannya tidak pernah dilarang oleh pemerintah karena tidak pernah melanggar hukum, tidak pernah makar bahkan tidak berpolitik .\n\nKementerian Agama Republik Indonesia mengatakan bahwa Ahmadiyah tidak menodai Islam (Republika, 23 Nov 2014), lebih lanjut Kementerian Agama Republika Indonesia mengatakan Ahmadiyah tidak membahayakan Negara maupun  kerukunan umat beragama di Indonesia (Satu Harapan, 01 Nov 2016), demikian pula Balitbang Departemen Agama RI melalui pernyataaan pejabatnya tertanggal  04 Februari 2020 menyatakan dengan tegas  bahwa SKB 3 menteri tentang Ahmadiyah tidak pernah melarang Ahmadiyah untuk beribadah dan berkegiatan ( MTA Indonesia).\n\nOleh karena itu kami mengingatkan dan yakin Bupati Bogor memahami seluruh peraturan hukum yang berlaku bahwa tidak ada satupun ketentuan hukum yang sah untuk melarang kegiatan dan keberadaan Ahmadiyah di seluruh Indonesia termasuk di Kabupaten Bogor.', 'home_11.jpg', 'active', 0, '2020-06-19 09:05:37', '2020-06-19 09:05:37'),
(7, 'kegiatan', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Seruan Pemimpin Jamaah Muslim Ahmadiyah tentang Tindakan Pencegahan untuk Mengurangi Penyebaran Virus Corona', 'seruan-pemimpin-ahmadiyah-pencegahan-virus-corona', 'Menyusul merebaknya virus Corona, Pemimpin Dunia Jamaah Muslim Ahmadiyah, Hazrat Mirza Masroor Ahmad telah menginstruksikan setiap Muslim Ahmadi supaya mengikuti langkah-langkah yang telah direkomendasikan oleh otoritas kesehatan untuk membantu membatasi penyebaran virus.\n\nBerbicara di Masjid Baitul Futuh, London, selama Khutbah Jumat yang disampaikan pada 6 Maret 2020, Huzur mengatakan bahwa sebaiknya hindari pertemuan-pertemuan besar di tengah merebaknya wabah saat ini dan beliau menginstruksikan Muslim Ahmadi untuk menahan diri untuk tidak datang ke Masjid jika mereka mengalami gejala yang terkait dengan virus Corona.', 'cinta-sejati.jpg', 'active', 2, '2020-06-19 09:05:37', '2020-06-19 14:47:31'),
(9, 'kegiatan', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Hari Pahlawan, Melawan Radikalisme dengan Cinta', 'hari-pahlawan-melawan-radikalisme-dengan-cinta', '<div>Presiden Joko Widodo menyerukan seluruh masyarakat untuk bersama-sama memerangi radikalisme &amp; terorisme (CNN.COM/ Kamis 10 Oktober 2019) 2019), sementara Cendekiawan Muslim Prof Dr Azyumardi Azra mengatakan ?ancaman radikalisme terhadap ideologi Pancasila itu riil (Detik.com/6 Oktober 2019)\r\n\r\nIslam dalam kitab sucinya mengajarkan: <br></div><div><br></div><div><span style=\"background-color: inherit;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">وَلَا تُفْسِدُوا۟ فِى ٱلْأَرْضِ بَعْدَ إِصْلَٰحِهَا وَٱدْعُوهُ خَوْفًا وَطَمَعًا ۚ إِنَّ رَحْمَتَ ٱللَّهِ قَرِيبٌ مِّنَ ٱلْمُحْسِنِينَ</span></span></div><br>Referensi: https://tafsirweb.com/2510-quran-surat-al-araf-ayat-56.html Dan janganlah kamu berbuat kerusakan di bumi setelah (diciptakan) dengan baik. Berdoalah kepadaNya dengan rasa takut dan penuh harap. Sesungguhnya rahmat Allah sangat dekat kepada orang yang berbuat kebaikan. (QS Al-A\'raf [7]: 56)\r\n\r\nBersandar pada ajaran Islam melalui kitab suci Al-Qur?an di atas, lebih jauh Khalifah Muslim Ahmadiyah mengatakan\r\n\r\n    ?Islam mengajarkan kita untuk hidup dengan semangat cinta, kasih sayang dan kerendahan hati. Islam mengajarkan kepada kita bahwa tidak ada bedanya antara seorang Muslim dan Non Muslim. Pesan saya kepada anda semua, anda harus cinta untuk semua, kebencian tidak untuk siapapun.?\r\n    (Hz. Mirza Nasir Ahmad, Khalifah III Muslim Ahmadiyah) \r\n\r\nRadikalisme berangkat dari sikap kebencian dan persepsi atas ketidakadilan. Cinta dan kasih sayang tulus tanpa kebencian pada siapapun merupakan solusi terbaik melawan gerakan radikalisme.\r\n\r\nJamaah Muslim Ahmadiyah Indonesia melalui sayap organisasinya Humanity First Indonesia (HFI), Komunitas Donor Mata Indonesia (KDMI) Komunitas Donor Darah (Give Blood), Komunitas Cinta Kebersihan (Clean The City) terus melakukan pekerjaan-pekerjaan cinta kemanusiaan. Melayani masyarakat tanpa memandang kawan dan lawan, tanpa memandang agama, suku , ras dan golongan dan menawarkan semangat cinta, kasih sayang dan kepedulian pada sesama manusia untuk Indonesia yang lebih maju dan damai.\r\n\r\nPahlawan Hari Ini Melawan Radikalisme dengan Cinta\r\n\r\nSelamat Hari Pahlawan, JAYALAH INDONESIA.\r\n\r\nLOVE FOR ALL HATRED FOR NONE', 'hari-pahlawan-melawan_1593441866.png', 'active', 0, '2020-06-29 13:33:45', '2020-06-30 02:10:54'),
(10, 'khutbah', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Keteladanan Sahabat Nabi Muhammad (saw) seri-75 ', 'keteladanan-sahabat-nabi-muhammad-seri-75', 'Pembahasan mengenai dua orang Ahlu Badr (Para Sahabat Nabi Muhammad (saw) peserta perang Badr atau ditetapkan oleh Nabi (saw) mengikuti perang Badr), Hadhrat Sa?id bin Zaid bin Amru bin Naufal dan Hadhrat ?Abdurrahman bin ?Auf radhiyAllahu ta?ala ?anhuma.', NULL, 'active', 0, '2020-06-19 09:05:37', '2020-06-19 09:05:37'),
(11, 'khutbah', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Kisah Sahabat Rasulullah (saw): Shuhaib bin Sinan dan Sa?d bin Rabi ', 'kisah-sahabat-rasulullah-shuhaib-bin-sinan-dan-sad-bin-rabi', 'Pembahasan mengenai seorang Ahlu Badr (Para Sahabat Nabi Muhammad (saw) peserta perang Badr atau dianggap oleh Nabi (saw) mengikuti perang Badr), Hadhrat Shuhaib bin Sinan dan Hadhrat Sa?d bin Rabi? radhiyAllahu ta?ala ?anhuma.\n\nPenjelasan Hadhrat Khalifatul Masih II (ra) mengenai tuduhan orientalis yang menyebut Nabi Muhammad (saw) dibantu para budak (termasuk Hadhrat Shuhaib) dalam menyusun ajaran dan wahyunya.', NULL, 'active', 0, '2020-06-19 09:05:37', '2020-06-19 09:05:37'),
(12, 'khutbah', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Kecintaan antara Para Ahmadi dan Khalifah', 'kecintaan-antara-para-ahmadi-dan-khalifah', 'Dalam suatu kesempatan Hadhrat Masih Mau?ud ?alaihish shalaatu was salaam bersabda,\n\n    ?Saya sangat bersyukur kepada Allah Ta?ala karena Dia menganugerahkan sebuah Jemaat yang tulus dan setia kepada saya. Saya melihat bahwa ketika saya memanggil mereka untuk suatu pekerjaan dan tujuan tertentu maka mereka menyambut seruan saya dengan cepat dan penuh semangat saling berlomba satu sama lain sesuai dengan kekuatan dan taufik yang mereka miliki dan saya melihat di dalam diri mereka terdapat suatu ketulusan dan keikhlasan.?\n\nPemandangan ketulusan, keikhlasan, hubungan dan cinta kepada Hadhrat Masih Mau?ud (as) semacam ini memang sudah kita saksikan. Tak terhitung banyaknya kisah-kisah para sahabat Hadhrat Masih Mau?ud (as) berkaitan dengan ini. Di dalam keluarga Ahmadi awal riwayat-riwayat hubungan semacam ini masih berlangsung dan dalam khotbah-khotbah serta pidato-pidato para khalifatul Masih juga kita jumpai. Namun, hubungan yang terjalin dengan Hadhrat Masih Mau?ud (as) yang terus berlangsung dalam keluarga-keluarga awal ini juga terdapat di dalam orang-orang yang baru bergabung dalam Jemaat dan memang hendaknya seperti itu. Tidak hanya sampai di situ saja bahkan sesuai dengan janji Allah Ta?ala kepada Hadhrat Masih Mau?ud (as), setelah beliau pun, hubungan ini terus terjalin seperti itu. Dan hubungan inilah yang merupakan tanda dan jaminan persatuan dan kesatuan Jemaat.', NULL, 'active', 0, '2020-06-19 09:05:37', '2020-06-19 09:05:37'),
(13, 'khutbah', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Berjuang demi Akhir yang baik dengan Ibadah, Doa dan Perbuatan baik ', 'berjuang-demi-akhir-yang-baik-dengan-ibadah-doa-dan-perbuatan-baik', 'Pertama-tama saya ingin menyampaikan ucapan terimakasih kepada segenap Ahmadi yang pada beberapa waktu yang lalu ketika saya terluka telah mengungkapkan keharuannya dan mendoakan dengan penuh kekhusyu?an. Semoga Allah Ta?ala memberikan ganjaran yang terbaik kepada anda semua dan meningkatkan keikhlasan dan keseetiaan anda. Di zaman ini, demi Allah Ta?ala dan sesuai dengan firman Allah Ta?ala bahwa kecintaan satu sama lain, khususnya contoh keikhlasan dan kesetiaan terhadap Khalifah hanya bisa didapati dalam Jemaat Ahmadiyah. Kecintaan dua arah ini telah diciptakan oleh Allah Ta?ala. Dalam hal ini kita pun tidak dapat mengetahui siapa yang lebih memiliki simpati kepada yang lain. Terkadang nampak kecintaan anggota Jemaat pada Khilafat telah sampai pada puncaknya, dan jalinan serta kecintaan Khalifah-e-waqt dengan anggota Jemaat sebagian orang merasa tidak berada pada standar yang sama, namun bagaimanapun ini adalah kecintaan dan jalinan dua arah, dan sebagaimana yang telah saya katakana, ini adalah suatu jalinan yang permisalannya tidak ditemukan pada hubungan-hubungan duniawi.', NULL, 'active', 3, '2020-06-19 09:05:37', '2020-06-19 14:53:06'),
(14, 'khutbah', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Id Hakiki bagi umat Nabi Muhammad (saw) ', 'id-hakiki-bagi-umat-nabi-muhammad-saw', 'Dengan karunia Allah Ta?ala pada hari ini kita sedang merayakan ?Id, yaitu ?Idul Fitri nan penuh berkat. ?Id secara etimologi berarti: apa-apa atau sesuatu yang kembali lagi dan lagi, sedangkan menurut terminologi Islam, ?Id itu terbatas pada ?Idul Fitri dan ?Idul Adha. ?Idul Fitri adalah hari raya yang kita rayakan selepas bulan Ramadhan, yaitu hari dimana kita makan dan minum dengan bebas. Adapun ?Idul Adha adalah ?id yang berkaitan dengan ibadah haji dan ibadah qurban.\n\nOleh karenanya, ?Id itu adalah hari bersuka-ria dan bergembira. Terdapat dalam hadits bahwa ?Id itu merupakan hari makan minum, hari bersuka cita dan hari bergembira. Dari lafal inilah dipergunakan kata ?Id untuk berbagai kesempatan yang menggembirakan. Ekspresi atau gaya bahasa itu, dipergunakan juga dalam bahasa Urdu, di mana saja Saudara-saudara dapat mengungkapkan kebahagiaan yang besar kepada orang yang membahagiakan Saudara-saudara, ?Sungguh engkau telah menjadikan hariku sebagai ?Id (hari raya),? atau ?Engkau telah menjadikan hari ini sebagai ?Id bagi kami.?', NULL, 'active', 0, '2020-06-19 09:05:37', '2020-06-19 09:05:37'),
(15, 'khutbah', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Kegembiraan Sejati dalam Meraih Id Hakiki', 'kegembiraan-sejati-dalam-meraih-id-hakiki', '?Dan diantara manusia ada yang menjual dirinya untuk mencari ridha Allah; dan Allah Maha Penyantun terhadap hamba-hamba. Hai orang-orang yang beriman, masuklah kamu sekalian kedalam kepatuhan seutuhnya dan janganlah mengikuti langkah-langkah syetan, sesungguhnya ia bagimu musuh yang nyata.? (Al Baqarah: 208-209)\n\nAlhamdulillah, dengan karunia-Nya kita pada hari ini mendapat taufiq untuk merayakan Id lagi. Kita merayakan Idul Fitri karena merasa gembira bahwa demi memperoleh ridha Allah Ta?ala sesuai perintah-Nya, berhenti dari pekerjaan yang pada hari-hari biasa tidak ada sekatan atau larangan dan bebas dari setiap segi. Dan demi kemajuan ruhani, demi kemajuan akhlaq dan iman, setiap orang berusaha sesuai dengan kekuatan dan kemampuan masing-masing memahami Alqur?an Karim dan demi memperoleh berkat menilawatkannya selama 29 hari. ', NULL, 'active', 1, '2020-06-19 09:05:37', '2020-06-19 14:52:12'),
(16, 'khutbah', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Makna Meraih Ampunan di Bulan Ramadhan', 'makna-meraih-ampunan-di-bulan-ramadhan', 'Bulan Ramadhan ini rasanya baru mulai kemarin, sungguh cepat hari berlalu. Sepuluh hari kedua pun akan berakhir 2 atau 3 hari lagi lalu akan mulai sepuluh hari yang ketiga. Dalam satu riwayat dijelaskan keutamaan Ramadhan. Baginda Nabi Muhammad shallaLlahu ?alaihi wa sallam bersabda,\n\n?????? ?????? ????????? ???????? ?? ?????????? ?????????? ?? ??????? ?????? ???? ????????\n\n??wa huwa syahrun awwaluhu rahmatun wa ausathuhu maghfiratun wa aakhiruhu itqum minan naar.?\n\n??Ini adalah suatu bulan yang sepuluh hari pertamanya rahmat (kasih sayang), sepuluh hari pertengahannya memberikan maghfirah (ampunan) dan sepuluh hari terakhir menyelamatkan dari api (neraka Jahannam).?[1]\n\nHadits ini terdapat beragam riwayat. Sebagiannya ada yang sedikit rinci dan sebagiannya lagi ringkas. Namun keutamaan ketiga pembagian yang telah dijelaskan tadi terdapat kesamaan dalam setiap riwayatnya. Seperti telah yang saya katakan, saat ini kita tengah memasuki sepuluh hari yang kedua, masih tersisa beberapa hari lagi. Setelah itu insya Allah akan masuk pada sepuluh hari ketiga yang mengenainya sesuai riwayat tadi dikatakan sepuluh hari yang akan menyelamatkan kita dari api Jahannam.', NULL, 'active', 0, '2020-06-19 09:05:37', '2020-06-19 09:05:37'),
(17, 'khutbah', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Khutbah Idul Fitri 2010: Sesudah Kesusahan ada Kemudahan', 'khutbah-idul-fitri-2010-sesudah-kesusahan-ada-kemudahan', '?Jadi sesungguhnya sesudah setiap kesulitan ada kemudahan. Sesungguhnya sesudah setiap penderitaan ada kemudahan atau kelapangan besar.? (94:6-7)\n\nAyat-ayat yang telah saya tilawatkan ini merupakan ayat surat Al-Insyirah. Tentu banyak di antara saudara-saudara yang hafal surat ini. Surat ini turun di Makkah. Selama 13 tahun lamanya di Makkah, Rasulullah (saw) bersabar menahan tindak kekerasan, perlakuan sewenang-wenang yang melanggar batas peri-kemanusiaan serta kezaliman. Semua orang maklum mengenai hal ini. Setiap kali Rasulullah (saw) melihat kezaliman yang menimpa para sahabat, beliau (saw) senantiasa memberikan nasihat untuk bersabar dan berdoa untuk mereka.\n\nBegitu juga diriwayatkan tentang sebuah kezaliman yang tengah terjadi terhadap Yasir dan keluarganya, secara kebetulan Rasulullah (saw) lewat di sana. Melihat kezaliman ini, Rasulullah (saw) bersabda: ? ??????? ??? ??? ??????? ??????? ???????????? ?????????? ? ? Shabran yaa aala Yaasirin fainna mau?idakumul jannah ? ?Wahai keluarga Yasir! Janganlah melepaskan kesabaran, karena tempat kembali kalian adalah surga.Akibat penderitaan-penderitaan kalian itu, Tuhan tengah menyediakan surga untuk kalian.?[1]', NULL, 'active', 0, '2020-06-19 09:05:37', '2020-06-19 09:05:37'),
(18, 'khutbah', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Idul Fitri, Hari Bertobat dan Turunnya Karunia', 'idul-fitri-hari-bertobat-dan-turunnya-karunia', '?Sesungguhnya orang-orang yang berkata; ?Tuhan Kami Allah? kemudian mereka istiqamah, turun kepada mereka Malaikat-malaikat sembari berkata; ?Jangan kamu takut dan jangan pula kamu bersedih; dan bergembiralah dengan kabar suka tentang Surga yang telah dijanjikan kepada kamu.? (Surah Haa Miim as-Sajdah, Fushilat [41] : 31)\n\nKehidupan manusia kadangkala diliputi kegembiraan kadang-kadang diliputi kesedihan. Sarana kegembiraan juga terdapat berbagai macam jenisnya. Demikian juga sebab-sebab kesedihan terdapat berbagai macam jenisnya. Baik kegembiraan dan kesedihan itu secara pribadi maupun kegembiraan itu secara keluarga juga. Terdapat kegembiraan dan kesedihan yang dialami oleh Jemaat dan kegembiraan serta kesedihan yang dialami oleh Bangsa atau Negara juga. Terdapat kegembiraan secara rohaniah juga yang menyangkut dengan agama. Kemurkaan dan ridha Allah Ta?ala bagi seorang mukmin yang bertaqwa menjadi sarana kesedihan dan kegembiraan juga baginya. Pendeknya jenis kegembiraan dan kesedihan itu tidak terhitung banyaknya dan ada juga banyak sekali penyebab kegembiraan dan kesedihan itu.', NULL, 'active', 0, '2020-06-19 09:05:37', '2020-06-19 09:05:37'),
(19, 'khutbah', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Keteladanan Para Sahabat Nabi Muhammad shallAllahu ?alaihi wasallam (Manusia-Manusia Istimewa, seri 30)', 'khotbah/keteladanan-para-sahabat-nabi-muhammad-sasw-30', 'Hazrat Abu Hudzaifah bin Utbah bin Rabi\'ah bin Abdu Syams radhiyAllahu ta\'ala \'anhu\r\n\r\nAsal keturunan, Awalin dalam masuk Islam meski keluarga besarnya ialah penentang keras Islam; Hijrah ke Habasyah, sebuah negeri Kristen yang dipimpin raja yang adil; rumor atau kabar burung saat bermukim di Habasyah. Penjelasan muarrikh (sejarawan) Ahmadiyah, Hazrat Mirza Basyir Ahmad dalam buku Sirah Khataman Nabiyyin mengenai itu; peran dalam Sariyyah (ekspedisi); jawaban terhadap kritikan perang di bulan Haram (terlarang); peran dalam berbagai peperangan; ucapan bernada munafik dan kritikan terhadap Nabi Muhammad shallaLlahu \'alaihi wa sallam yang disesali olehnya sehingga mendambakan kesyahidan sebagai tanda menebus kesalahan.\r\n\r\nKewafatan Profesor Su\'ud Ahmad Khan Sahib ad-Dehlawi, Vice Principal (wakil kepala sekolah) pertama Ahmadiyah Secondary School di Ghana dan pengajar di Jamiah Ahmadiyah. Peran-peran pengkhidmatan beliau lainnya. Disebutkannya nama ayahanda dan kakek Almarhum dalam daftar Sahabat dan beberapa buku Hazrat Masih Mau\'ud \'alaihis salaam. Dzikr Khair dan pengumuman shalat Jenazah untuk Almarhum.', NULL, 'read', 0, '2020-06-19 09:05:37', '2020-06-30 03:53:41'),
(20, 'pembaca', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Cara Mewujudkan Perdamaian Dunia', 'cara-mewujudkan-perdamaian-dunia', 'Bismillahirrahmanirrahiim\n\nAssalamualaikum wa rohmatullahi wa barokaatuhu\n\nPertama-tama saya ingin mengucapkan terimakasih kepada Anda sekalian semua yang telah menghadiri acara ini. Pengurus lokal Ahmadiyah Kanada telah meminta saya untuk berbicara pada hari ini tentang sarana dan cara-cara untuk membangun perdamaian dunia. Tentu saja, semua orang menyadari bahwa dunia sangat membutuhkan perdamaian dan kerukunan, namun meskipun memahami hal ini, tampaknya orang-orang seolah tidak mau mengambil langkah yang diperlukan untuk mencapainya. Sangat mudah berbicara tentang berjuang demi perdamaian, tetapi pada kenyataannya, upaya yang dilakukan untuk ini jauh dari kata cukup.', 'home_20.jpg', 'active', 3, '2020-06-19 09:05:37', '2020-06-24 07:06:01'),
(21, 'pembaca', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Islam dan Terorisme', 'islam-dan-terorisme', 'Sangat disayangkan bahwa Islam, yang merupakan agama damai, yang penuh harapan, kerukunan, kebaikan dan persaudaraan telah ternodai oleh para pelaku terorisme dan barbarisme seperti yang kita saksikan beberapa tahun terakhir.\n\nTujuan dari presentasi ini adalah untuk mengetengahkan ajaran Islam sehingga wujud berbagai aksi teroris dapat ditampakkan secara terang benderang berdasarkan ajaran Islam dimana di dalamnya tindakan-tindakan tersebut berlindung mengatasnamakannya.', 'home_22.jpg', 'active', 1, '2020-06-19 09:05:37', '2020-06-22 14:38:06'),
(22, 'pembaca', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'Cinta Tanah Air Menurut Ajaran Islam', 'cinta-tanah-air-menurut-ajaran-islam', '?Zentrum Innere Fuhrung?, Pusat Kepemimpinan Internal, adalah Markas Besar yang digunakan oleh Angkatan Bersenjata Jerman untuk mendidik para anggotanya dalam berbagai bidang aspek pengetahuan dan kehidupan serta melatih mereka perihal organisasi internal dan strukturnya. Disamping sebagai tempat pendidikan moral, politik dan hukum serta tempat pelatihan para anggotanya, badan ini juga mendidik mereka tentang berbagai macam budaya, bangsa dan agama.\n\nUntuk tujuan ini, berbagai orang telah diundang untuk menyampaikan materi pada bidang tertentu. Sebagai contoh, Jaksa Agung Nasional Jerman, Ketua Pusat Organisasi Yahudi di Jerman Ms Knoblock, Mr. Aiman Mazik dari Organisasi Muslim Central di Jerman dll semuanya telah diundang ke markas mereka. Hazrat Mirza Masroor Ahmad, Khalifah Ahmadiyah V juga telah diundang untuk memberikan ceramah tentang Islam pada 30 mei 2012. Diantara mereka yang hadir adalah: Komandan Pusat, Brigadir Jenderal Bach, Kolonel I.G. Janke, Komandan Angkatan laut Mr Liedtke, Angkatan Udara Comandan Trautvetter, Pendeta untuk Angkatan Bersenjata Jerman dan Walikota Koblenz, Prof, Dr. Joachim Hofmann-G?ttig. Berikut kami ketengahkan pidato lengkap Hazrat Mirza Masroor Ahmad yang berjudul: Ajaran Islam tentang Kesetiaan dan Cinta Tanah Air.', 'cinta-tanah-air_1593341649.jpg', 'active', 6, '2020-06-29 13:31:00', '2020-06-28 10:54:09'),
(23, 'pembaca', 0, 'Yendra Budiana', 'info@ahmadiyah.id', 'FALSAFAH KEBANGKITAN ISLAM', 'falsafah-kebangkitan-islam', 'Pada hari ini saya akan menyampaikan falsafah Islam tentang kebangkitan agama-agama. Agama selalu dihidupkan kembali melalui campur tangan Tuhan. Seorang Pembaharu dikirim oleh Allah taala untuk mengembalikan orang-orang dari kehidupan materialisme kepada Pencipta mereka. Sosok Pembaharu tersebut selalu menyeru untuk melakukan berbagai pengorbanan besar semata-mata demi Tuhan. Ia mengajak orang-orang untuk bermujahadah, beristiqomah, bersabar dan bertawakal, dan memberitahukan mereka bahwa barangsiapa yang menginginkan ?hidup? harus siap berpisah dengan ?kehidupan? mereka. Ia mempersiapkan mereka untuk suatu perjuangan panjang dan penuh kepedihan menghadapi perlawanan dan penganiayaan yang membabi buta di tangan orang-orang yang mereka cintai dan ingin selamatkan. Inilah satu-satunya falsafah kebangkitan agama yang hakiki dan abadi; setiap falsafah yang bertentangan dengan ini hanyalah fantasi belaka. Namun harus saya sebutkan bahwa semua golongan Islam tidak sama mengenai hal ini. Sebagian besar umat Islam meyakini bahwa perubahan yang fundamental sudah terjadi dalam bentuk kebangkitan agama. Jamaah Ahmadiyah sebaliknya meyakini bahwa proses historis ini terus menerus terjadi dan tidak berubah. Agar perbedaan pendapat di antara umat Islam ini tidak menciptakan kesan yang salah, saya anggap perlu untuk menyebutkan keyakinan dasar bersama yang menyatukan seluruh umat Islam, apapun golongannya.', 'falsafah-kebangkitan-islam_1593421913.jpg', 'active', 0, '2020-06-19 09:05:37', '2020-06-29 09:11:52'),
(29, 'pembaca', NULL, 'Bayu Nurkholis', 'sfd@sdf.com', 'Materi Pendidikan Kecakapan Hidup', 'materi-pendidikan-kecakapan-hidup', '<p>sdfsadfsafsadf dasdfsafsa<br></p>', 'materi-pendidikan-kecakapan_1593479204.jpg', 'active', NULL, '2020-06-29 09:10:17', '2020-06-30 01:08:07'),
(30, 'kegiatan', NULL, 'Jemaat Ahmadiyah Indonesia', 'info@ahmadiyah.id', 'Ahmadiyah -  Sebuah Gambaran Singkat', 'ahmadiyah-sebuah-gambaran-singkat', '<p>Jemaat Muslim Ahmadiyah adalah sebuah gerakan kebangkitan dalam Islam, berskala internasional, bersifat dinamis dan berkembang dengan cepat. Didirikan pada tahun 1889, saat ini Ahmadiyah telah menyebar ke 210 negara dengan pengikut puluhan juta. Pusat gerakan ini kini berada di Inggris.<br><br>Jemaat Muslim Ahmadiyah adalah satu-satunya organisasi Islam yang meyakini bahwa Al-Masih yang sudah lama ditunggu kedatangannya telah hadir dalam wujud Mirza Ghulam Ahmad  as (1835-1908) dari Qadian. Atas perintah Allah swt Mirza Ghulam Ahmad  as mendakwakan diri secara metaforik sebagai perwujudan kedatangan kedua kali Nabi Isa as dari Nazareth, yang kedatangannya telah nubuatkan oleh Rasulullah saw. Jemaat Muslim Ahmadiyah percaya bahwa Allah swt mengutus Ahmad as, seperti halnya Nabi Isa as, untuk mengakhiri perang agama, menolak pertumpahan darah dan membangkitkan kembali moralitas, keadilan dan perdamaian. Kedatangan Mirza Ghulam Ahmad as membawa era kebangkitan Islam yang belum pernah terjadi sebelumnya. Beliau melepaskan Islam dari keyakinan dan kebiasaan fanatik, beliau memperjuangkan dengan penuh semangat ajaran pokok Islam yang hakiki. Beliau pun mengakui ajaran luhur para pendiri agama besar dan wujud-wujud suci, seperti Zoroaster, Ibrahim as, Musa as, Yesus as, Krishna, Buddha, Konfusius, Lao Tzu dan Guru Nanak, dan menjelaskan bagaimana ajaran-ajaran tersebut memusat pada satu titik dalam ajaran Islam yang hakiki.<br><br>Jemaat Muslim Ahmadiyah adalah organisasi Islam terdepan yang menolak terorisme dalam bentuk apapun. Lebih dari satu abad yang lalu, Mirza Ghulam Ahmad  as dengan tegas menyatakan bahwa “jihad dengan pedang” secara agresif sudah tidak memiliki tempat dalam Islam. Sebagai gantinya, beliau mengajarkan pengikutnya berjihad tanpa kekerasan, yakni jihad intelektual, “jihad dengan pena” dalam membela Islam. Untuk tujuan ini, Mirza Ghulam Ahmad  as telah menulis lebih dari 90 buku dan puluhan ribu surat, menyampaikan ratusan ceramah, serta terlibat dalam berbagai debat publik. Pembelaan beliau terhadap Islam yang begitu teliti dan rasional membuat pemikiran Islam konvensional menjadi gelisah. Sebagai bagian dari upaya membangkitkan kembali agama Islam, Jemaat Muslim Ahmadiyah terus menerus menyebarkan ajaran Mirza Ghulam Ahmad  as yang moderat dan bertahan dalam menghadapi penentangan dari berbagai dunia Muslim.<br><br>Demikian pula, Jemaat Muslim Ahmadiyah adalah satu-satunya organisasi Islam yang mendukung pemisahan agama dan negara. Lebih dari satu abad yang lalu, Mirza Ghulam Ahmad as mengajarkan pengikutnya untuk melindungi kesucian agama dan pemerintah, dengan cara menjadi jiwa-jiwa yang shaleh dan warga negara yang setia. Beliau memperingatkan penafsiran yang tidak masuk akal terhadap ajaran Al-Qur’an dan penerapan hukum Islam yang tidak tepat. Beliau terus-menerus menyuarakan perhatiannya dalam melindungi hak-hak makhluk Tuhan. Saat ini, Jamaah yang beliau dirikan tetap menjadi pembela hak asasi manusia yang universal dan memberikan perlindungan bagi pemeluk agama serta kelompok minoritas lainnya. Jemaat ini memperjuangkan pemberdayaan dan pendidikan perempuan. Anggota Jamaah ini adalah orang-orang Muslim yang taat hukum, berpendidikan, dan terlibat aktif di dunia.<br><br>Jemaat Muslim Ahmadiyah adalah organisasi Islam terkemuka yang dipimpin secara terpusat oleh seorang pemimpin spiritual, yang dikenal sebagai Khalifah Islam. Lebih dari satu abad yang lalu, Mirza Ghulam Ahmad  as mengingatkan para pengikutnya tentang janji Allah yang akan menjaga risalah Islam melalui khilafat (lembaga spiritual penerus kenabian). Jamaah Ahmadiyah percaya bahwa hanya melalui sistem kepemimpinan rohani dalam bentuk Khilafat, yang dapat menegakkan nilai-nilai Islam hakiki dan menyatukan umat manusia. Lima pemimpin rohani telah meneruskan misi Mirza Ghulam Ahmad  as semenjak kewafatannya pada tahun 1908. Pimpinan rohani Ke-5 yang saat ini tengah memimpin Ahmadiyah adalah Khalifah Islam Mirza Masroor Ahmad, dan menetap di Inggris. Di bawah kepemimpinan Khilafat Islam, saat ini Jamaah Muslim Ahmadiyah telah membangun lebih dari 16.000 masjid, lebih dari 500 sekolah, dan lebih dari 30 rumah sakit. Jamaah ini telah menerjemahkan Al-Qur’an ke dalam lebih dari 70 bahasa, menyebarkan ajaran Islam yang hakiki dan pesan perdamaian serta pesan toleransi  melalui saluran televisi satelit yang mengudara dua puluh empat jam setiap harinya (MTA), melalui media Internet (alislam.org) dan media cetak (Islam International Publications). Jamaah Muslim Ahmadiyah berada di garis terdepan dalam memberikan bantuan terhadap korban bencana di seluruh dunia melalui organisasi amal independen, Humanity First.<br></p>', 'ahmadiyah-sebuah_1593433986.jpg', 'active', NULL, '2020-06-29 12:13:43', '2020-06-29 14:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `judul_asli` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `penerjemah` varchar(255) DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `edisi` varchar(255) DEFAULT NULL,
  `ukuran` varchar(255) DEFAULT NULL,
  `halaman` varchar(255) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `sinopsis` longtext DEFAULT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `slug`, `judul_asli`, `cover`, `penulis`, `penerjemah`, `editor`, `edisi`, `ukuran`, `halaman`, `penerbit`, `sinopsis`, `file`, `created_at`, `updated_at`) VALUES
(1, 'Bahtera Nuh', 'bahtera-nuh', 'Noah’s Ark', 'bahtera-nuh.jpg', 'Hadhrat Mirza Ghulam Ahmad a.s.', 'R. Ahmad Anwar, Sayyid Shah Muhammad', 'Ekky O. Sabandi', 'Cetakan 5, Juli 2018', '4.8 x 21 cm', 'xii+166 halaman ', 'Neratja Press, 2014', 'Alhamdulillah,   buku   Bahtera   Nuh   ini   telah   diterbitkan   ulang.  Penerbitan  buku  ini  antara  lain  sebagai  tindak  lanjut  dari  Khutbah  Hazrat  Khalifatul  Masih  IVrha.  Beliau  bersabda  dalam Khutbah beliau tanggal 28 Juni 1991 di Detroit, Amerika Serikat:“Ada  zaman  ketika  tidak  dijumpai  seorang  anak  Ahmadi  pun  yang  pernah  menelaah  buku  Bahtera  Nuh  yang  penting  ini,  akan  tetapi  saya  kira  banyak  sekali  anak  keturunan  kita,  banyak anak muda Ahmadi di berbagai negeri yang barangkali pernah  mendengar  nama  buku  ini,  namun  boleh  jadi  mereka  tidak mendapat taufik untuk menelaah buku yang penting ini. Dikatakan penting karena Bahtera yang dianugerahkan kepada Hadhrat  Masih  Mau’uda.s.  bukanlah  Bahtera  yang  terbuat  dari  papan dan paku, melainkan terbuat dari sebuah Ajaran.”“Pendek  kata,  di  dalam  zaman  yang  merupakan  zaman  kebinasaan ini, saat azab yang beraneka ragam bentuknya siap melanda bumi, maka penting sekali bagi semua warga Jemaat Ahmadiyah  mengenal  buku  Bahtera  Nuh  ini,  dan  hendaknya  mereka  memahami  bahwa  dengan  perantaraan  Bahtera  yang  seperti apa bentuknya Dia (Allah Ta’ala) akan menyelamatkan umat  manusia.  Sebab,  siapa  pun  yang  tidak  menaiki  Bahtera  ini,   tidak   boleh   berharap   sedikit   pun   untuk   mendapatkan   keselamatan.”', 'bahtera-nuh.pdf', '2020-06-15 14:19:44', '2020-06-15 14:19:44'),
(2, 'Inti Ajaran Islam Bagian 1', 'inti-ajaran-islam-bagian-1', 'The Essence of Islam Volume I', 'inti-ajaran-islam.png', 'Hadhrat Mirza Ghulam Ahmad as', 'A. Q. Khalid', 'Ekky O. Sabandi', 'Edisi Pertama, 2014', '15.5 x 23 cm', 'xL+ 497 hal', 'Neratja Press, 2014', 'Buku ini secara mendalam menjelaskan empat pokok inti ajaran Islam yaitu pertama, menjelaskan tentang Agama Islam, apa maksud dan tujuan kita beragama; mengapa kita harus memilih Islam sebagai agama kita dan berkat-berkat dan kemajuan apa yang dapat kita peroleh ketika kita memilih Islam sebagai agama kita.<br>\r\nKedua, menjelaskan tentang Allah swt, dijelaskan berdasarkan pengalaman Hadhrat Masih Mau’ud  as sendiri seperti apa Keagungan, Rahmat dan Kasih Sayang Allah swt; dan bagaimana kehebatan ajaran Nabi Muhammad saw tentang keimanan dan ketauhidan Islam dalam membawa umat manusia menuju pengenalan akan Allah swt; serta penjelasan tentang sifat-sifat Allah swt yang dengan penjelasan yang sangat luas dan mendalam sehingga dengan membacanya seakan-akan kita sedang dibawa oleh penulis buku ini menghadap kepada Allah swt, Raja yang Maha Agung.<br>\r\nKetiga, menjelaskan derajat dan kedudukan Nabi Muhammad saw yang dengan membaca penjelasannya, kita akan memperoleh jawaban atas pertanyaan mengapa kita harus mengikuti, mentaati dan mengabdi kepada Nabi Muhammad, Rasulullah saw.<br>\r\nDan yang keempat, Penjelasan tentang Kitab Suci Al-Quran, apa tujuan kitab itu diturunkan, apa keunggulan kitab Al-Quran dari kitab-kitab yang sudah ada, kebenaran dan kebesaran apa saja yang terkandung di dalamnya, dan sebagainya.<br>\r\nBuku dapat dijadikan sebagai bacaan wajib, karena dengan menelaah dan membacanya kita akan memperoleh obat yang dapat lebih menguatkan iman dan keyakinan kita, bahwa Islamsebagai agama kita, Allah swt sebagai Tuhan kita, Yang Mulia Nabi Muhammad saw sebagai Nabi dan Panutan kita, dan Al-Quran sebagai kitab suci kita.', 'inti-ajaran-islam-bagian-1.pdf', '2020-06-15 14:20:20', '2020-06-15 14:20:20'),
(3, 'Awal Perselisihan dalam Islam', 'awal-perselisihan-dalam-islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'awal-perselisihan-dalam-islam.pdf', '2020-06-15 14:20:20', '2020-06-15 14:20:20'),
(4, 'Filsafat Ajaran Islam', 'filsafat-ajaran-islamfilsafat-ajaran-islam', NULL, 'filsafat-ajaran-islam.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'filsafat-ajaran-islam.pdf', '2020-06-15 14:19:44', '2020-06-15 14:19:44'),
(5, 'Keberkatan Doa', 'keberkatan-doa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'keberkatan-doa.pdf', '2020-06-15 14:19:44', '2020-06-15 14:19:44'),
(6, 'Perlunya Seorang Imam', 'perlunya-seorang-imam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'perlunya-seorang-imam.pdf', '2020-06-15 14:19:44', '2020-06-15 14:19:44'),
(7, 'Dzikir Illahi', 'dzikir-Illahi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dzikir-Illahi.pdf', '2020-06-15 14:19:44', '2020-06-15 14:19:44'),
(8, 'Islam Isu Kontemporer', 'islam-isu-kontemporer', NULL, 'isu-kontemporer.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'islam-isu-kontemporer.pdf', '2020-06-15 14:19:44', '2020-06-15 14:19:44'),
(9, 'Tuhan di Abad 21', 'tuhan-di-abad-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tuhan-di-abad-21.pdf', '2020-06-15 14:19:44', '2020-06-15 14:19:44'),
(10, 'Penjelasan Ahmadiyah', 'penjelasan-ahmadiyah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'penjelasan-ahmadiyah.pdf', '2020-06-15 14:19:44', '2020-06-15 14:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `wilayah_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`id`, `nama`, `wilayah_id`, `created_at`, `updated_at`) VALUES
(1, 'Banda Aceh', 1, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(2, 'Belawan', 1, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(3, 'Brastagi', 1, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(4, 'Hinai', 1, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(5, 'Kabanjahe', 1, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(6, 'LhokSeumawe', 1, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(7, 'Medan', 1, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(8, 'Namorambe', 1, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(9, 'Tanjung Morawa', 1, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(10, 'Tanjungpura', 1, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(11, 'Tapak Tuan', 1, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(12, 'Bah Damar', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(13, 'Bangun Baru', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(14, 'Buntu Pane', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(15, 'Dolok Kahean', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(16, 'Kualuh Hilir', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(17, 'Lima Puluh', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(18, 'Pamatang Bandar', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(19, 'Paya Pasir', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(20, 'Ranto prapat', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(21, 'Sosa', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(22, 'Tanjung Balai', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(23, 'Tebing Tinggi', 2, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(24, 'Kota Bangun', 3, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(25, 'Pangkalan Kerinci', 3, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(26, 'Pekanbaru', 3, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(27, 'Perawang', 3, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(28, 'Siak Sri Indrapura', 3, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(29, 'Singingi', 3, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(30, 'Teluk Kuantan', 3, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(31, 'Tuah Karya', 3, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(32, 'Batu Langkah', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(33, 'Kateman', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(34, 'Kubu', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(35, 'Kunto Darussalam', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(36, 'Mandau', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(37, 'Pasir Pangaraian', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(38, 'Pulau Burung', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(39, 'Rengat', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(40, 'Simpang Kanan', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(41, 'Sungai Rangau', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(42, 'Tanah Putih', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(43, 'Tanjung Medan', 4, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(44, 'Batam', 5, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(45, 'Natuna (halqa)', 5, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(46, 'Numbing', 5, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(47, 'Tanjung Pinang', 5, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(48, 'Batusangkar', 6, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(49, 'Bukit Tinggi', 6, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(50, 'Duku', 6, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(51, 'Mentawai (Halqa)', 6, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(52, 'Padang', 6, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(53, 'Pampangan', 6, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(54, 'Payakumbuh', 6, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(55, 'Ujung Gading', 6, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(56, 'Guguk Sarai', 7, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(57, 'Lurah Ingu', 7, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(58, 'Muara Timpeh', 7, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(59, 'Solok (Guguk Sarai)', 7, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(60, 'Solok Selatan', 7, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(61, 'Talang', 7, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(62, 'Gunung Kerinci', 8, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(63, 'Jambi', 8, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(64, 'Mersam', 8, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(65, 'Muara Bungo', 8, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(66, 'Pasar Minggu', 8, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(67, 'Singkut', 8, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(68, 'Sungai Merah', 8, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(69, 'Baturaja', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(70, 'Bayung Lincir', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(71, 'Burnai Mulya', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(72, 'Cecar', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(73, 'Jalur Delapan', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(74, 'Jati', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(75, 'Lahat', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(76, 'Lubuk Linggau', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(77, 'Palembang', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(78, 'Pematang Jaya', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(79, 'Pulau Rimau', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(80, 'Sungsang', 9, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(81, 'Bengkulu', 10, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(82, 'Curup', 10, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(83, 'Bangka', 11, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(84, 'Belitung', 11, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(85, 'Abung Selatan', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(86, 'Bakauheni', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(87, 'Bandar Lampung', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(88, 'Budijaya', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(89, 'Ikatan Saudara', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(90, 'Menggala', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(91, 'Pagelaran', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(92, 'Pringsewu', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(93, 'Rawapitu', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(94, 'Sidomulyo', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(95, 'Sidorahayu', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(96, 'Talang Padang', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(97, 'Teluk Betung', 12, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(98, 'Cilegon', 13, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(99, 'Cisereh', 13, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(100, 'Merak', 13, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(101, 'Pandeglang', 13, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(102, 'Rangkasbitung', 13, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(103, 'Serang', 13, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(104, 'Tegal Lumbu', 13, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(105, 'Waringin Kurung', 13, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(106, 'Gondrong', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(107, 'Kampung Kramat', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(108, 'Pagedangan', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(109, 'Paninggilan', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(110, 'Panunggangan Pusat', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(111, 'Panunggangan Timur', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(112, 'Pasir Semut', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(113, 'Perigi', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(114, 'Rajeg', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(115, 'Serua', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(116, 'Tangerang', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(117, 'Warung Mangga', 14, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(118, 'Depok', 15, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(119, 'Jakarta Barat', 15, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(120, 'Jakarta Pusat', 15, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(121, 'Jakarta Timur', 15, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(122, 'Jakarta Utara', 15, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(123, 'Kebayoran', 15, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(124, 'Lenteng Agung', 15, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(125, 'Pulau Tidung', 15, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(126, 'Bekasi', 16, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(127, 'Bojong', 16, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(128, 'Bulaktemu', 16, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(129, 'Cikampek', 16, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(130, 'Cikarang Utara', 16, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(131, 'Karawang', 16, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(132, 'Tambun', 16, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(133, 'Bogor', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(134, 'Ciaruteun', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(135, 'Cibeureum', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(136, 'Cibinong', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(137, 'Cibitung Wetan', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(138, 'Ciherang', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(139, 'Cileungsi', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(140, 'Cimayang', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(141, 'Cisalada', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(142, 'Citeureup', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(143, 'Karyasari', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(144, 'Leuwisadeng', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(145, 'Sindangbarang', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(146, 'Tugu Selatan', 17, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(147, 'Cibadak', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(148, 'Cikembar', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(149, 'Cisaat', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(150, 'Citalahab', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(151, 'Jampang Kulon', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(152, 'Karang Tengah', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(153, 'Lebaksari', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(154, 'Panjalu', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(155, 'Parakansalak', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(156, 'Sukabumi', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(157, 'Waluran (Cimulek)', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(158, 'Warungkiara', 18, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(159, 'Agrabinta', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(160, 'Baros', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(161, 'Bojong Picung', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(162, 'Bunikasih', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(163, 'Ciandam', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(164, 'Cianjur', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(165, 'Cicakra', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(166, 'Cidaun', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(167, 'Cikalong Kulon', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(168, 'Ciparay', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(169, 'Cipeuyeum', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(170, 'Cisitu', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(171, 'Datar Kupa', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(172, 'Kebon Kopi', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(173, 'Leuwimangu', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(174, 'Neglasari', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(175, 'Panyairan', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(176, 'Ranca Umbul', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(177, 'Sindangkerta', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(178, 'Talaga', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(179, 'Warga Asih', 19, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(180, 'Arjasari', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(181, 'Bandung Kidul', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(182, 'Bandung Kulon', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(183, 'Bandung Tengah', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(184, 'Bandung Wetan', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(185, 'Banjaran', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(186, 'Batujajar', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(187, 'Cicalengka', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(188, 'Majalaya', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(189, 'Pangalengan', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(190, 'Pinggirsari', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(191, 'Soreang', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(192, 'Sukatali', 20, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(193, 'Cibatu', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(194, 'Cigedug', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(195, 'Cilimus', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(196, 'Garut', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(197, 'Karangpawitan', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(198, 'Kersamanah', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(199, 'Malangbong', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(200, 'Nyalindung', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(201, 'Pameungpeuk', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(202, 'Pangauban', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(203, 'Samarang', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(204, 'Sanding', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(205, 'Sukamaju', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(206, 'Sukawening', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(207, 'Wanaraja', 21, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(208, 'Bojongsirna', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(209, 'Cibalong', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(210, 'Cigunungtilu', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(211, 'Citeguh', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(212, 'Indihiang', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(213, 'Kawalu', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(214, 'Kersamaju', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(215, 'Mayangcinde', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(216, 'Nagrak', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(217, 'Singaparna', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(218, 'Sukapura', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(219, 'Sukasari', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(220, 'Tasikmalaya', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(221, 'Wanasigra', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(222, 'Wanasigra Wetan', 22, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(223, 'Banjar', 23, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(224, 'Banjarsari', 23, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(225, 'Ciamis', 23, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(226, 'Cimaragas', 23, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(227, 'Kalipucang', 23, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(228, 'Maparah', 23, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(229, 'Panawangan', 23, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(230, 'Pangandaran', 23, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(231, 'Parigi', 23, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(232, 'Sidamulih', 23, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(233, 'Cikedung', 24, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(234, 'Ciledug', 24, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(235, 'Cirebon', 24, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(236, 'Indramayu', 24, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(237, 'Sekarmulya', 24, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(238, 'Kadipaten', 25, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(239, 'Kuningan', 25, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(240, 'Majalengka', 25, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(241, 'Manislor', 25, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(242, 'Sadasari', 25, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(243, 'Bunijaya', 26, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(244, 'Cimahi', 26, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(245, 'Cisarua', 26, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(246, 'Lembang', 26, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(247, 'Maniis', 26, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(248, 'Padalarang', 26, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(249, 'Purwakarta', 26, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(250, 'Rajamandala', 26, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(251, 'Subang', 26, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(252, 'Brebes', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(253, 'Cigintung', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(254, 'Cilacap', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(255, 'Gombong', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(256, 'Kebumen', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(257, 'Kedung Banteng', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(258, 'Keniten', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(259, 'Patimuan', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(260, 'Purbalingga', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(261, 'Purwokerto', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(262, 'Purwokerto Utara', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(263, 'Sumbang', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(264, 'Tegal', 27, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(265, 'Banjarnegara', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(266, 'Bawang', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(267, 'Bawang Utara', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(268, 'Bendungan', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(269, 'Jawaran', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(270, 'Jengkol', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(271, 'Lengkong', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(272, 'Madukara', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(273, 'Magelang', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(274, 'Malangsari', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(275, 'Pagentan', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(276, 'Purwareja Klampok', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(277, 'Purworejo', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(278, 'Temanggung', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(279, 'Wadas Lintang', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(280, 'Wonoroto', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(281, 'Wonosari', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(282, 'Wonosobo', 28, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(283, 'Batang', 29, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(284, 'Gemuh', 29, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(285, 'Getasan', 29, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(286, 'Patean', 29, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(287, 'Salatiga', 29, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(288, 'Semarang', 29, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(289, 'Susukan', 29, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(290, 'Boyolali', 30, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(291, 'Solo', 30, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(292, 'Tawangmangu', 30, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(293, 'Gabus (Pati)', 31, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(294, 'Gunung Muria', 31, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(295, 'Ngaringan', 31, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(296, 'Penawangan', 31, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(297, 'Gunung Kidul', 32, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(298, 'Piyungan', 32, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(299, 'Sleman', 32, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(300, 'Yogyakarta', 32, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(301, 'Benowo', 33, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(302, 'Gedangan', 33, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(303, 'Gresik', 33, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(304, 'Surabaya', 33, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(305, 'Taman', 33, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(306, 'Tuban (Halqa)', 33, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(307, 'Jombang (Halqa)', 34, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(308, 'Kediri', 34, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(309, 'Madiun', 34, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(310, 'Magetan', 34, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(311, 'Nganjuk', 34, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(312, 'Plosoklaten', 34, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(313, 'Puncu', 34, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(314, 'Tulung Agung', 34, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(315, 'Bangil', 35, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(316, 'Banyuwangi (halqa)', 35, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(317, 'Jember', 35, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(318, 'Malang', 35, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(319, 'Situbondo (halqa)', 35, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(320, 'Denpasar', 36, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(321, 'Penyabangan', 36, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(322, 'Singaraja', 36, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(323, 'Tejakula', 36, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(324, 'Bagik Manis', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(325, 'Gegerung', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(326, 'Keruak', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(327, 'Mataram', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(328, 'Medas Sambelia', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(329, 'Pancor', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(330, 'Paradorato', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(331, 'Praya', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(332, 'Pulau Moyo (Halqa)', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(333, 'Rembuah', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(334, 'Sambi Elen', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(335, 'Sembalun', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(336, 'Sukamulya', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(337, 'Sumbawa', 37, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(338, 'Alor', 38, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(339, 'Atambua (halqa)', 38, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(340, 'Dili', 38, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(341, 'Ende (halqa)', 38, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(342, 'Kupang', 38, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(343, 'Lembata (halqa)', 38, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(344, 'Timor Tengah Selatan', 38, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(345, 'Ketapang (halqa)', 39, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(346, 'Pontianak', 39, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(347, 'Balaigana', 40, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(348, 'Entikong (halqa)', 40, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(349, 'Penyelimau Jaya', 40, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(350, 'Sintang', 40, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(351, 'Andeng', 41, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(352, 'Bengkayang', 41, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(353, 'Kampung Anam', 41, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(354, 'Banjarmasin', 42, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(355, 'Palaihari', 42, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(356, 'Sebamban', 42, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(357, 'Lamunti', 43, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(358, 'Paju Epat', 43, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(359, 'Palangkaraya', 43, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(360, 'Pangkoh III', 43, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(361, 'Tanggul Harapan', 43, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(362, 'Pangkalan Bun', 44, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(363, 'Sampit', 44, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(364, 'Kutai Timur', 45, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(365, 'Melak', 45, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(366, 'Mook Manaar', 45, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(367, 'Samarinda', 45, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(368, 'Berau', 46, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(369, 'Bontang', 46, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(370, 'Nunukan (halqa)', 46, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(371, 'Tanjung Selor (halqa)', 46, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(372, 'Tarakan', 46, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(373, 'Balikpapan', 47, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(374, 'Tanah Grogot', 47, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(375, 'Bulukumba', 48, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(376, 'Gowa', 48, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(377, 'Jeneponto', 48, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(378, 'Makassar', 48, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(379, 'Selayar (Halqa)', 48, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(380, 'Selayar (Halqa)', 48, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(381, 'Selayar (Halqa)', 48, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(382, 'Takalar', 48, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(383, 'Pare-Pare', 49, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(384, 'Tonra', 49, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(385, 'Wajo', 49, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(386, 'Luwu Utara', 50, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(387, 'Mamuju (halqa)', 51, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(388, 'Pasang Kayu', 51, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(389, 'Polewali Mandar', 51, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(390, 'Ahuaolano-Konda', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(391, 'Andolo (halqa)', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(392, 'Bau-bau', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(393, 'Kendari', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(394, 'Kondoano', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(395, 'Koronua', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(396, 'Ladongi', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(397, 'Landono/Mowila', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(398, 'Masagena', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(399, 'Morosi', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(400, 'Muna', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(401, 'Ngapaha', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(402, 'Pasar Wajo', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(403, 'Poasia', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(404, 'Sambahule', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(405, 'Tetesingi', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(406, 'Tinanggea', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(407, 'Wakatobi (Halqa)', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(408, 'Wolasi-Konda', 52, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(409, 'Palu', 53, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(410, 'Poso', 53, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(411, 'Sigi Biromaru', 53, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(412, 'Tarans Tiloan', 53, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(413, 'Bolaangitang', 54, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(414, 'Konarom', 54, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(415, 'Kosinggolan', 54, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(416, 'Kotamobagu', 54, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(417, 'Lolak', 54, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(418, 'Manado', 55, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(419, 'Sea Minahasa', 55, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(420, 'Gorontalo', 56, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(421, 'Marissa (Halqa)', 56, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(422, 'Ambon', 57, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(423, 'Aru (Halqa)', 57, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(424, 'Gemba, Bula (Halqa)', 57, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(425, 'Pulau Buru', 57, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(426, 'Seram Barat (Halqa)', 57, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(427, 'Waisili', 57, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(428, 'Morotai (halqa)', 58, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(429, 'Sofifi (Halqa)', 58, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(430, 'Ternate', 58, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(431, 'Tobelo (halqa)', 58, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(432, 'Jagebob', 59, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(433, 'Jayapura', 59, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(434, 'Kota Merauke', 59, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(435, 'Kurik Merauke', 59, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(436, 'Fakfak (Halqa)', 60, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(437, 'Kaimana (Halqa)', 60, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(438, 'Kota Sorong', 60, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(439, 'Manokwari', 60, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(440, 'Manokwari Selatan', 60, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(441, 'Wedoni (Halqa)', 60, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(442, 'Headquarter', 61, '2020-06-05 14:40:00', '2020-06-05 14:40:00'),
(443, 'Kemang', 61, '2020-06-05 14:40:00', '2020-06-05 14:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` bigint(20) NOT NULL,
  `kegiatan_id` int(20) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `kegiatan_id`, `foto`, `created_at`, `updated_at`) VALUES
(1, 1, 'baitpage.jpg', '2020-06-22 22:55:07', '2020-06-22 22:55:07'),
(2, 1, 'banner.jpg', '2020-06-22 22:55:07', '2020-06-22 22:55:07'),
(3, 2, 'cinta-sejati.jpg', '2020-06-22 22:55:51', '2020-06-22 22:55:51'),
(4, 2, 'contact.jpg', '2020-06-22 22:55:51', '2020-06-22 22:55:51'),
(5, 3, 'home_1.jpg', '2020-06-22 22:56:31', '2020-06-22 22:56:31'),
(6, 4, 'home_2.jpg', '2020-06-22 22:56:31', '2020-06-22 22:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` bigint(20) NOT NULL,
  `cabang_id` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `cabang_id`, `nama`, `created_at`, `updated_at`) VALUES
(1, '29', 'Cara Mewujudkan Perdamaian Dunia', '2020-06-22 23:17:07', '2020-06-22 23:17:07'),
(2, '22', 'Falsafah Kebangkitan Islam', '2020-06-22 23:17:07', '2020-06-22 23:17:07'),
(3, '34', '112 Tahun Khilafah Spiritual Ahmadiyah, Meneguhkan Kemanusiaan', '2020-06-22 23:17:33', '2020-06-22 23:17:33'),
(4, '24', 'Kisah Sahabat Rasulullah (Saw): Shuhaib Bin Sinan', '2020-06-22 23:17:33', '2020-06-22 23:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` bigint(20) NOT NULL,
  `berita_id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isi` longtext NOT NULL,
  `status` set('unread','read','active','inactive','rejected') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `berita_id`, `nama`, `email`, `isi`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Bayu Nurkholis', 'aaa@aaa.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active', '2020-06-16 10:24:58', '2020-06-16 10:24:58'),
(2, 2, 'Bayu Nurkholis', 'aaa@aaa.com', 'Komentar Kedua untuk Artikel Pertama', 'active', '2020-06-16 10:24:58', '2020-06-16 10:24:58'),
(3, 4, 'Anonymous', 'aaa@aaa.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active', '2020-06-19 05:55:20', '2020-06-19 05:55:20'),
(4, 2, 'Anonymous', 'bayu@aaa.com', 'Apa aja bolek halskdfospongafd', 'active', '2020-06-19 06:03:48', '2020-06-19 06:03:48'),
(5, 2, 'Apa Aja Boleh 1', 'lintangmukminati@yahoo.co.id', 'sfsdgdfghfghdfhgf', 'active', '2020-06-19 06:04:45', '2020-06-19 06:04:45'),
(6, 22, 'Anonymous', 'ssss@sss.com', 'sdfsfsdfsf', 'active', '2020-06-19 06:05:53', '2020-06-19 06:05:53'),
(7, 5, 'Anonymous', 'gue.pinokio@gmail.com', 'sdfsfsfsfsdfdsfsfsfs', 'active', '2020-06-19 06:06:38', '2020-06-19 06:06:38'),
(8, 3, 'Anonymous', 'aaa@aaa.com', 'Tanggapan untuk judul Artikel Ketiga, emang ga bisa cari judul yg panjanan dikkit napa', 'rejected', '2020-06-19 06:55:51', '2020-06-29 12:04:39'),
(9, 3, 'Anonymous', '', 'Macem-macem aaja judulnya haha..', 'rejected', '2020-06-19 07:38:48', '2020-06-30 04:01:56'),
(10, 22, 'Basket', 'sfd@sdf.com', 'Appan sih nih', 'inactive', '2020-06-19 09:35:59', '2020-06-30 04:01:41'),
(11, 13, 'Anonymous', '', 'Contoh komentar yang penting senang', 'unread', '2020-06-19 14:52:40', '2020-06-19 14:52:40'),
(12, 29, 'Anonymous', '', 'Testing memberi tanggapan, tau deh penting apa kaga', 'unread', '2020-06-25 07:48:26', '2020-06-29 11:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_05_27_044030_create_anggota_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` bigint(20) NOT NULL,
  `isi` varchar(255) NOT NULL,
  `start` timestamp NOT NULL DEFAULT current_timestamp(),
  `end` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `isi`, `start`, `end`, `created_at`, `updated_at`) VALUES
(1, 'Telah aktif portal mubayin baru Ahmadiyah Indonesia.', '2020-06-01 10:11:36', '2020-06-30 16:59:59', '2020-06-13 10:10:32', '2020-06-13 10:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL DEFAULT 'Anonymous',
  `email` varchar(255) DEFAULT NULL,
  `telp` varchar(255) NOT NULL,
  `pertanyaan` longtext NOT NULL,
  `status` set('unread','read') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pertanyaan`
--

INSERT INTO `pertanyaan` (`id`, `nama`, `email`, `telp`, `pertanyaan`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Anonymous', '', '0888777064653', 'Pertanyaan Pertama begitu menggoda, selanjutnya terserah anda', 'unread', '2020-06-23 08:07:33', '2020-06-23 08:07:33'),
(2, '', '', '081269681962', 'sdfsdfsdfdfgdshgsdgfg', 'unread', '2020-06-25 14:46:52', '2020-06-25 14:46:52'),
(3, '', '', '081269681962', 'sdfsadfsadfsafdasfd', 'unread', '2020-06-25 15:12:15', '2020-06-25 15:12:15');

-- --------------------------------------------------------

--
-- Table structure for table `testimoni`
--

CREATE TABLE `testimoni` (
  `id` bigint(20) NOT NULL,
  `cabang_id` int(11) DEFAULT NULL,
  `status` set('unread','active') NOT NULL DEFAULT 'unread',
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isi` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testimoni`
--

INSERT INTO `testimoni` (`id`, `cabang_id`, `status`, `nama`, `email`, `isi`, `created_at`, `updated_at`) VALUES
(1, 2, 'active', 'Bayu Nurkholis', 'aaa@aaa.com', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sollicitudin, lectus at ullamcorper ornare, magna mi rhoncus purus, nec malesuada tortor nibh et risus. Proin facilisis quis tortor ac porta. Fusce condimentum sagittis eros. In semper bibendum ligula, vitae hendrerit ipsum tristique quis. Integer volutpat hendrerit libero at euismod. Sed arcu leo, auctor volutpat accumsan et, sodales a nunc. Etiam hendrerit sit amet lacus quis varius. Phasellus sollicitudin vulputate neque in venenatis. Aenean venenatis lacinia elit, quis commodo nunc facilisis quis. Nunc blandit rhoncus ligula sit amet sollicitudin. Fusce condimentum ipsum orci, at auctor lectus tempor eu. Pellentesque porttitor feugiat blandit. Phasellus sagittis placerat mi vel vulputate. In aliquet, est et bibendum suscipit, dui quam mattis arcu, non tristique nibh elit vel elit.\r\n\r\nMauris ac diam nec ligula interdum blandit. Nam in placerat diam. Suspendisse vitae nisl nec mauris malesuada ullamcorper. Donec neque turpis, congue ut erat a, feugiat elementum leo. Aliquam erat volutpat. Pellentesque venenatis est ac arcu gravida, in varius lectus vestibulum. Nunc sed lectus vitae mi consectetur accumsan non ac purus. Etiam lacus neque, finibus a pulvinar a, consequat sit amet neque. Cras eleifend turpis velit, in feugiat nulla ornare eu. ', '2020-06-19 03:14:14', '2020-06-19 03:14:14'),
(2, 35, 'active', 'Anonymous', 'anonymous@aaa.com', ' Sed ex enim, dapibus in finibus ut, finibus eu lorem. Sed ut egestas velit. Phasellus malesuada, turpis in bibendum cursus, nibh ligula feugiat quam, sed faucibus lacus felis luctus nisl. Nullam sit amet quam congue, mollis nulla eu, sagittis nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean et erat vel turpis sollicitudin pharetra non non dolor. Pellentesque cursus sodales dolor non lobortis. Ut lacinia justo blandit enim fringilla, interdum scelerisque ligula sollicitudin. Donec vitae risus commodo, lacinia nulla vel, tristique justo. Ut quis porttitor felis. Mauris mauris turpis, tempus eu mi eget, iaculis bibendum quam. Quisque sit amet ex purus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris nibh tellus, commodo ut fringilla in, lacinia sit amet enim. Maecenas sit amet pellentesque turpis. Maecenas dapibus elit sit amet dolor consequat convallis sollicitudin mattis nunc.\r\n\r\nAenean dapibus dui eu mi vehicula, pretium euismod quam laoreet. Vestibulum dapibus lacus non mauris elementum placerat. Vestibulum ut elit at ligula elementum dictum ut sit amet enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed et eros sed nisl vulputate finibus id eu sapien. Pellentesque tempor id ex ac finibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse tincidunt eget ligula sed varius. Suspendisse rutrum sagittis enim, venenatis venenatis nibh varius id. ', '2020-06-19 03:14:14', '2020-06-19 03:14:14'),
(3, 29, 'active', 'FAFAFAFA', 'fafa@aaa.com', 'Nam convallis auctor lectus, eu sagittis nisi sodales ac. Curabitur ornare lobortis iaculis. Maecenas condimentum, metus sed bibendum tincidunt, ipsum enim dignissim lacus, ac faucibus purus nunc at mi. Mauris condimentum sodales arcu quis sodales. Phasellus commodo neque blandit, rutrum urna eget, rutrum metus. Nullam sollicitudin, sapien in elementum convallis, nibh neque finibus velit, a tristique purus turpis sit amet ligula. In hac habitasse platea dictumst. Curabitur molestie sodales hendrerit. Praesent egestas pellentesque eros. Nullam vitae leo quis massa viverra tincidunt. Quisque diam odio, dictum eu neque et, aliquet lacinia nisl. Nulla eget mauris in libero vestibulum iaculis in eget ex. Donec dapibus libero a urna tempor convallis. Ut eu orci egestas, rutrum diam vel, malesuada felis. Aenean mattis risus vel ligula vehicula, dapibus bibendum purus sodales. ', '2020-06-19 03:14:42', '2020-06-19 03:14:42'),
(4, 3, 'active', 'sdfsfsdfwef', 'sfd@sdf.com', 'sgfdhsergbdbdzfgwegf', '2020-06-24 03:10:21', '2020-06-24 03:10:21'),
(5, 4, 'unread', 'Apa Aja Boleh 1', 'sfd@sdf.com', 'sdfsfsfdsdfsdfsdfewf', '2020-06-24 03:11:22', '2020-06-24 03:11:22'),
(6, 4, 'unread', 'Smk Fadilah', 'aaa@aaa.com', 'sdfsadgfdsgesrgsg', '2020-06-24 03:11:59', '2020-06-24 03:11:59'),
(7, 4, 'unread', 'Smk Fadilah', 'sfd@sdf.com', 'sdfsfsafdsafdsfsf', '2020-06-25 04:18:32', '2020-06-25 04:18:32'),
(8, 6, 'unread', 'sdfsfsf', 'aaa@aaa.com', 'dfgdhgfhsfdgafdgdsg', '2020-06-25 04:19:37', '2020-06-25 04:19:37'),
(9, 6, 'unread', 'gffdgdfgdgfssfadfa', 'nurkholis.07@facebook.com', 'dfgsdgfaewdgsdgf', '2020-06-25 04:20:09', '2020-06-25 04:20:09'),
(10, 7, 'unread', 'gfdgdgdgdgfdg', 'depan@aaa.com', 'sdfgsagrggdgddgdg', '2020-06-25 04:20:42', '2020-06-25 04:20:42'),
(11, 20, 'unread', 'fdgdgdgdgdgdg', 'depan@aaa.com', 'dgdgdgdgdgdgdgdg', '2020-06-25 04:21:40', '2020-06-25 04:21:40'),
(12, 4, 'unread', 'fsfsfssf', 'sfd@sdf.com', 'sfsdffsfsfsfsdfsfsfsd', '2020-06-25 04:22:36', '2020-06-25 04:22:36'),
(13, 16, 'unread', 'sdfsdf', 'aaa@aaa.com', 'sdfsfdsdfasfsa', '2020-06-25 07:43:18', '2020-06-25 07:43:18'),
(14, 2, 'unread', 'dfsdfsdf', 'wwww@www.com', 'sdfsgdfgsdfgagf', '2020-06-25 07:44:09', '2020-06-25 07:44:09'),
(15, 15, 'unread', 'sfsdfsfsdfsf', 'aaa@aaa.com', 'sdsfsdfsdfsfsdfsdfsf', '2020-06-25 07:46:06', '2020-06-25 07:46:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` set('admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@aaa.com', '$2y$10$vzb/3nK2HlVnDG175Onu0e9Y9ou3yLVrNPlzyXUcCdjheztHicNqy', 'admin', NULL, '00IaG3lXiyNJK0hYSSIllRjX5BpyVahG4yq0Srn6K2XPJhWnYLGtzvxyqGCG', '2020-05-26 22:02:50', '2020-06-28 02:19:14'),
(2, 'administrator', 'aaa@aaa.com', '$2y$10$6a3i0lQ8NHpaVPcNRXfoF.KeMl/CH9jX4nnzWUEEBrFfdSgVJ37d6', 'admin', NULL, 'G8Py0jz5ctzfqrzjrrdafPaZafoHCCuRgcHLbCCLxcyouHqj4q4gMft0Z7fW', '2020-06-30 05:24:32', '2020-06-30 05:24:32');

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` bigint(20) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `count` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `ip`, `count`, `created_at`, `updated_at`) VALUES
(1, '192.168.100.10', 1, '2020-06-26 03:36:43', '2020-06-26 03:36:43'),
(3, '127.0.0.1', 1, '2020-06-26 03:36:43', '2020-06-26 08:05:21'),
(4, '192.168.100.5', 1, '2020-06-26 03:36:43', '2020-06-26 08:08:41'),
(5, '127.0.0.1', 1, '2020-06-27 03:27:40', '2020-06-27 03:27:40'),
(6, '127.0.0.1', 1, '2020-06-28 02:07:30', '2020-06-28 02:07:30'),
(7, '127.0.0.1', 1, '2020-06-29 02:42:31', '2020-06-29 02:42:31'),
(8, '127.0.0.1', 1, '2020-06-30 01:01:44', '2020-06-30 01:01:44');

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--

CREATE TABLE `wilayah` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wilayah`
--

INSERT INTO `wilayah` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Sumatera Utara-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(2, 'Sumatera Utara-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(3, 'Riau-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(4, 'Riau-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(5, 'Kep. Riau', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(6, 'Sumatera Barat-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(7, 'Sumatera Barat-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(8, 'Jambi', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(9, 'Sumatera Selatan', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(10, 'Bengkulu', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(11, 'Bangka Belitung', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(12, 'Lampung', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(13, 'Banten-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(14, 'Banten-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(15, 'DKI Jakarta', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(16, 'Jawa Barat-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(17, 'Jawa Barat-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(18, 'Jawa Barat-03', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(19, 'Jawa Barat-04', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(20, 'Jawa Barat-05', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(21, 'Jawa Barat-06', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(22, 'Jawa Barat-07', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(23, 'Jawa Barat-08', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(24, 'Jawa Barat-09', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(25, 'Jawa Barat-10', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(26, 'Jawa Barat-11', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(27, 'Jawa Tengah-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(28, 'Jawa Tengah-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(29, 'Jawa Tengah-03', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(30, 'Jawa Tengah-04', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(31, 'Jawa Tengah-05', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(32, 'DIY', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(33, 'Jawa Timur-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(34, 'Jawa Timur-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(35, 'Jawa Timur-03', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(36, 'Bali', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(37, 'Nusa Tenggara Barat', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(38, 'Nusa Tenggara Timur', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(39, 'Kalimantan Barat-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(40, 'Kalimantan Barat-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(41, 'Kalimantan Barat-03', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(42, 'Kalimantan Selatan', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(43, 'Kalimantan Tengah-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(44, 'Kalimantan Tengah-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(45, 'Kalimantan Timur-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(46, 'Kalimantan Timur-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(47, 'Kalimantan Timur-03', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(48, 'Sulawesi Selatan-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(49, 'Sulawesi Selatan-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(50, 'Sulawesi Selatan-03', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(51, 'Sulawesi Barat', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(52, 'Sulawesi Tenggara', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(53, 'Sulawesi Tengah', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(54, 'Sulawesi Utara-02', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(55, 'Sulawesi Utara-01', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(56, 'Gorontalo', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(57, 'Maluku', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(58, 'Maluku Utara', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(59, 'Papua', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(60, 'Papua Barat', '2020-06-08 08:40:41', '2020-06-08 08:40:41'),
(61, 'Markaz', '2020-06-08 08:40:41', '2020-06-08 08:40:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimoni`
--
ALTER TABLE `testimoni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cabang`
--
ALTER TABLE `cabang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
