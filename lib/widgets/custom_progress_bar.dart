import 'package:flutter/material.dart';
import 'package:progress_app/controllers/my_data.dart';

class CustomProgressIndicator extends StatefulWidget {
  final int totalItems;
  final int itemsInLine;
  final Color color;
  final bool isReversed;
  final Speed speed;

  const CustomProgressIndicator({
    Key? key,
    required this.totalItems,
    required this.itemsInLine,
    required this.color,
    required this.isReversed,
    required this.speed,
  }) : super(key: key);

  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.isReversed ? widget.totalItems - 1 : 0;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _getDuration(widget.speed)),
    );

    _startAnimatingItems();
  }

  int _getDuration(Speed speed) {
    switch (speed) {
      case Speed.slow:
        return 2000;
      case Speed.smooth:
        return 1000;
      case Speed.fast:
        return 500;
      default:
        return 1000;
    }
  }

  void _startAnimatingItems() {
    if (_controller.isAnimating) return;

    _controller.forward().then((_) {
      setState(() {
        if (!widget.isReversed) {
          currentIndex = (currentIndex + 1) % widget.totalItems;
        } else {
          currentIndex =
              (currentIndex - 1 + widget.totalItems) % widget.totalItems;
        }
      });

      _controller.reset();
      _startAnimatingItems();
    });
  }

  @override
  void didUpdateWidget(CustomProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isReversed != widget.isReversed ||
        oldWidget.speed != widget.speed) {
      _controller.stop();
      _controller.reset();

      currentIndex = widget.isReversed ? widget.totalItems - 1 : 0;

      _controller.duration = Duration(milliseconds: _getDuration(widget.speed));

      _startAnimatingItems();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int totalLines = (widget.totalItems / widget.itemsInLine).ceil();
    double totalAvailableWidth = MediaQuery.of(context).size.width -
        32; // Total available width for the items (with some padding).
    double itemWidth = (totalAvailableWidth - (widget.itemsInLine - 1) * 8) /
        widget
            .itemsInLine; // Distribute width across items, accounting for margins.

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: List.generate(
          totalLines,
          (lineIndex) {
            int remainingItems =
                widget.totalItems - (lineIndex * widget.itemsInLine);
            int itemsInThisLine = remainingItems > widget.itemsInLine
                ? widget.itemsInLine
                : remainingItems;
      
            return Column(
              children: [
                Row(
                  mainAxisAlignment: itemsInThisLine < widget.itemsInLine
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: List.generate(
                    itemsInThisLine,
                    (itemIndex) {
                      int globalItemIndex =
                          (lineIndex * widget.itemsInLine) + itemIndex;
                      bool isAnimatingItem = globalItemIndex == currentIndex;
      
                      return Container(
                        width: itemWidth,
                        height: 20,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 4), 
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            double progress;
                            if (isAnimatingItem) {
                              progress = _controller.value;
                            } else if (widget.isReversed) {
                              progress =
                                  globalItemIndex < currentIndex ? 0.0 : 1.0;
                            } else {
                              progress =
                                  globalItemIndex < currentIndex ? 1.0 : 0.0;
                            }
      
                            return FractionallySizedBox(
                              alignment: widget.isReversed
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              widthFactor: progress,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      widget.color.withOpacity(0.5),
                                      widget.color.withOpacity(1.0),
                                      //Colors.black.withAlpha(255),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
