// import 'dart:ui';
// Flutter의 그래픽스 기능과 관련된 클래스들을 제공
// Flutter의 그림 그리기 및 화면 표시와 관련된 기능을 제공
import 'dart:ui';

class DotInfo {
  // Offset : 화면에서의 위치를 나타내는 객체
  // X, Y 좌표를 가지며, 점이 화면 상의 어디에 위치하는지 나타냄
  final Offset offset;
  final double size;
  final Color color;

  DotInfo(this.offset, this.size, this.color);
}