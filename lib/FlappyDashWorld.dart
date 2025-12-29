import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter_game_pne/components/pipe_pair.dart';
import 'package:flutter_game_pne/flappy_dash_game.dart';
import 'DashBackground.dart';
import 'dash.dart';

class FlappyDashWorld extends World with TapCallbacks,HasGameRef<FlappyDashGame> {
  late Dash _dash;
  late PipePair _lastPipe;
  static const double pipesDistance = 350.0;

  @override
  void onLoad() {
    super.onLoad();
    add(DashBackground());
    add(_dash = Dash());
    _generatePipes();
  }

  void _generatePipes({int count = 5, double fromX = 0.0}) {
    for (int i = 0; i <= count; i++) {
      final double area = 600;
      final y = (Random().nextDouble() * area) - (area / 2);
      add(_lastPipe = PipePair(position: Vector2(fromX + (i * pipesDistance), y)));
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _dash.jump();
  }
  void onSpaceDown() {
    _dash.jump();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(_dash.x >= _lastPipe.x) {
      _generatePipes(
        fromX: pipesDistance
      );
      removePipes();
    }
    game.camera.viewfinder.zoom = 0.05 ;
  }
  void removePipes() {
    final pipes = children.whereType<PipePair>();
    final shouldBeRemoved = max(pipes.length - 4,0);
    pipes.take(shouldBeRemoved).forEach((pipe) {
      pipe.removeFromParent();
    });
    print(pipes.length);
  }
}
