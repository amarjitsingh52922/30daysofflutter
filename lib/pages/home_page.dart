import 'package:day2/models/catalog.dart';
import 'package:day2/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Amarjit Singh";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString('files/catalog.json');
    var decodeddata = jsonDecode(catalogJson);
    var productsData = decodeddata['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(6, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items![index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: GridTile(
                        header: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                            ),
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            )),
                        child: Image.network(item.image),
                        footer: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              item.price.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                      ));
                },
                itemCount: CatalogModel.items!.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
