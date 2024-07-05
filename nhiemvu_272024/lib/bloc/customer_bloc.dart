import 'package:bloc/bloc.dart';
import 'package:nhiemvu_272024/bloc/customer_event.dart';
import 'package:nhiemvu_272024/bloc/customer_state.dart';
import 'package:nhiemvu_272024/components/api_service.dart';
import 'package:nhiemvu_272024/model/khachhang.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(CustomerInitial()) {
    // Đăng ký các bộ xử lý sự kiện
    on<FetchCustomerData>(_onFetchCustomerData);
    on<UpdateCustomerData>(_onUpdateCustomerData);
  }

  // Bộ xử lý cho sự kiện FetchCustomerData
  Future<void> _onFetchCustomerData(FetchCustomerData event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      final List<Khachhang> customerList = await ApiService.fetchDataFromApi();
      emit(CustomerLoaded(customerList: customerList));
    } catch (e) {
      emit(CustomerError(message: e.toString()));
    }
  }

  // Bộ xử lý cho sự kiện UpdateCustomerData
  void _onUpdateCustomerData(UpdateCustomerData event, Emitter<CustomerState> emit) {
    if (state is CustomerLoaded) {
      final loadedState = state as CustomerLoaded;
      final List<Khachhang> updatedList = List.from(loadedState.customerList);
      final updatedCustomer = updatedList[event.index].copyWith(chisomoi: event.newValue);

      updatedList[event.index] = updatedCustomer;
      emit(CustomerLoaded(customerList: updatedList));

      // Optional: Call API to update customer data on the server
      // await ApiService.updateKhachhang(updatedCustomer);
    }
  }
}
