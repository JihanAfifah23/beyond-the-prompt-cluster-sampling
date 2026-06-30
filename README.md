# Beyond the Prompt: Estimasi Intensitas Pemanfaatan ChatGPT dalam Aktivitas Intelektual Mahasiswa Statistika Universitas Mataram

<p align="center">

![R](https://img.shields.io/badge/Language-R-276DC3?logo=r&logoColor=white)
![Method](https://img.shields.io/badge/Method-Cluster%20Sampling-success)
![Survey](https://img.shields.io/badge/Analysis-Survey-orange)

</p>

---

# Deskripsi Proyek

Repository ini mendokumentasikan proses analisis survei mengenai **intensitas pemanfaatan ChatGPT dalam aktivitas intelektual mahasiswa Program Studi Statistika Universitas Mataram** menggunakan pendekatan **Cluster Sampling Dua Tahap (Two-Stage Cluster Sampling)**.

Analisis dilakukan menggunakan bahasa pemrograman **R**, meliputi pengolahan data, pengujian validitas dan reliabilitas instrumen, data cleaning, pembobotan sampel, serta evaluasi kualitas estimasi melalui perhitungan **Standard Error (SE)**, **Confidence Interval (CI)**, **Design Effect (DEFF)**, dan **Relative Standard Error (RSE)**.

Repository ini bertujuan menyajikan alur analisis yang terdokumentasi secara sistematis dan transparan sehingga dapat digunakan sebagai referensi dalam penerapan metode survei dan analisis data berbasis **Cluster Sampling**.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

## Struktur Repository

```text
Beyond-the-Prompt/
├── README.md
├── Executive_Summary.pdf
├── data/
│   └── Data_Mentah.xlsx
├── script/
│   └── Analisis_Cluster_Sampling.R
└── randomisasi/
    └── Hasil_Cluster.pdf
```

- **README.md** : Dokumentasi lengkap proyek.
- **Executive_Summary.pdf** : Ringkasan penelitian.
- **data/** : Berisi data mentah hasil survei.
- **script/** : Berisi seluruh script analisis menggunakan R.
- **randomisasi/** : Berisi hasil pemilihan klaster (kelas) yang terpilih.
  
<h1 id="daftar-isi"> Daftar Isi</h1>

- [Deskripsi Proyek](#deskripsi-proyek)
- [Struktur Repository](#struktur-repository)
- [Latar Belakang](#latar-belakang)
- [Tujuan Penelitian](#tujuan-penelitian)
- [Metodologi Penelitian](#metodologi-penelitian)
- [Alur Analisis](#alur-analisis)
- [Analisis Data](#analisis-data)
  - [1. Import Data](#1-import-data)
  - [2. Uji Validitas](#2-uji-validitas)
  - [3. Uji Reliabilitas](#3-uji-reliabilitas)
  - [4. Data Cleaning](#4-data-cleaning)
  - [5. Pembobotan Sampel](#5-pembobotan-sampel)
  - [6. Analisis Kualitas Estimasi](#6-analisis-kualitas-estimasi)
- [Hasil dan Pembahasan](#hasil-dan-pembahasan)
- [Kesimpulan](#kesimpulan)
- [Rekomendasi](#rekomendasi)
- [Referensi](#referensi)
- [Link Kuesioner](#link-kuesioner)

---

# Latar Belakang

Perkembangan **Artificial Intelligence (AI)**, khususnya **ChatGPT**, telah membawa perubahan dalam proses pembelajaran di perguruan tinggi. Mahasiswa memanfaatkan ChatGPT tidak hanya untuk memperoleh informasi, tetapi juga untuk memahami materi perkuliahan, menyelesaikan tugas, membantu analisis statistik, memperbaiki sintaks pemrograman, hingga mengevaluasi hasil pekerjaannya sendiri.

Bagi mahasiswa Program Studi Statistika, pemanfaatan ChatGPT memiliki relevansi yang lebih spesifik dibandingkan program studi lain, mengingat aktivitas perkuliahan di bidang ini sarat dengan pengolahan data, analisis statistik, dan pemrograman, di mana ChatGPT dapat digunakan baik sebagai alat bantu pemahaman konsep maupun penyelesaian tugas teknis. Kondisi ini memunculkan pertanyaan penting mengenai sejauh mana ketergantungan mahasiswa terhadap AI dalam proses berpikir dan menyelesaikan permasalahan statistik secara mandiri. Sayangnya, penelitian yang secara khusus mengukur intensitas pemanfaatan ChatGPT pada mahasiswa Statistika, khususnya di lingkungan Universitas Mataram, masih sangat terbatas, sehingga penelitian ini diharapkan dapat menjadi salah satu rujukan awal mengenai topik tersebut.


Meningkatnya pemanfaatan ChatGPT mendorong perlunya pengukuran secara kuantitatif mengenai intensitas penggunaannya di lingkungan akademik. Oleh karena itu, penelitian ini menggunakan pendekatan survei dengan desain **Cluster Sampling Dua Tahap** agar diperoleh estimasi yang representatif terhadap populasi mahasiswa Program Studi Statistika Universitas Mataram.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

# Tujuan Penelitian

Penelitian ini bertujuan untuk:

- Mengestimasi rata-rata intensitas pemanfaatan ChatGPT dalam aktivitas intelektual mahasiswa.
- Menguji validitas dan reliabilitas instrumen penelitian.
- Melakukan proses data cleaning sebelum analisis.
- Menghitung bobot sampel berdasarkan desain Cluster Sampling Dua Tahap.
- Mengestimasi rata-rata terbobot.
- Menghitung Standard Error (SE).
- Menghitung Confidence Interval (CI) 95%.
- Menghitung Design Effect (DEFF).
- Menghitung Relative Standard Error (RSE) sebagai indikator kualitas estimasi.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

# Metodologi Penelitian

Penelitian ini merupakan penelitian survei kuantitatif yang bertujuan mengestimasi intensitas pemanfaatan ChatGPT dalam aktivitas intelektual mahasiswa Program Studi Statistika Universitas Mataram. Pengambilan sampel dilakukan menggunakan metode Cluster Sampling Dua Tahap (Two-Stage Cluster Sampling), dengan kelas sebagai unit klaster pada tahap pertama.

Populasi penelitian terdiri atas enam kelas mahasiswa aktif Program Studi Statistika Universitas Mataram. Pada tahap pertama, dua kelas dipilih secara acak menggunakan fitur pengacakan pada Microsoft Excel sebagai klaster sampel. Selanjutnya, pada kedua klaster terpilih dilakukan pengambilan sampel mahasiswa menggunakan Simple Random Sampling (SRS) sehingga diperoleh 30 responden dari total 55 mahasiswa pada klaster terpilih. Pengumpulan data dilakukan melalui Google Form menggunakan kuesioner skala Likert 1–4 yang terdiri atas 12 butir pertanyaan mengenai intensitas pemanfaatan ChatGPT dalam aktivitas intelektual mahasiswa.

Sebelum pengumpulan data utama, instrumen penelitian terlebih dahulu diuji coba (pilot test) kepada 5 responden di luar sampel penelitian. Hasil uji coba digunakan untuk mengevaluasi validitas dan reliabilitas instrumen sehingga hanya butir pertanyaan yang memenuhi kriteria yang digunakan pada pengumpulan data utama.

Seluruh proses pengolahan data dilakukan menggunakan bahasa pemrograman R pada lingkungan RStudio. Tahapan analisis meliputi import data, uji validitas, uji reliabilitas, data cleaning (meliputi pemeriksaan missing value, data duplikat, dan outlier menggunakan metode Interquartile Range (IQR)), pembobotan sampel berdasarkan desain survei, serta analisis kualitas estimasi melalui perhitungan Standard Error (SE), Confidence Interval (CI) 95%, Design Effect (DEFF), dan Relative Standard Error (RSE).

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

# Alur Analisis

Analisis data dilakukan melalui tahapan berikut.

1. Import Data
2. Uji Validitas
3. Uji Reliabilitas
4. Data Cleaning
5. Pembobotan Sampel
6. Analisis Kualitas Estimasi
7. Hasil dan Pembahasan
8. Kesimpulan

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

# Analisis Data

Analisis data dilakukan menggunakan bahasa pemrograman **R** melalui beberapa tahapan, yaitu import data, uji validitas, uji reliabilitas, data cleaning, pembobotan sampel, dan analisis kualitas estimasi.

---

## 1. Import Data
### Tujuan

Tahap ini bertujuan untuk mengimpor data hasil survei ke dalam R, memilih variabel penelitian, mengubah tipe data menjadi numerik, serta menghitung skor total setiap responden sebagai dasar analisis selanjutnya.

### Sintaks

```r
# Install package (cukup dilakukan sekali)
install.packages("readxl")

# Memanggil package
library(readxl)

# Mengimpor data
data <- read_excel("data/Data_Mentah.xlsx")

# Memilih 12 item pertanyaan
item <- data[,6:17]

# Mengubah seluruh item menjadi numerik
item <- data.frame(lapply(item, function(x)
  as.numeric(as.character(x))))

# Menghitung skor total
skor_total <- rowSums(item)
```

### Keterangan

- `install.packages("readxl")` digunakan untuk menginstal package **readxl** (cukup dilakukan satu kali).
- `library(readxl)` digunakan untuk memanggil package **readxl**.
- `read_excel()` digunakan untuk mengimpor data survei dari file Excel.
- `data[,6:17]` digunakan untuk memilih 12 butir pertanyaan penelitian.
- `lapply()` digunakan untuk mengubah seluruh item menjadi bertipe numerik.
- `rowSums()` digunakan untuk menghitung skor total setiap responden.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

## 2. Uji Validitas

### Tujuan

Uji validitas dilakukan untuk mengetahui apakah setiap butir pertanyaan mampu mengukur konstruk penelitian menggunakan korelasi Pearson antara skor item dengan skor total.

### Sintaks

```r
for(i in 1:ncol(item)){

  hasil <- cor.test(item[,i], skor_total)

  cat("\n=========================\n")
  cat("Item :", colnames(item)[i], "\n")
  cat("r hitung =", round(hasil$estimate,3), "\n")
  cat("p-value =", round(hasil$p.value,4), "\n")

  if(hasil$p.value < 0.05){
    cat("Keputusan : VALID\n")
  } else{
    cat("Keputusan : TIDAK VALID\n")
  }

}
```

### Keterangan

- `for()` digunakan untuk menguji seluruh item secara otomatis.
- `cor.test()` digunakan untuk menghitung korelasi Pearson.
- `hasil$estimate` digunakan untuk memperoleh nilai **r hitung**.
- `hasil$p.value` digunakan untuk memperoleh nilai signifikansi.
- `if...else` digunakan untuk menentukan valid atau tidaknya setiap item.

*Catatan:* Sebelum diterapkan pada data utama, proses uji validitas yang sama telah dilakukan terlebih dahulu pada data pilot test (5 responden di luar sampel). Seluruh item pada pilot test menunjukkan p-value di bawah 0,001, sehingga dinyatakan valid.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

## 3. Uji Reliabilitas

### Tujuan

Uji reliabilitas dilakukan untuk mengetahui tingkat konsistensi internal instrumen menggunakan koefisien **Cronbach's Alpha**.

### Sintaks

```r
library(psych)

hasil_alpha <- alpha(item)

cat("\n=========================\n")
cat("HASIL UJI RELIABILITAS\n")
cat("=========================\n")

cat("Cronbach's Alpha =", round(hasil_alpha$total$raw_alpha,3), "\n")

if(hasil_alpha$total$raw_alpha >= 0.70){
  cat("Keputusan : RELIABEL\n")
}else{
  cat("Keputusan : TIDAK RELIABEL\n")
}
```

### Keterangan

- `library(psych)` digunakan untuk memanggil package **psych**.
- `alpha()` digunakan untuk menghitung nilai Cronbach's Alpha.
- `hasil_alpha$total$raw_alpha` digunakan untuk mengambil nilai Cronbach's Alpha.
- `if...else` digunakan untuk menentukan apakah instrumen reliabel atau tidak.

*Catatan:* Pengujian reliabilitas yang sama juga telah dilakukan pada data pilot test (5 responden), dengan hasil Cronbach's Alpha sebesar 0,938. Dengan demikian, instrumen dinyatakan layak digunakan tanpa revisi sebelum dilanjutkan ke pengumpulan data utama.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

## 4. Data Cleaning

### Tujuan

Data cleaning dilakukan untuk memastikan data yang digunakan dalam analisis memiliki kualitas yang baik melalui pemeriksaan struktur data, *missing value*, data duplikat, data outlier, serta ringkasan statistik.

### Sintaks

```r
# Cek struktur data
str(data)

# Cek jumlah missing value
colSums(is.na(data))

# Cek data duplikat
sum(duplicated(data))

# Menampilkan data duplikat
data[duplicated(data), ]

# Menghapus data duplikat
data <- data[!duplicated(data), ]

# Ringkasan data
summary(data)

# Cek outlier menggunakan boxplot pada skor total
boxplot(skor_total, main = "Boxplot Skor Total", ylab = "Skor Total")

# Mendeteksi outlier menggunakan metode IQR
Q1 <- quantile(skor_total, 0.25)
Q3 <- quantile(skor_total, 0.75)
IQR_val <- Q3 - Q1

batas_bawah <- Q1 - 1.5 * IQR_val
batas_atas  <- Q3 + 1.5 * IQR_val

outlier <- skor_total[skor_total < batas_bawah | skor_total > batas_atas]
outlier

# Menampilkan baris data yang terindikasi outlier
data[skor_total < batas_bawah | skor_total > batas_atas, ]
```

### Keterangan

- `str(data)` digunakan untuk melihat struktur dataset.
- `colSums(is.na(data))` digunakan untuk menghitung jumlah data yang hilang.
- `sum(duplicated(data))` digunakan untuk menghitung jumlah data duplikat.
- `data[duplicated(data), ]` digunakan untuk menampilkan data duplikat.
- `data <- data[!duplicated(data), ]` digunakan untuk menghapus data duplikat.
- `summary(data)` digunakan untuk menampilkan ringkasan statistik setiap variabel.
- `boxplot()` digunakan untuk memvisualisasikan sebaran skor total dan mengindikasi keberadaan outlier secara grafis.
- `quantile()` digunakan untuk menghitung kuartil 1 (Q1) dan kuartil 3 (Q3) dari skor total.
- Metode **IQR (Interquartile Range)** digunakan untuk mendeteksi outlier, yaitu nilai yang berada di bawah `Q1 - 1.5×IQR` atau di atas `Q3 + 1.5×IQR`.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

## 5. Pembobotan Sampel

### Tujuan

Pembobotan dilakukan untuk memperoleh bobot setiap responden berdasarkan peluang pemilihannya pada desain **Cluster Sampling Dua Tahap**, sehingga hasil estimasi dapat mewakili populasi.

### Sintaks

```r
M <- 6
m <- 2
N <- 55
n <- 30
nr <- 30

p1 <- m/M

p2 <- n/N

p_total <- p1*p2

w_base <- 1/p_total

F_NR <- n/nr

w_akhir <- w_base*F_NR
```

### Keterangan

- `M` menyatakan jumlah klaster dalam populasi.
- `m` menyatakan jumlah klaster yang dipilih.
- `N` menyatakan jumlah anggota pada klaster terpilih.
- `n` menyatakan jumlah sampel.
- `nr` menyatakan jumlah responden yang berhasil diwawancarai.
- `p1` menghitung peluang pemilihan tahap pertama.
- `p2` menghitung peluang pemilihan tahap kedua.
- `p_total` merupakan peluang pemilihan total.
- `w_base` merupakan bobot dasar.
- `F_NR` merupakan faktor penyesuaian non-respon.
- `w_akhir` merupakan bobot akhir yang digunakan pada analisis survei.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

## 6. Analisis Kualitas Estimasi

### Tujuan

Tahap ini bertujuan untuk mengestimasi rata-rata skor pemanfaatan ChatGPT menggunakan desain survei berbobot serta mengevaluasi kualitas estimasi melalui **Standard Error (SE)**, **Confidence Interval (CI)**, **Design Effect (DEFF)**, dan **Relative Standard Error (RSE)**.

### Sintaks

```r
library(survey)

data$Skor_Total <- rowSums(item)

data$bobot <- w_akhir

data$Kelas <- as.factor(data$Kelas)

desain <- svydesign(
  ids = ~Kelas,
  weights = ~bobot,
  data = data
)

hasil <- svymean(~Skor_Total, desain)

hasil

SE(hasil)

confint(hasil)

svymean(~Skor_Total, desain, deff = TRUE)

estimasi <- coef(hasil)

se <- SE(hasil)

RSE <- (se/estimasi)*100

RSE
```

### Keterangan

- `library(survey)` digunakan untuk memanggil package **survey**.
- `rowSums()` digunakan untuk menghitung skor total responden.
- `data$bobot` digunakan untuk menambahkan bobot akhir ke dalam dataset.
- `as.factor()` digunakan untuk mengubah variabel kelas menjadi identitas klaster.
- `svydesign()` digunakan untuk membentuk desain survei.
- `svymean()` digunakan untuk menghitung estimasi rata-rata terbobot.
- `SE()` digunakan untuk menghitung **Standard Error**.
- `confint()` digunakan untuk menghitung **Confidence Interval 95%**.
- `deff = TRUE` digunakan untuk menghitung **Design Effect (DEFF)**.
- `coef()` digunakan untuk mengambil nilai estimasi rata-rata.
- `RSE` digunakan untuk menghitung **Relative Standard Error**.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

# Hasil dan Pembahasan

Bagian ini menyajikan hasil analisis berdasarkan tahapan yang telah dilakukan, mulai dari pengujian instrumen, data cleaning, pembobotan sampel, hingga evaluasi kualitas estimasi menggunakan metode **Cluster Sampling Dua Tahap**.

---

## Hasil Uji Validitas

### Hasil

| Item | r hitung | p-value | Keputusan |
|:---:|:--------:|:-------:|:---------:|
| X1 | 0.762 | <0.001 | Valid |
| X2 | 0.716 | <0.001 | Valid |
| X3 | 0.711 | <0.001 | Valid |
| X4 | 0.654 | <0.001 | Valid |
| X5 | 0.790 | <0.001 | Valid |
| X6 | 0.785 | <0.001 | Valid |
| X7 | 0.701 | <0.001 | Valid |
| X8 | 0.763 | <0.001 | Valid |
| X9 | 0.664 | <0.001 | Valid |
| X10 | 0.762 | <0.001 | Valid |
| X11 | 0.729 | <0.001 | Valid |
| X12 | 0.770 | <0.001 | Valid |

### Interpretasi

Hasil uji validitas menunjukkan bahwa seluruh butir pertanyaan memiliki nilai **p-value < 0,05** dengan koefisien korelasi (*r hitung*) berkisar antara **0,654 hingga 0,790**. Dengan demikian seluruh item dinyatakan **valid**, sehingga mampu mengukur konstruk intensitas pemanfaatan ChatGPT sesuai tujuan penelitian.

Nilai korelasi yang relatif tinggi menunjukkan bahwa setiap butir pertanyaan memiliki hubungan yang kuat dengan skor total. Hal ini mengindikasikan bahwa instrumen telah mampu mengukur konstruk intensitas pemanfaatan ChatGPT secara konsisten pada responden penelitian.

---

## Hasil Uji Reliabilitas

### Hasil

| Cronbach's Alpha | Kriteria | Keputusan |
|:----------------:|:--------:|:---------:|
| **0.921** | ≥ 0.70 | Reliabel |

### Interpretasi

Nilai **Cronbach's Alpha sebesar 0,921** menunjukkan bahwa instrumen memiliki tingkat konsistensi internal yang sangat tinggi. Oleh karena itu seluruh butir pertanyaan dinyatakan **reliabel** dan layak digunakan dalam analisis selanjutnya.

Nilai Cronbach's Alpha yang melebihi 0,90 menunjukkan tingkat konsistensi internal yang sangat baik. Dengan demikian, instrumen layak digunakan untuk analisis lebih lanjut tanpa memerlukan penghapusan butir pertanyaan.

---

## Hasil Data Cleaning

### Hasil

| Pemeriksaan | Hasil |
|-------------|-------|
| Jumlah Responden | 30 |
| Missing Value | 0 |
| Data Duplikat | 0 |
| Outlier (Metode IQR) | 0 |
| Data Siap Dianalisis | 30 |

<img width="787" height="782" alt="image" src="https://github.com/user-attachments/assets/ba1bfd8f-951d-45b7-b6a1-b325c79378f0" />


### Interpretasi

Proses data cleaning menunjukkan bahwa tidak terdapat *missing value*, data duplikat, maupun data outlier pada dataset. Deteksi outlier menggunakan metode IQR (*Interquartile Range*) pada skor total menunjukkan seluruh nilai berada dalam rentang batas bawah dan batas atas yang wajar, sehingga tidak ada responden yang dikeluarkan dari analisis. Dengan demikian, seluruh 30 data responden memenuhi syarat untuk dianalisis lebih lanjut.

## Hasil Pembobotan Sampel

### Hasil

| Komponen | Nilai |
|----------|------:|
| Peluang Tahap 1 (P₁) | 0.3333 |
| Peluang Tahap 2 (P₂) | 0.5455 |
| Peluang Total | 0.1818 |
| Bobot Dasar | 5.50 |
| Faktor Non-Respon | 1.00 |
| Bobot Akhir | **5.50** |

### Interpretasi

Bobot akhir sebesar **5,50** menunjukkan bahwa setiap responden mewakili sekitar **5 hingga 6 mahasiswa** dalam populasi berdasarkan desain **Cluster Sampling Dua Tahap**. Karena seluruh responden berhasil diwawancarai, faktor penyesuaian non-respon bernilai **1**, sehingga bobot akhir sama dengan bobot dasar.

Pembobotan dilakukan untuk menyesuaikan peluang pemilihan responden pada desain Cluster Sampling Dua Tahap sehingga hasil estimasi dapat mewakili populasi mahasiswa pada klaster yang menjadi sasaran penelitian

## Hasil Analisis Kualitas Estimasi

### Hasil

| Indikator | Nilai |
|-----------|------:|
| Estimasi Rata-rata | **41.50** |
| Standard Error (SE) | **0.60** |
| Confidence Interval 95% | **40.324 – 42.676** |
| Design Effect (DEFF) | **0.552** |
| Relative Standard Error (RSE) | **1.446%** |

### Interpretasi

Estimasi rata-rata skor pemanfaatan ChatGPT sebesar **41,50** menunjukkan bahwa secara umum mahasiswa memiliki tingkat pemanfaatan ChatGPT yang tinggi dalam aktivitas intelektualnya.

Nilai **Standard Error (SE) sebesar 0,60** menunjukkan bahwa simpangan baku estimasi relatif kecil sehingga estimasi yang diperoleh cukup stabil.

Interval kepercayaan **95%** berada pada rentang **40,324 hingga 42,676**, yang berarti rata-rata populasi diperkirakan berada dalam interval tersebut.

Nilai **Design Effect (DEFF) sebesar 0,552 (< 1)** menunjukkan bahwa desain Cluster Sampling yang digunakan menghasilkan varians yang kecil. 

Nilai **Relative Standard Error (RSE) sebesar 1,446%** berada jauh di bawah batas **25%**, sehingga estimasi yang dihasilkan memiliki tingkat ketelitian yang sangat baik dan layak digunakan sebagai dasar penarikan kesimpulan.

Secara keseluruhan, indikator kualitas estimasi menunjukkan bahwa desain Cluster Sampling Dua Tahap memberikan hasil estimasi yang baik pada penelitian ini. Nilai DEFF yang lebih kecil dari 1 mengindikasikan bahwa varians estimasi kecil. Selain itu, nilai RSE yang jauh di bawah batas 25% menunjukkan bahwa estimasi yang diperoleh memiliki tingkat presisi yang tinggi sehingga hasil penelitian dapat dipercaya sebagai gambaran karakteristik populasi yang diteliti.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

# Kesimpulan

Berdasarkan hasil analisis menggunakan metode **Cluster Sampling Dua Tahap**, diperoleh beberapa kesimpulan sebagai berikut.

1. Seluruh butir pertanyaan dinyatakan **valid** berdasarkan hasil uji korelasi Pearson.

2. Instrumen penelitian memiliki tingkat reliabilitas yang sangat tinggi dengan nilai **Cronbach's Alpha sebesar 0,921**.

3. Hasil data cleaning menunjukkan tidak terdapat data hilang maupun data duplikat sehingga seluruh data layak dianalisis.

4. Bobot akhir setiap responden sebesar **5,50**, sesuai dengan peluang pemilihan pada desain Cluster Sampling Dua Tahap.

5. Estimasi rata-rata skor pemanfaatan ChatGPT sebesar **41,50** dengan **Standard Error sebesar 0,60** dan **Confidence Interval 95% sebesar 40,324–42,676**.

6. Nilai **Design Effect sebesar 0,552** serta **Relative Standard Error sebesar 1,446%** menunjukkan bahwa estimasi yang dihasilkan memiliki kualitas yang sangat baik dan tingkat ketelitian yang tinggi.

Secara keseluruhan, penelitian ini menunjukkan bahwa pemanfaatan ChatGPT oleh mahasiswa Program Studi Statistika Universitas Mataram tergolong tinggi, dan pendekatan **Cluster Sampling Dua Tahap** mampu menghasilkan estimasi yang baik berdasarkan indikator kualitas estimasi yang diperoleh.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---

## Rekomendasi

Berdasarkan temuan tersebut, beberapa rekomendasi taktis yang dapat diajukan adalah sebagai berikut.

Berdasarkan estimasi rata-rata skor pemanfaatan ChatGPT sebesar 41,50 yang tergolong tinggi dan mendekati nilai maksimal pada skala instrumen (lihat bagian Hasil Analisis Kualitas Estimasi), Program Studi Statistika Universitas Mataram direkomendasikan untuk menyusun pedoman tertulis mengenai batasan penggunaan AI pada pengerjaan tugas individu, khususnya untuk mata kuliah yang menuntut kemampuan analisis mandiri seperti Metode Statistika dan Praktikum Komputasi, serta mensosialisasikannya kepada mahasiswa pada awal semester berikutnya.

Selain itu, mengingat seluruh 12 butir instrumen penelitian mencakup aspek pemanfaatan ChatGPT mulai dari pemahaman materi, penyelesaian tugas, hingga perbaikan sintaks pemrograman (lihat bagian Hasil Uji Validitas), program studi direkomendasikan untuk mengintegrasikan minimal satu sesi materi literasi AI berdurasi 2–3 jam ke dalam mata kuliah pengantar di semester awal, dengan fokus pada cara memverifikasi keakuratan output AI dalam perhitungan dan interpretasi statistik.

<p align="right">
<a href="#daftar-isi">⬆️ Kembali ke Daftar Isi</a>
</p>

---


# Referensi

1. Lohr, S. L. (2022). *Sampling: Design and Analysis* (3rd ed.). CRC Press. ISBN: 9781032244287.

2. Lumley, T. (2010). *Complex Surveys: A Guide to Analysis Using R*. John Wiley & Sons. https://doi.org/10.1002/9780470580063

3. R Core Team. (2025). *R: A Language and Environment for Statistical Computing*. R Foundation for Statistical Computing. https://www.R-project.org/

4. Revelle, W. (2025). *psych: Procedures for Psychological, Psychometric, and Personality Research* (R package). Northwestern University. https://CRAN.R-project.org/package=psych

5. Lumley, T. (2024). *survey: Analysis of Complex Survey Samples* (R package). https://CRAN.R-project.org/package=survey

6. Wickham, H., & Bryan, J. (2025). *readxl: Read Excel Files* (R package). https://CRAN.R-project.org/package=readxl

# Link Kuesioner

Kuesioner penelitian dapat diakses melalui tautan berikut.

🔗 https://docs.google.com/forms/d/e/1FAIpQLSdYni0kyhtAElpeC0CwCdPTVU--VT71eH3ls--pdMDR_FI4ew/viewform?usp=header
