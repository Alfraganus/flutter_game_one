import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class Dash extends PositionComponent {
  Dash()
      : super(
    position: Vector2(0, 0),
    size: Vector2.all(80),
    anchor: Anchor.center
  );
  late Sprite _dashSprite;
  final Vector2 gravity = Vector2(0, 900);
   Vector2 velocity = Vector2(0, 0);
   final Vector2 jumpForce = Vector2(0, -450);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    debugMode = false;
    _dashSprite = await Sprite.load('dash.png');
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
}


class Dash2 extends SpriteComponent {
  Dash2({
    required super.sprite
  });
}
