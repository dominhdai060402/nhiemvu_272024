class Khachhang {
  final int tt;
  final String madiemdo;
  final String tenkhachhang;
  final String diachi;
  final String socongto;
  final String diachido;
  final String bochiso;
  final double chisocu;
  final double chisomoi;
  final int sl;
  final int hsn;

  Khachhang({
    required this.tt,
    required this.madiemdo,
    required this.tenkhachhang,
    required this.diachi,
    required this.socongto,
    required this.diachido,
    required this.bochiso,
    required this.chisocu,
    required this.chisomoi,
    required this.sl,
    required this.hsn,
  });

  factory Khachhang.fromJson(Map<String, dynamic> json) {
    return Khachhang(
      tt: json['Index'] as int,
      madiemdo: json['PointCode'] as String,
      tenkhachhang: json['Name'] as String,
      diachi: json['Address'] as String,
      socongto: json['ElectricityMeterNumber'] as String,
      diachido: json['SPAddress'] as String,
      bochiso: json['TimeOfUse'] as String,
      chisocu: (json['OldValue'] as num).toDouble(),
      chisomoi: (json['NewValue'] as num).toDouble(),
      sl: json['Consume'] as int,
      hsn: json['Term'] as int,
    );
  }

  // Phương thức copyWith để sao chép đối tượng với thuộc tính thay đổi
  Khachhang copyWith({
    int? tt,
    String? madiemdo,
    String? tenkhachhang,
    String? diachi,
    String? socongto,
    String? diachido,
    String? bochiso,
    double? chisocu,
    double? chisomoi,
    int? sl,
    int? hsn,
  }) {
    return Khachhang(
      tt: tt ?? this.tt,
      madiemdo: madiemdo ?? this.madiemdo,
      tenkhachhang: tenkhachhang ?? this.tenkhachhang,
      diachi: diachi ?? this.diachi,
      socongto: socongto ?? this.socongto,
      diachido: diachido ?? this.diachido,
      bochiso: bochiso ?? this.bochiso,
      chisocu: chisocu ?? this.chisocu,
      chisomoi: chisomoi ?? this.chisomoi,
      sl: sl ?? this.sl,
      hsn: hsn ?? this.hsn,
    );
  }
}
