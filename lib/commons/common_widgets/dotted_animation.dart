import 'dart:async';
import 'package:dmax_app/commons/common_imports/common_libs.dart';

class DottedAnimation extends StatefulWidget {
  const DottedAnimation({
    super.key,
    required this.isGenerated,
  });

  final bool isGenerated;

  @override
  _DottedAnimationState createState() => _DottedAnimationState();
}

class _DottedAnimationState extends State<DottedAnimation> {
  final int rowCount = 15;
  final int columnCount = 15;
  final List<List<bool>> activeMatrix = [];
  final List<List<int>> randomizedColumnOrders = [];

  final List<int> activeDotsPerRow = [1, 3, 9, 13]; // Custom shape
  final int fullRowDotCount = 15;

  int currentRow = 0;
  int currentCol = 0;
  Timer? _dotTimer;

  @override
  void initState() {
    super.initState();
    _generateMatrix();
    if (widget.isGenerated) {
      _startDotByDotAnimation();
    }
  }

  @override
  void didUpdateWidget(covariant DottedAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isGenerated != widget.isGenerated) {
      if (widget.isGenerated) {
        _startDotByDotAnimation();
      } else {
        _stopAnimation();
        _clearMatrix();
      }
    }
  }

  void _generateMatrix() {
    activeMatrix.clear();
    randomizedColumnOrders.clear();

    for (int col = 0; col < columnCount; col++) {
      activeMatrix.add(List.generate(rowCount, (_) => false));
    }

    for (int row = 0; row < rowCount; row++) {
      List<int> shuffledCols = List.generate(columnCount, (i) => i)..shuffle();
      randomizedColumnOrders.add(shuffledCols);
    }
  }

  void _clearMatrix() {
    for (int col = 0; col < columnCount; col++) {
      for (int row = 0; row < rowCount; row++) {
        activeMatrix[col][row] = false;
      }
    }
    currentRow = 0;
    currentCol = 0;
    setState(() {});
  }

  void _startDotByDotAnimation() {
    _clearMatrix();
    _dotTimer?.cancel();

    _dotTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (currentRow >= rowCount) {
        timer.cancel();
        return;
      }

      List<int> columnOrder = randomizedColumnOrders[currentRow];
      int col = columnOrder[currentCol];

      int center = columnCount ~/ 2;
      int activeDots = currentRow < activeDotsPerRow.length
          ? activeDotsPerRow[currentRow]
          : fullRowDotCount;
      int halfWidth = activeDots ~/ 2;
      int dx = (col - center).abs();

      bool isWithinShape = dx <= halfWidth;

      if (isWithinShape) {
        activeMatrix[col][currentRow] = true;
      }

      currentCol++;
      if (currentCol >= columnCount) {
        currentCol = 0;
        currentRow++;
      }

      setState(() {});
    });
  }

  void _stopAnimation() {
    _dotTimer?.cancel();
    _dotTimer = null;
  }

  @override
  void dispose() {
    _dotTimer?.cancel();
    super.dispose();
  }

  Color _getDotColor(int row, int col, bool isActive) {
    if (!isActive) return Colors.grey[300]!;
    return (row + col) % 2 == 0 ? MyColors.red : MyColors.pointColor;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(columnCount, (col) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(rowCount, (row) {
                int center = columnCount ~/ 2;
                int activeDots = row < activeDotsPerRow.length
                    ? activeDotsPerRow[row]
                    : fullRowDotCount;
                int halfWidth = activeDots ~/ 2;
                int dx = (col - center).abs();

                bool isVisible = dx <= halfWidth;
                bool isActive = activeMatrix[col][row];

                return isVisible
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        width: 10.h,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: isActive
                              ? _getDotColor(row, col, isActive)
                              : Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                      )
                    : const SizedBox(height: 10);
              }),
            ),
          );
        }),
      ),
    );
  }
}
