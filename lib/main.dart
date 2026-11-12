
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ===============================
// 1. ỨNG DỤNG CHÍNH
// ===============================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab F5',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0468D7),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// ===============================
// 2. MODEL SẢN PHẨM
// ===============================

class SanPham {
  final String ten;
  final String moTa;
  final int gia;
  final String anh;

  const SanPham({
    required this.ten,
    required this.moTa,
    required this.gia,
    required this.anh,
  });
}

// ===============================
// 3. DỮ LIỆU SẢN PHẨM
// ===============================

final List<SanPham> duLieuMau = [
  const SanPham(
    ten: 'Áo thun VHU',
    moTa: 'Cotton 100%, in logo trường',
    gia: 180000,
    anh: 'assets/images/p1.jpg',
  ),
  const SanPham(
    ten: 'Bình giữ nhiệt',
    moTa: 'Inox 500ml, giữ nóng 6 giờ',
    gia: 250000,
    anh: 'assets/images/p2.jpg',
  ),
  const SanPham(
    ten: 'Sổ tay sinh viên',
    moTa: '200 trang, bìa cứng',
    gia: 75000,
    anh: 'assets/images/p3.jpg',
  ),
  const SanPham(
    ten: 'Balo laptop',
    moTa: 'Chống nước, ngăn 15.6 inch',
    gia: 420000,
    anh: 'assets/images/p4.jpg',
  ),
  const SanPham(
    ten: 'Móc khóa gỗ',
    moTa: 'Khắc laser tên trường',
    gia: 35000,
    anh: 'assets/images/p5.jpg',
  ),
  const SanPham(
    ten: 'Cốc sứ in hình',
    moTa: 'Dung tích 350ml',
    gia: 95000,
    anh: 'assets/images/p6.jpg',
  ),
];

// ===============================
// 4. ĐỊNH DẠNG GIÁ
// ===============================

String dinhDangGia(int gia) {
  final s = gia.toString();
  final buf = StringBuffer();

  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) {
      buf.write('.');
    }
    buf.write(s[i]);
  }

  return '${buf.toString()} đ';
}

// ===============================
// 5. MÀN HÌNH CHÍNH
// ===============================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tab == 0 ? 'Danh sách sản phẩm' : 'Album ảnh',
        ),
      ),
      body: _tab == 0
          ? const ProductListTab()
          : const AlbumTab(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (index) {
          setState(() {
            _tab = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Danh sách',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view),
            label: 'Lưới',
          ),
        ],
      ),
    );
  }
}

// ===============================
// 6. TAB DANH SÁCH + NC3
// ===============================

class ProductListTab extends StatefulWidget {
  const ProductListTab({super.key});

  @override
  State<ProductListTab> createState() =>
      _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  final List<SanPham> _ds = List.of(duLieuMau);

  int _dem = 0;

  // THÊM SẢN PHẨM
  void _them() {
    setState(() {
      _dem++;

      _ds.insert(
        0,
        SanPham(
          ten: 'Sản phẩm mới $_dem',
          moTa: 'Sản phẩm vừa được thêm vào danh sách',
          gia: 50000 * _dem,
          anh: 'assets/images/p1.jpg',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // HIỂN THỊ KHI DANH SÁCH TRỐNG
    if (_ds.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              size: 70,
              color: Colors.grey,
            ),
            const SizedBox(height: 12),
            const Text(
              'Danh sách trống',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _them,
              icon: const Icon(Icons.add),
              label: const Text('Thêm sản phẩm'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _ds.length,

        itemBuilder: (context, index) {
          final sp = _ds[index];

          print('Đang tạo item: $index');

          return Dismissible(
            // KEY RIÊNG CHO TỪNG SẢN PHẨM
            key: ValueKey(sp.ten),

            direction: DismissDirection.endToStart,

            // NỀN ĐỎ KHI VUỐT XÓA
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              color: Colors.red,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            ),

            // =========================
            // NC3: HOÀN TÁC SAU KHI XÓA
            // =========================

            onDismissed: (direction) {
              final int viTri = index;
              final SanPham sanPhamDaXoa = sp;

              // XÓA SẢN PHẨM
              setState(() {
                _ds.removeAt(viTri);
              });

              // ĐÓNG SNACKBAR CŨ
              ScaffoldMessenger.of(context)
                  .hideCurrentSnackBar();

              // HIỂN THỊ SNACKBAR HOÀN TÁC
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Đã xóa ${sanPhamDaXoa.ten}',
                  ),
                  duration: const Duration(seconds: 4),
                  behavior: SnackBarBehavior.floating,

                  action: SnackBarAction(
                    label: 'HOÀN TÁC',
                    onPressed: () {
                      setState(() {
                        if (viTri <= _ds.length) {
                          _ds.insert(
                            viTri,
                            sanPhamDaXoa,
                          );
                        } else {
                          _ds.add(sanPhamDaXoa);
                        }
                      });
                    },
                  ),
                ),
              );
            },

            // GIAO DIỆN SẢN PHẨM
            child: Card(
              margin: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              child: ListTile(
                leading: AnhSanPham(
                  duongDan: sp.anh,
                  kichThuoc: 56,
                ),
                title: Text(
                  sp.ten,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  sp.moTa,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  dinhDangGia(sp.gia),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Bạn chọn: ${sp.ten}'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),

      // NÚT THÊM SẢN PHẨM
      floatingActionButton: FloatingActionButton(
        onPressed: _them,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ===============================
// 7. TAB GRIDVIEW
// ===============================

class AlbumTab extends StatelessWidget {
  const AlbumTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.78,
      ),
      itemCount: duLieuMau.length,

      itemBuilder: (context, index) {
        final sp = duLieuMau[index];

        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: AnhSanPham(
                  duongDan: sp.anh,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sp.ten,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dinhDangGia(sp.gia),
                      style: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ===============================
// 8. WIDGET HIỂN THỊ ẢNH
// ===============================

class AnhSanPham extends StatelessWidget {
  final String duongDan;
  final double? kichThuoc;

  const AnhSanPham({
    super.key,
    required this.duongDan,
    this.kichThuoc,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      duongDan,
      width: kichThuoc,
      height: kichThuoc,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: kichThuoc,
          height: kichThuoc,
          color: Colors.grey.shade300,
          child: const Icon(
            Icons.image_not_supported,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
