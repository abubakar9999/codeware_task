import 'package:codeware/UI/details_page.dart';
import 'package:codeware/models/product_model.dart';
import 'package:codeware/service/datas.dart';
import 'package:codeware/service/reprository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Codeware Task'),
      ),
      body: SafeArea(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsPage(
                          element: Reprository().mydatalist(Mydata.input1),
                          clickbutton: "Input1")));
                  // _showPopup(
                  //     context, Reprository().mydatalist(Mydata.input1), "Input2");
                },
                child: const Text("Intput 1")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsPage(
                          element: Reprository().mydatalist(Mydata.input2),
                          clickbutton: "Input2")));
                  // _showPopup(
                  //     context, Reprository().mydatalist(Mydata.input2), "Input2");
                },
                child: const Text("Intput 2"))
          ],
        ),
      )),
    );
  }

  // void _showPopup(
  //     BuildContext context, List<AndroidVerison> element, String clickbutton) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('$clickbutton Details'),
  //         content: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             SizedBox(
  //               height: 300,
  //               child: ListView.builder(
  //                   itemCount: element.length,
  //                   itemBuilder: (context, index) {
  //                     return Text(element[index].title.toString());
  //                   }),
  //             )
  //           ],
  //         ),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Close'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
