import 'package:flutter/material.dart';
import 'package:test_flutter_1_1/Components/tile.dart';

class Grid extends StatefulWidget {
  const Grid({
    super.key,
  });
  @override
  State<Grid> createState() => _GridState();
}
class _GridState extends State<Grid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 30,
        //limit the nb of squares to 30 5 per 6
        physics: const NeverScrollableScrollPhysics(),
        // prevent scrolling feature
        padding: const EdgeInsets.fromLTRB(36, 20, 36, 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing:4,
            crossAxisSpacing: 4,
            crossAxisCount: 5
        ),
        itemBuilder: (context,index){
          return Tile(index: index,);
          // );
        }
    );
  }
}

