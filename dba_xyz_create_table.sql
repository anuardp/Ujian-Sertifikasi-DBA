-- Tabel Kategori
CREATE TABLE kategori (
    kategori_id INT PRIMARY KEY AUTO_INCREMENT,
    nama_kategori VARCHAR(100) NOT NULL,
    deskripsi TEXT
);

-- Tabel Produk
CREATE TABLE produk (
    produk_id INT PRIMARY KEY AUTO_INCREMENT,
    nama_produk VARCHAR(100) NOT NULL,
    harga DECIMAL(10,2) NOT NULL,
    stok INT NOT NULL,
    kategori_id INT,
    FOREIGN KEY (kategori_id) REFERENCES kategori(kategori_id)
);

-- Tabel Transaksi dengan jenis_transaksi
CREATE TABLE transaksi (
    transaksi_id INT PRIMARY KEY AUTO_INCREMENT,
    tanggal DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    produk_id INT,
    jumlah INT NOT NULL,
    total_harga DECIMAL(10,2) NOT NULL,
    jenis_transaksi ENUM('penjualan', 'pembelian') DEFAULT 'penjualan',
    FOREIGN KEY (produk_id) REFERENCES produk(produk_id)
);