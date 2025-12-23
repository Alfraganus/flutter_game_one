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



class MyWorld extends World {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final spriteSheet = SpriteSheet(
      image: await Flame.images.load('DinoSprites - tard.png'),
      srcSize: Vector2(24, 24),
    );
    final image = await Flame.images.load('parallax/plx-1.png');
    add(ParallaxComponent(
      parallax: Parallax([
        ParallaxLayer(
          ParallaxImage(image, fill: LayerFill.height, alignment: Alignment.bottomLeft, repeat: ImageRepeat.repeat),
        ),
      ]),
    ));
    final idleAnimation = spriteSheet.createAnimation(row: 0, stepTime: 0.1, from: 0, to: 3);
    final runAnimation = spriteSheet.createAnimation(row: 0, stepTime: 0.1, from: 3, to: 6);
    add(SpriteAnimationComponent(
      animation: runAnimation,
      position: Vector2(100, 120),
      size: Vector2(80, 80),
    ));
    add(TextComponent(
      text: 'hello world',
      textRenderer: TextPaint(
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      position: Vector2(100, 110),
    ));
  }
}

