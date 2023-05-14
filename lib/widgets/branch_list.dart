import 'package:agribank_app/data/dummy_branch.dart';
import 'package:agribank_app/models/branch.dart';
import 'package:agribank_app/widgets/branch_store.dart';
import 'package:flutter/material.dart';
import 'package:agribank_app/widgets/image.dart' as image_local;

class BranchList extends StatelessWidget {
  const BranchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const image_local.Image(
              path: 'assets/images/home_image.jpeg',
            ),
            Row(
              children: const [
                Text('DBI'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Thông tin đánh giá mức độ chuyển đổi số của Agribank',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ],
        ),
        toolbarHeight: 150,
      ),
      body: ListView.separated(
        itemCount: branches.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            branches[index].name.toUpperCase(),
          ),
          leading: Container(
            width: 40,
            height: 40,
            color: Colors.green,
          ),
          onTap: () => {onSelectBranch(context, branches[index])},
        ),
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 0.3,
          );
        },
      ),
    );
  }

  void onSelectBranch(BuildContext context, Branch branch) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => BranchStore(branch: branch),
      ),
    );
  }
}
