import 'package:equatable/equatable.dart';
import 'package:nhiemvu_272024/model/khachhang.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final List<Khachhang> customerList;

  const CustomerLoaded({required this.customerList});

  @override
  List<Object> get props => [customerList];
}

class CustomerError extends CustomerState {
  final String message;

  const CustomerError({required this.message});

  @override
  List<Object> get props => [message];
}
