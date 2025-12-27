import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'DashBackground.dart';
import 'dash.dart';

class FlappyDashWorld extends World with TapCallbacks {
  late Dash _dash;
  @override
  void onLoad() {
    super.onLoad();
    add(DashBackground());
    add(_dash = Dash());
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
