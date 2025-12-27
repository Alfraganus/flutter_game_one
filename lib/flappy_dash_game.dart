import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'FlappyDashWorld.dart';

class FlappyDashGame extends FlameGame<FlappyDashWorld> with KeyboardEvents{
  FlappyDashGame()
      : super(
    world: FlappyDashWorld(),
    camera: CameraComponent.withFixedResolution(
      width: 400,
      height: 900,
    ),
  );
  @override
  KeyEventResult onKeyEvent(
      KeyEvent event,
      Set<LogicalKeyboardKey> keysPressed,
      ) {
    final isKeyDown = event is KeyDownEvent;

    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace && isKeyDown) {
        world.onSpaceDown();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}




