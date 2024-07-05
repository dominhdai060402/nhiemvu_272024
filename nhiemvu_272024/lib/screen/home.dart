import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nhiemvu_272024/bloc/customer_bloc.dart';
import 'package:nhiemvu_272024/bloc/customer_event.dart';
import 'package:nhiemvu_272024/bloc/customer_state.dart';
import 'package:nhiemvu_272024/components/customer_data_table.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerBloc()..add(FetchCustomerData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test Data'),
        ),
        body: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is CustomerLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CustomerError) {
              return Center(child: Text(state.message));
            } else if (state is CustomerLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: CustomerDataTable(
                        customerList: state.customerList,
                        onValueChanged: (index, newValue) {
                          context.read<CustomerBloc>().add(UpdateCustomerData(index, newValue));
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<CustomerBloc>().add(FetchCustomerData());
                        },
                        child: const Text('Load Data'),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text('No data loaded'));
            }
          },
        ),
      ),
    );
  }
}
