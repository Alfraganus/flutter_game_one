
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';
import 'dash.dart';

class FlappyDashGame extends FlameGame<FlappyDashWorld> {
  FlappyDashGame()
      : super(
    world: FlappyDashWorld(),
    camera: CameraComponent.withFixedResolution(
      width: 400,
      height: 900,
    ),
  );
}

class FlappyDashWorld extends World {
  @override
  void onLoad() {
    super.onLoad();
    add(DashBackground());
    add(Dash());
  }
}

class DashBackground extends ParallaxComponent<FlappyDashGame> {

  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    parallax = await game.loadParallax(
      [
        ParallaxImageData('background/layer1-sky.png',),
        ParallaxImageData('background/layer2-clouds.png'),
        ParallaxImageData('background/layer3-clouds.png'),
        ParallaxImageData('background/layer4-clouds.png'),
        ParallaxImageData('background/layer5-huge-clouds.png'),
        ParallaxImageData('background/layer6-bushes.png'),
        ParallaxImageData('background/layer7-bushes.png'),
      ],
      size: Vector2(1200, 800),
      baseVelocity: Vector2(1, 0),
      velocityMultiplierDelta: Vector2(1.7, 0),

    );
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    this.size = size;
  }
}


