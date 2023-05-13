import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techsterstest/festivals/controller/festival_img_prov.dart';
import 'package:techsterstest/festivals/controller/festival_prov.dart';
import 'package:techsterstest/festivals/controller/var_prov.dart';

class ScreenImages extends StatefulWidget {
  const ScreenImages({super.key});

  @override
  State<ScreenImages> createState() => _ScreenImagesState();
}

class _ScreenImagesState extends State<ScreenImages> {
  @override
  void initState() {
    Provider.of<FestivalProvider>(context, listen: false).catergoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Consumer3<FestivalProvider, FestivalTwoProvider,
          FestVariableProvider>(
        builder: (BuildContext context, value, data, select, Widget? child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  value.showLoader
                      ? const SizedBox()
                      : SizedBox(
                          height: 70,
                          child: ListView.builder(
                            itemCount: value.festlist.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                select.boollist[index] = true;
                                data.getImgList(
                                    int.parse(value.festlist[index].id!));
                                select.boollist.forEach((k, v) {
                                  if (index != k) {
                                    select.boollist[k] = false;
                                  }
                                });
                                select.getname(
                                    value.festlist[index].category.toString());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 204, 202, 202),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                    ],
                                    color: select.boollist[index]!
                                        ? Colors.white
                                        : Colors.blue,
                                    borderRadius: BorderRadius.circular(30)),
                                margin: const EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      value.festlist[index].category.toString(),
                                      style: TextStyle(
                                        color: select.boollist[index]!
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      select.name,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: data.festimglist.isEmpty || data.showLoader
                        ? const Center(child: Text('no data'))
                        : ListView.separated(
                            itemCount: data.festimglist.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://resonancehyderabad.com/blog/${data.festimglist[index].image}'),
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 15),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
