import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_1_1/Constants/anser_stages.dart';
import 'package:test_flutter_1_1/Constants/colors.dart';
import 'package:test_flutter_1_1/Controllers/Controller.dart';

import '../data/keys_map.dart';

class KeyboardRow extends StatelessWidget {
  const KeyboardRow({ required this.MIN,required this.MAX,
    super.key,
  });
  final int MIN,MAX;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    // return the size of the parent

    return Consumer<Controller>(
      builder:(_,controller,__) {
        int countIndex=0;
        // each round you reset the index counter
        return IgnorePointer(
          ignoring: controller.gameCompleted,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: keysMap.entries.map((e) {
            countIndex++;

            // print("Index of ${e.key} is: $countIndex ");
            if(countIndex>=MIN&& countIndex<=MAX){
              Color ccolor= Theme.of(context).primaryColorLight;
              Color keyColor = Colors.white;
              if(e.value==AnswerStage.correct){
                ccolor=correctGreen;
              }else if(e.value==AnswerStage.contains){
                ccolor=containsYellow;
              }
              else if(e.value==AnswerStage.incorrect){
                ccolor = Theme.of(context).primaryColorDark;
              }
              else {
                keyColor = Theme.of(context).textTheme.bodyText2?.color ?? Colors.black;
                    // again ? avoid null errors
              }
              // else it's by default grey
          
              return Padding(
                padding: EdgeInsets.all(size.width*0.006),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  // adding radius
                  child: SizedBox(
                      width: e.key=="ENTER"||e.key=="BACK" ?
                      size.width*0.13:
                      size.width*0.085,
                      height: size.height*0.090,
                      // margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child:Material(
                        color: ccolor,
                        child:InkWell(
                        onTap: (){
                          Provider.of<Controller>(context,listen: false).setKeyTapped(value: e.key);
                        },
                          child:Center(
                              child:e.key == 'BACK'
                                  ? const Icon(Icons.backspace_outlined)
                                  : Text(
                                e.key,
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: keyColor,
                                ),
                              ),
                          ),
                      ),
                      //   InkWell add effect to the key when clicked
                      ),
                    ),
                ),
                );
            }else {
               return const SizedBox();
            }
          }).toList(),
          //   return a list of all key of the keyboard
                ),
        );
      },
    );
  }
}

