import 'package:flutter/material.dart';
import 'package:responsi_124210026/categories_model.dart';
import 'package:responsi_124210026/meals_list.dart';
import 'package:responsi_124210026/menu_data_source.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meal Categories",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown.shade400,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.brown.shade300,
              Colors.brown.shade200,
              Colors.brown.shade100,
            ],
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: _buildListCategoriesBody(),
      ),
    );
  }

  Widget _buildListCategoriesBody() {
    return Container(
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
        future: MenuDataSource.instance.loadCategories(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            CategoriesModel categories = CategoriesModel.fromJson(snapshot.data);
            return _buildSuccessSection(categories);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(CategoriesModel data) {
    return ListView.builder(
      itemCount: data.categories!.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(2),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         MealsPage(meals: data.categories![index]),
                //   ),
                // );
              },
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      height: MediaQuery.of(context).size.width/2,
                      child: Image.network(
                        data.categories![index].strCategoryThumb!,
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.brown.shade300,
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              data.categories![index].strCategory ??
                                  'Kategori Tidak Tersedia',
                            ),
                            SizedBox(height: 10),
                            Text(
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                              data.categories![index].strCategoryDescription ??
                                  'Deskripsi Tidak Tersedia',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
