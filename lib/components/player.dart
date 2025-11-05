import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:space_rush/game.dart';

import 'laser.dart';

class Player extends SpriteComponent with HasGameReference<MyGame>{
  bool _isShooting = false;
  final double _fireCooldown = 0.2;
  double _elapsedFireTime = 0.0;

  @override
  FutureOr<void> onLoad() async{
    sprite = await game.loadSprite('player_blue_on0.png');

    size *= 0.3;

    return super.onLoad();
  }

  @override
  void update(double dt){
    super.update(dt);

    position += game.joystick.relativeDelta.normalized() * 200 * dt;

    _handleScreenBounds();

    //shooting
    _elapsedFireTime += dt;
    if(_isShooting && _elapsedFireTime >= _fireCooldown){
      _fireLaser();
      _elapsedFireTime = 0.0;
    }

  }

  void _handleScreenBounds(){
    final double screenWidth = game.size.x;
    final double screenHeight = game.size.y;
    
    // vertical boundary
    position.y = clampDouble(position.y, size.y / 2, screenHeight - size.y / 2);

    //horizontal wrap
    if(position.x < 0){
      position.x = screenWidth;
    }
    else if(position.x > screenWidth){
      position.x = 0;
    }
  }


  void startShooting(){
    _isShooting = true;
  }

  void stopShooting(){
    _isShooting = false;
  }

  void _fireLaser(){
    game.add(Laser(position: position.clone() + Vector2(0, -size.y / 2)));
  }
}