import 'dart:ui';
import 'package:flame/components.dart';

class Pipe extends PositionComponent {

  late Sprite _pipeStripe;
  final bool isFlipped;

  Pipe({
    required this.isFlipped,
    required super.position,
  }): super(priority: 2);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    _pipeStripe = await Sprite.load('pipe.png');
    anchor = Anchor.topCenter;
    final ratio = _pipeStripe.srcSize.y / _pipeStripe.srcSize.x;
    final double width = 82;
    size = Vector2(width, width * ratio);
    if(isFlipped) {
      flipVertically();
    }
  }

  void render(Canvas canvas) {
    super.render(canvas);
    _pipeStripe.render(canvas,  position: Vector2.zero(),size: size);
  }
}