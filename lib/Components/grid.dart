import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_1_1/Animation/bounce.dart';
import 'package:test_flutter_1_1/Components/tile.dart';
import 'package:test_flutter_1_1/Controllers/Controller.dart';

import '../Animation/dance.dart';

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
          return Consumer<Controller>(
            builder: (_,notifier,__) {
              bool animate=false;
              bool animate_dance=false;
              int dance_delay=1600;

              if (index==notifier.currentTile-1 && ! notifier.backOrEnterTapped){
                // this is the current tile that has been chosen
                animate=true;
              }
              if(notifier.gameWon){
                for (int i = notifier.tilesEntered.length - 5;
                i < notifier.tilesEntered.length;
                i++) {
                  if (index == i) {
                    animate_dance = true;
                    dance_delay += 150 * (i - ((notifier.currentRow - 1) * 5));
                  }
                }
              }

              return Dance(
                animate:animate_dance,
                delay: dance_delay,
                child: Bounce(
                animate: animate,
                  child: Tile(index: index,)
                            ),
              );
            },
          );
          // );
        }
    );
  }
}

