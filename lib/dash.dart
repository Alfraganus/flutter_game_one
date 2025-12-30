import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_game_pne/components/HiddenCoin.dart';
import 'package:flutter_game_pne/components/pipe.dart';
import 'package:flutter_game_pne/flappy_dash_game.dart';

class Dash extends PositionComponent with CollisionCallbacks,HasGameRef<FlappyDashGame> {
  Dash()
      : super(
    position: Vector2(0, 0),
    size: Vector2.all(80),
    anchor: Anchor.center,
    priority: 10
  );
  late Sprite _dashSprite;
  final Vector2 gravity = Vector2(0, 1400);
   Vector2 velocity = Vector2(0, 0);
   final Vector2 jumpForce = Vector2(0, -500);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    debugMode = false;
    _dashSprite = await Sprite.load('dash.png');
    final radius = size.x / 2;
    final center = size / 2;
    add(CircleHitbox(
        radius: radius * 0.75,
        position: center / 1.1,
        anchor: Anchor.center
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    velocity += gravity * dt;
    position +=velocity * dt;
    // position = Vector2(0,0);
  }
  void jump() {
    velocity = jumpForce;
  }
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _dashSprite.render(canvas, size: size);
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    super.onCollision(points, other);
    if(other is HiddenCoins) {
      other.removeFromParent();
      game.world.inreaseScore();
      print('toched it');
    } else if(other is Pipe) {
      print('game is over');
    }
  }
}


