import 'package:flutter/material.dart';

import 'package:flutter_application_6/helpers/SqlHelper.dart';
import 'package:flutter_application_6/pages/categerase.dart';
import 'package:flutter_application_6/pages/widgets/grid_view_item.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  bool isTableIntilized = false;
  @override
  void initState() {
    intilizeTables();
    super.initState();
  }

  void intilizeTables() async {
    var sqlHelper = GetIt.I.get<SqlHelper>();
    isTableIntilized = await sqlHelper.createTables();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Eys pos',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              // لتعغير حجم loding

                              child: isLoading
                                  ? Transform.scale(
                                      scale: .5,
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: isTableIntilized
                                          ? Colors.green
                                          : Colors.red,
                                      radius: 10,
                                    ),
                            ),

                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 10),
                            //   child: isLoading
                            //       ? Transform.scale(
                            //           scale: .5,
                            //           child: CircularProgressIndicator(
                            //             color: Colors.white,
                            //           ),
                            //         )
                            //       : CircleAvatar(
                            //           backgroundColor: isTableIntilized
                            //               ? Colors.green
                            //               : Colors.red,
                            //           radius: 10,
                            //         ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        headerItem('Exchange rate', '1EUR =11.712.5 UZS'),
                        headerItem('Today \'s sales ', '111.0.000.00 UZS'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                color: const Color(0xfffbafb),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    GridViewItem(
                      color: Colors.orangeAccent,
                      iconData: Icons.calculate,
                      labe: 'ALL Sales',
                      onpressed: () {},
                    ),
                    GridViewItem(
                      color: Colors.pink,
                      iconData: Icons.inventory_2,
                      labe: 'Prductes',
                      onpressed: () {},
                    ),
                    GridViewItem(
                      color: Colors.lightBlue,
                      iconData: Icons.group,
                      labe: 'Clintes',
                      onpressed: () {},
                    ),
                    GridViewItem(
                      color: Colors.green,
                      iconData: Icons.point_of_sale,
                      labe: 'New Sale',
                      onpressed: () {},
                    ),
                    GridViewItem(
                      color: Colors.yellow,
                      iconData: Icons.category,
                      labe: 'Categrase',
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Categerase()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerItem(
    String Label,
    String Value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: const Color(0xff206de1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                Value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
