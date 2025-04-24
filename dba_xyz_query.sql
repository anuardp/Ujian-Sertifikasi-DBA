-- Isi Data Kategori
INSERT INTO kategori (nama_kategori, deskripsi) VALUES
('Elektronik', 'Produk-produk elektronik seperti laptop, smartphone, dll.'),
('Pakaian', 'Berbagai jenis pakaian pria dan wanita.'),
('Makanan', 'Produk makanan ringan dan berat.');

-- Isi Data Produk
INSERT INTO produk (nama_produk, harga, stok, kategori_id) VALUES
('Laptop Lenovo', 8500000.00, 10, 1),
('Smartphone Samsung', 5500000.00, 15, 1),
('Kaos Polos', 75000.00, 100, 2),
('Celana Jeans', 180000.00, 50, 2),
('Nasi Goreng Instan', 12000.00, 200, 3),
('Kopi Hitam Sachet', 2500.00, 500, 3);

-- Trigger: Update stok secara otomatis
DELIMITER //

CREATE TRIGGER update_stok_otomatis
AFTER INSERT ON transaksi
FOR EACH ROW
BEGIN
    IF NEW.jenis_transaksi = 'penjualan' THEN
        UPDATE produk
        SET stok = stok - NEW.jumlah
        WHERE produk_id = NEW.produk_id;
    ELSEIF NEW.jenis_transaksi = 'pembelian' THEN
        UPDATE produk
        SET stok = stok + NEW.jumlah
        WHERE produk_id = NEW.produk_id;
    END IF;
END;
//

DELIMITER ;


-- Penjualan: 2 unit Kaos Polos (stok berkurang)
INSERT INTO transaksi (produk_id, jumlah, total_harga, jenis_transaksi)
VALUES (3, 2, 150000.00, 'penjualan');

-- Pembelian: Restok 5 unit Nasi Goreng Instan (stok bertambah)
INSERT INTO transaksi (produk_id, jumlah, total_harga, jenis_transaksi)
VALUES (5, 5, 60000.00, 'pembelian');