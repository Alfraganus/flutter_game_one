import 'package:flame/components.dart';
import 'package:flutter_game_pne/components/pipe.dart';

class PipePair extends PositionComponent {
  PipePair({required super.position, this.gap = 200.0, this.speed = 200});

  final double gap;
  final double speed;
  @override
  void onLoad() {
   super.onLoad();
   addAll([
     Pipe(isFlipped: false,position: Vector2(0, gap / 2)),
     Pipe(isFlipped: true,position: Vector2(0, -(gap / 2)))
   ]);
  }

  @override
  void update(double dt) {
    position.x -= speed * dt;
    super.update(dt);
  }


}