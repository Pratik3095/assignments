import 'package:assignment/app/models/UserListModel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class UsersDataSource extends DataGridSource {
  final List userData;

  UsersDataSource({
    required this.userData,
  }) {
    _devicesData = userData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<num>(columnName: 'index', value: e['id']!.toInt()),
              DataGridCell<String>(
                  columnName: 'image', value: e['image'] ?? ''),
              DataGridCell<String>(
                  columnName: 'fullname',
                  value: "${e['firstName']} ${e['lastName']}" ?? ''),
              DataGridCell<String>(columnName: 'phone', value: e['phone']),
              DataGridCell<String>(
                  columnName: 'address', value: e['address']['address']),
              DataGridCell<String>(
                  columnName: 'companyname', value: e['company']['name']),
              DataGridCell<String>(
                  columnName: 'designation', value: e['company']['title']),
              DataGridCell<String>(
                  columnName: 'location',
                  value: e['company']['address']['address']),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _devicesData = [];

  @override
  List<DataGridRow> get rows => _devicesData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        if (e.columnName == 'image') {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
              e.value.toString(),
            ),
          );
        }
        return Container(
          alignment: Alignment.center,
          // padding: const EdgeInsets.all(5.0),
          child: Text(
            e.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}
