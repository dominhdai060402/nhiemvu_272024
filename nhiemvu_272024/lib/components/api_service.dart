import 'package:dio/dio.dart';
import 'package:nhiemvu_272024/model/khachhang.dart';

class ApiService {
  static final Dio _dio = Dio();

  static Future<List<Khachhang>> fetchDataFromApi() async {
    try {
      // Dữ liệu yêu cầu
      Map<String, dynamic> requestData = {
        "Term": "1",
        "SaveDate": "06-2024",
        "FigureBookId": "5592"
      };

      // Gửi yêu cầu POST đến API
      final response = await _dio.post(
        'http://113.160.216.106:8080/Index/GetData_AddIndex_ValueJS',
        data: requestData,
      );

      // Xử lý dữ liệu nhận được từ API
      List<dynamic> handOnTableObject = response.data['model']['HandOnTableObject'];

      // Chuyển đổi danh sách JSON thành danh sách các đối tượng Khachhang
      List<Khachhang> khachhangList = handOnTableObject.map((item) => Khachhang.fromJson(item)).toList();

      // Trả về danh sách các đối tượng Khachhang từ API
      return khachhangList;
    } catch (e) {
      // Xử lý lỗi
      throw 'Failed to load data: $e';
    }
  }
}