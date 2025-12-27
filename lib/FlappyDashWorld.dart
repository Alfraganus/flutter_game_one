import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter_game_pne/components/pipe.dart';
import 'package:flutter_game_pne/components/pipe_pair.dart';
import 'DashBackground.dart';
import 'dash.dart';

class FlappyDashWorld extends World with TapCallbacks {
  late Dash _dash;
  @override
  void onLoad() {
    super.onLoad();
    add(DashBackground());
    add(_dash = Dash());
    add(PipePair(position: Vector2(0, -100)));
  }
  @override
  void onTapDown(TapDownEvent event) {
    // TODO: implement onTapDown
    super.onTapDown(event);
    _dash.jump();
  }
  void onSpaceDown() {
    _dash.jump();

  }
}
