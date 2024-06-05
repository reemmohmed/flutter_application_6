import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/helpers/SqlHelper.dart';
import 'package:flutter_application_6/models/catogery-data.dart';
import 'package:flutter_application_6/pages/category_ops_page.dart';
import 'package:get_it/get_it.dart';

class Categerase extends StatefulWidget {
  const Categerase({super.key});

  @override
  State<Categerase> createState() => _CategeraseState();
}

class _CategeraseState extends State<Categerase> {
  List<CatogeryData>? Categerase;
  @override
  void intState() {
    getCategerase();
    super.initState();
  }

  void getCategerase() async {
    try {
      var squlHelper = GetIt.I.get<SqlHelper>();
      var data = await squlHelper.db!.query('Categerase');
      for (var item in data) {
        Categerase ??= [];
        Categerase!.add(CatogeryData.fromJason(item));
      }

      if (data.isNotEmpty) {
      } else {
        Categerase = [];
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text('Errot in get data')));
      setState(() {});
      Categerase = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categerese'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CategoryOpsPage()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: PaginatedDataTable2(
          border: TableBorder.all(),
          headingTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
          headingRowColor:
              WidgetStatePropertyAll(Theme.of(context).primaryColor),
          renderEmptyRowsInTheEnd: false,
          isHorizontalScrollBarVisible: true,
          minWidth: 600,
          columnSpacing: 20,
          horizontalMargin: 20,
          wrapInCard: false,
          rowsPerPage: 15,
          columns: const [
            DataColumn(label: Text('id')),
            DataColumn(label: Text('name')),
            DataColumn(label: Text('descraption')),
          ],
          source: MyDataTableSource()),
    );
  }
}

class MyDataTableSource extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        DataCell(Text('id')),
        DataCell(Text('name')),
        DataCell(Text('descraption')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 25;

  @override
  int get selectedRowCount => 0;
}
