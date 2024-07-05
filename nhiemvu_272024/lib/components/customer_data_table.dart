import 'package:flutter/material.dart';
import 'package:nhiemvu_272024/model/khachhang.dart';

class CustomerDataTable extends StatefulWidget {
  final List<Khachhang> customerList;
  final void Function(int index, double newValue) onValueChanged;

  const CustomerDataTable({
    required this.customerList,
    required this.onValueChanged,
    Key? key,
  }) : super(key: key);

  @override
  _CustomerDataTableState createState() => _CustomerDataTableState();
}

class _CustomerDataTableState extends State<CustomerDataTable> {
  late List<Khachhang> _customerList;

  @override
  void initState() {
    super.initState();
    _customerList = List.from(widget.customerList);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('TT SGCS')),
          DataColumn(label: Text('Mã điểm đo')),
          DataColumn(label: Text('Tên khách hàng')),
          DataColumn(label: Text('Địa chỉ KH')),
          DataColumn(label: Text('Số công tơ')),
          DataColumn(label: Text('Địa chỉ điểm do')),
          DataColumn(label: Text('Bộ chỉ số')),
          DataColumn(label: Text('Chỉ số cũ')),
          DataColumn(label: Text('Chỉ số mới')),
          DataColumn(label: Text('SL +/-')),
          DataColumn(label: Text('HSN')),
          DataColumn(label: Text('Sản lượng')),
        ],
        rows: _customerList.asMap().entries.map((entry) {
          int index = entry.key;
          Khachhang khachhang = entry.value;
          double sanLuong = khachhang.chisomoi - khachhang.chisocu;

          return DataRow(cells: [
            DataCell(
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 30),
                child: Text(
                  khachhang.tt.toString(),
                  softWrap: true,
                ),
              ),
            ),
            DataCell(Text(khachhang.madiemdo)),
            DataCell(
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Text(
                  khachhang.tenkhachhang,
                  softWrap: true,
                ),
              ),
            ),
            DataCell(Text(khachhang.diachi)),
            DataCell(Text(khachhang.socongto)),
            DataCell(Text(khachhang.diachido)),
            DataCell(
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 30),
                child: Text(
                  khachhang.bochiso,
                  softWrap: true,
                ),
              ),
            ),
            DataCell(
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 40),
                child: Text(
                  khachhang.chisocu.toString(),
                  softWrap: true,
                ),
              ),
            ),
            DataCell(
              TextField(
                controller: TextEditingController(text: khachhang.chisomoi.toString()),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  double? newValue = double.tryParse(value);
                  if (newValue != null) {
                    setState(() {
                      _customerList[index] = khachhang.copyWith(chisomoi: newValue);
                      widget.onValueChanged(index, newValue);
                    });
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                ),
              ),
            ),
            DataCell(
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 20),
                child: Text(
                  khachhang.sl.toString(),
                  softWrap: true,
                ),
              ),
            ),
            DataCell(Text(khachhang.hsn.toString())),
            DataCell(Text(sanLuong.toString())),
          ]);
        }).toList(),
      ),
    );
  }
}
