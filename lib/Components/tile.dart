import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/anser_stages.dart';
import '../Constants/colors.dart';
import '../Controllers/Controller.dart';

class Tile extends StatefulWidget {
  // stateful Widget because it will be updated during the game
  const Tile({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // every animation controller need a ticker

  Color _backgroundColor = Colors.transparent,
      _borderColor = Colors.transparent;
  late AnswerStage _answerStage;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _borderColor=Theme.of(context).primaryColorLight;
    });
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // duration of the animation
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _borderColor = Theme.of(context).primaryColorLight;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // any animation need a disposer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(builder: (_, notifier, __) {
      String text = "";
      Color fontColor = Colors.white;
      if (widget.index < notifier.tilesEntered.length) {
        text = notifier.tilesEntered[widget.index].letter;

        _answerStage = notifier.tilesEntered[widget.index].answerStage;
        if (notifier.checkLine) {
          final delay = widget.index - (notifier.currentRow - 1) * 5;
          // adjusting the delay of the border disappearing
          // 0->4
          Future.delayed(Duration(milliseconds: 300 * delay), () {
            // the tiles will animate in order from left to right
            if (mounted) {
              _animationController.forward();
            }
            notifier.checkLine = false;
          });

          _backgroundColor = Theme.of(context).primaryColorLight;
          if (_answerStage == AnswerStage.correct) {
            // correct green
            _backgroundColor = correctGreen;
            // _borderColor=Colors.transparent;
          } else if (_answerStage == AnswerStage.contains) {
            // contains yellow
            _backgroundColor = containsYellow;
            // _borderColor=Colors.transparent;
            // incorrect blue
          } else if (_answerStage == AnswerStage.incorrect) {
            // _borderColor=Colors.transparent;
            _backgroundColor = Theme.of(context).primaryColorDark;
          } else {
            fontColor =
                Theme.of(context).textTheme.bodyText2?.color ?? Colors.black;
            // colors.black is default value
            _backgroundColor = Colors.transparent;
          }
        }

        return AnimatedBuilder(
          // each animation need a builder
          animation: _animationController,
          builder: (_, child) {
            double flip = 0;
            if (_animationController.value > 0.50) {
              flip = pi;
            }
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.003)
                ..rotateX(_animationController.value * pi)
                ..rotateX(flip),
              // setEntry add a 3rd dimention effect
              // if u flip the tiles you will get them inappropriately
              // like they appear in a mirror
              // ..rotateX(flip) fix the pb
              // .. is a cascade notation
              // _animationController.value will produce a value between 0 and 1
              child: Container(
                  decoration: BoxDecoration(
                      // the color appear after the flip pass 50%
                      color: flip > 0 ? _backgroundColor : Colors.transparent,
                      // the border will disappear after the flip pass 50%
                      border: Border.all(
                        color: flip > 0 ? Colors.transparent : _borderColor,
                      )),
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: flip > 0
                              ? Text(
                            text,
                            style: const TextStyle().copyWith(color: fontColor),
                          )
                              : Text(text)))),
            );
          },
        );
      } else {
        return Container(
          decoration: BoxDecoration(
              color: _backgroundColor,
              border: Border.all(
                color: _borderColor,
              ),
          ),
        );
      }
    });
  }
}