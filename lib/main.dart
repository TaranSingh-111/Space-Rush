import 'package:flutter/material.dart';
import 'package:space_rush/overlays/game_over_overlay.dart';
import 'package:space_rush/overlays/title_overlay.dart';
import 'game.dart';
import 'package:flame/game.dart';

void main()async{
  final MyGame game = MyGame();

  runApp(GameWidget(game: game,
  overlayBuilderMap: {
    'GameOver': (context, MyGame game) => GameOverOverlay(game: game),
    'Title': (context, MyGame game) => TitleOverlay(game: game),
  },
    initialActiveOverlays: const ['Title'],
  ));
}