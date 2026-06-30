# Panggil paket
library(readxl)

# Import data
data <- read_excel("C:/Users/asus/Downloads/Formulir tanpa judul (Jawaban) (1).xlsx")
# Ambil kolom item (sesuaikan)
item <- data[, 6:17]

# Ubah menjadi numerik
item <- data.frame(lapply(item, function(x) as.numeric(as.character(x))))

# Hitung skor total
skor_total <- rowSums(item)

#1. Uji validitas
for(i in 1:ncol(item)){
  hasil <- cor.test(item[,i], skor_total)
  
  cat("\n=========================\n")
  cat("Item:", colnames(item)[i], "\n")
  cat("r hitung =", round(hasil$estimate,3), "\n")
  cat("p-value =", round(hasil$p.value,4), "\n")
  
  if(hasil$p.value < 0.05){
    cat("Keputusan : VALID\n")
  } else {
    cat("Keputusan : TIDAK VALID\n")
  }
}
# ==========================
#2. UJI RELIABILITAS
# ==========================z
hasil_alpha <- alpha(item)

cat("\n=========================\n")
cat("HASIL UJI RELIABILITAS\n")
cat("=========================\n")

cat("Cronbach's Alpha =", round(hasil_alpha$total$raw_alpha,3), "\n")

if(hasil_alpha$total$raw_alpha >= 0.70){
  cat("Keputusan : RELIABEL\n")
} else {
  cat("Keputusan : TIDAK RELIABEL\n")
}
#3. Cleaning==========
# Cek struktur data
str(data)

# Cek jumlah data yang kosong (missing value)
colSums(is.na(data))

# Cek jumlah baris yang duplikat
sum(duplicated(data))

# Tampilkan data yang duplikat (jika ada)
data[duplicated(data), ]

# Menghapus data duplikat (jika diperlukan)
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

#4. Pembobotan================
# Data
M <- 6      # Total kelas
m <- 2      # Kelas yang dipilih
N <- 55     # Total mahasiswa pada 2 kelas terpilih
n <- 30     # Jumlah sampel
nr <- 30    # Jumlah responden yang berhasil diwawancarai

# Peluang pemilihan tahap 1
p1 <- m / M

# Peluang pemilihan tahap 2
p2 <- n / N

# Peluang pemilihan total
p_total <- p1 * p2

# Bobot dasar
w_base <- 1 / p_total

# Faktor penyesuaian non-respon
F_NR <- n / nr

# Bobot akhir
w_akhir <- w_base * F_NR

# Tampilkan hasil
cat("Peluang Tahap 1 =", round(p1,4), "\n")
cat("Peluang Tahap 2 =", round(p2,4), "\n")
cat("Peluang Total =", round(p_total,4), "\n")
cat("Bobot Dasar =", round(w_base,2), "\n")
cat("Faktor Non-Respon =", round(F_NR,2), "\n")
cat("Bobot Akhir =", round(w_akhir,2), "\n")


#5. Analisis dan Kualitas========
library(survey)

# Skor total 12 item
data$Skor_Total <- rowSums(item)

# Bobot akhir
data$bobot <- w_akhir

# Ubah Kelas menjadi faktor
data$Kelas <- as.factor(data$Kelas)

# Desain survei
desain <- svydesign(
  ids = ~Kelas,
  weights = ~bobot,
  data = data
)

# Estimasi rata-rata terbobot
hasil <- svymean(~Skor_Total, desain)
hasil

# Standard Error
SE(hasil)

# Confidence Interval 95%
confint(hasil)

# Design Effect
svymean(~Skor_Total, desain, deff = TRUE)

# Relative Standard Error
estimasi <- coef(hasil)
se <- SE(hasil)
RSE <- (se/estimasi) * 100
RSE

