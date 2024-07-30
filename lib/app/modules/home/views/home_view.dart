import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Employees',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                'https://pixel6.co/wp-content/themes/new-pixel6-wp/assets/images/Pixel6.png'),
          ),
          centerTitle: true,
          leadingWidth: 100,
          backgroundColor: Colors.black,
        ),
        body: _.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Obx(() => SfDataGrid(
                      source: _.usersListDataSource.value!,
                      columnWidthMode: ColumnWidthMode.fill,
                      allowSorting: true,
                      allowFiltering: true,
                      columns: <GridColumn>[
                        GridColumn(
                            allowFiltering: false,
                            allowSorting: false,
                            columnName: 'index',
                            width: 50,
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'ID',
                                ))),
                        GridColumn(
                            columnName: 'image',
                            width: 150,
                            label: Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Image',
                                ))),
                        GridColumn(
                            width: 150,
                            columnName: 'fullname',
                            label: Container(
                                padding: EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text('Name'))),
                        GridColumn(
                            columnName: 'phone',
                            label: Container(
                                padding: EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Phone No.',
                                  overflow: TextOverflow.ellipsis,
                                ))),
                        GridColumn(
                            columnName: 'address',
                            label: Container(
                                padding: EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text('Address'))),
                        GridColumn(
                            columnName: 'companyname',
                            label: Container(
                                padding: EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text('Company Name'))),
                        GridColumn(
                            columnName: 'designation',
                            label: Container(
                                padding: EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text('Designation'))),
                        GridColumn(
                            columnName: 'location',
                            width: 200,
                            label: Container(
                                padding: EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text('Company Location')))
                      ],
                    )),
              ),
      );
    });
  }
}
