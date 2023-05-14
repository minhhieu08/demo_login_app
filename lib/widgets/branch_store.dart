import 'package:agribank_app/data/dummy_branch.dart';
import 'package:agribank_app/models/branch.dart';
import 'package:flutter/material.dart';

class BranchStore extends StatelessWidget {
  final Branch branch;

  const BranchStore({
    super.key,
    required this.branch,
  });

  @override
  Widget build(BuildContext context) {
    var items = store.where((i) => i.branch.id == branch.id).toList();
    Widget? content;
    if (items.isEmpty) {
      content = const Center(
        child: Text("Không có dữ liệu..."),
      );
    }

    if (items.isNotEmpty) {
      content = Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'Tìm kiếm tên chi nhánh',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 5,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index].city,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          items[index].branch.name,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 40,
                      height: 40,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text('Chi nhánh'),
          ],
        ),
        backgroundColor: const Color.fromRGBO(95, 2, 31, 1),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
      ),
      body: content,
    );
  }
}
