import 'package:codeware/models/product_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  List<AndroidVerison> element;
  String clickbutton;
  DetailsPage({super.key, required this.element, required this.clickbutton});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextEditingController controller = TextEditingController();
  List<AndroidVerison> filteredList = [];

  @override
  void initState() {
    super.initState();

    filteredList.addAll(widget.element);
  }

  void searchById(String searchTerm) {
    filteredList.clear();
    for (var element in widget.element) {
      if (element.id.toString() == searchTerm) {
        filteredList.add(element);
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.clickbutton),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            suffixIcon: controller.text != ''
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.disabled_by_default_sharp,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      controller.clear();
                                      filteredList.addAll(widget.element);
                                      setState(() {});
                                    },
                                  )
                                : SizedBox.shrink(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {
                          searchById(controller.text.toString());
                          setState(() {});
                        },
                        child: const Text('Search'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SizedBox(
                  child: filteredList.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            return index == 2 ||
                                    index == 5 &&
                                        index != filteredList.length - 3
                                ? const SizedBox.shrink()
                                : Center(
                                    child: Card(
                                      child: Text(
                                        filteredList[index].title.toString(),
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  );
                          },
                        )
                      : const Text("No Data found")),
            ),
          ],
        ),
      ),
    );
  }
}
