import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GameWidget(
          game: FlameGame(world: MyWorld()),
        ),
      ),
    );
  }
}

class MyWorld extends World with HasGameReference<FlameGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

   var camera = CameraComponent.withFixedResolution(
      world: MyWorld(),
      width: 800,
      height: 600,
    );
    // Create parallax using the parent game reference
    final parallax = await game.loadParallax(
      [
        ParallaxImageData('parallax/plx-1.png'),
        ParallaxImageData('parallax/plx-2.png'),
        ParallaxImageData('parallax/plx-3.png'),
        ParallaxImageData('parallax/plx-4.png'),
        ParallaxImageData('parallax/plx-5.png'),
        ParallaxImageData('parallax/plx-6.png'),
      ],
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );

    add(ParallaxComponent(parallax: parallax));

    // Character sprite
    final spriteSheet = SpriteSheet(
      image: await Flame.images.load('DinoSprites - tard.png'),
      srcSize: Vector2(24, 24),
    );

    final runAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.1,
      from: 3,
      to: 6,
    );

    add(SpriteAnimationComponent(
      animation: runAnimation,
      position: Vector2(100, 120),
      size: Vector2(80, 80),
    ));
  }
}