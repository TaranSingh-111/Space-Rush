import 'package:flutter/material.dart';
import 'game.dart';
import 'package:flame/game.dart';

void main(){
  final MyGame game = MyGame();

  runApp(GameWidget(game: game));
}