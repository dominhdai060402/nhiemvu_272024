import 'package:equatable/equatable.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class FetchCustomerData extends CustomerEvent {}

class UpdateCustomerData extends CustomerEvent {
  final int index;
  final double newValue;

  const UpdateCustomerData(this.index, this.newValue);

  @override
  List<Object> get props => [index, newValue];
}
