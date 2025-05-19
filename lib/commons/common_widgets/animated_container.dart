import 'dart:ui';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlurAnimatedList extends StatefulWidget {
  const BlurAnimatedList({
    super.key,
    required this.texts,
    this.icons,
    required this.onChange,
    this.isText = false,
    this.isPng = false,
    required this.selectIndex,
  });

  final List<String> texts;
  final List<String>? icons;
  final Function(int) onChange;
  final bool? isText;
  final bool? isPng;
  final int selectIndex;

  @override
  State<BlurAnimatedList> createState() => _BlurAnimatedListState();
}

class _BlurAnimatedListState extends State<BlurAnimatedList>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _blurAnimations;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;
  late List<bool> _started;

  @override
  void initState() {
    super.initState();
    final count = widget.texts.length;

    _controllers = List.generate(
      count,
      (i) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 150),
      ),
    );

    _blurAnimations = List.generate(
      count,
      (i) => Tween<double>(begin: 10.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _controllers[i],
          curve: Curves.linearToEaseOut,
        ),
      ),
    );

    _slideAnimations = List.generate(
      count,
      (i) =>
          Tween<Offset>(begin: const Offset(0.4, 0), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _controllers[i],
          curve: Curves.linearToEaseOut,
        ),
      ),
    );

    _fadeAnimations = List.generate(
      count,
      (i) => Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controllers[i],
          curve: Curves.linearToEaseOut,
        ),
      ),
    );

    _started = List.generate(count, (_) => false);

    _runStaggeredAnimations();
  }

  void _runStaggeredAnimations() async {
    for (int i = 0; i < widget.texts.length; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      if (mounted) {
        setState(() => _started[i] = true);
        _controllers[i].forward();
      }
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.texts.length,
      itemBuilder: (context, index) {
        return _started[index]
            ? FadeTransition(
                opacity: _fadeAnimations[index],
                child: SlideTransition(
                  position: _slideAnimations[index],
                  child: AnimatedBuilder(
                    animation: _blurAnimations[index],
                    builder: (context, child) {
                      return InkWell(
                        overlayColor: MaterialStateProperty.all(
                            MyColors.transparentColor),
                        onTap: () {
                          widget.onChange(index);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: _blurAnimations[index].value,
                                sigmaY: _blurAnimations[index].value,
                              ),
                              child: Container(
                                height: 68.h,
                                decoration: BoxDecoration(
                                  color: widget.selectIndex == index
                                      ? context.secondary
                                      : context.lightContainerColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: widget.icons != null
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                                  children: [
                                    if (widget.icons != null) ...[
                                      if (widget.isText!)
                                        Text(
                                          widget.icons![index],
                                          style: getMediumStyle(
                                            color: widget.selectIndex == index
                                                ? context.whiteColor
                                                : context.secondary,
                                            fontSize: MyFonts.size18,
                                          ),
                                        )
                                      else if (widget.isPng!)
                                        Image.asset(
                                          widget.icons![index],
                                          width: 32.w,
                                          height: 32.h,
                                        )
                                      else
                                        SvgPicture.asset(
                                          widget.icons![index],
                                          width: 32.w,
                                          height: 32.h,
                                        ),
                                      const SizedBox(width: 12),
                                    ],
                                    Text(
                                      widget.texts[index],
                                      style: getMediumStyle(
                                        color: widget.selectIndex == index
                                            ? context.whiteColor
                                            : context.secondary,
                                        fontSize: MyFonts.size18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            : const SizedBox(height: 78); // Empty space until animation starts
      },
    );
  }
}

class BlurAnimatedMap extends StatefulWidget {
  const BlurAnimatedMap({
    super.key,
    required this.texts,
    this.icons,
    required this.onChange,
    this.isText = false,
    this.isPng = false,
    required this.selected,
  });

  final List<String> texts;
  final List<String>? icons;
  final Function(int) onChange;
  final bool? isText;
  final bool? isPng;
  final Set<String> selected;

  @override
  State<BlurAnimatedMap> createState() => _BlurAnimatedMapState();
}

class _BlurAnimatedMapState extends State<BlurAnimatedMap>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _blurAnimations;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;
  late List<bool> _started;

  @override
  void initState() {
    super.initState();
    final count = widget.texts.length;

    _controllers = List.generate(
      count,
      (i) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 150),
      ),
    );

    _blurAnimations = List.generate(
      count,
      (i) => Tween<double>(begin: 10.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _controllers[i],
          curve: Curves.linearToEaseOut,
        ),
      ),
    );

    _slideAnimations = List.generate(
      count,
      (i) =>
          Tween<Offset>(begin: const Offset(0.4, 0), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _controllers[i],
          curve: Curves.linearToEaseOut,
        ),
      ),
    );

    _fadeAnimations = List.generate(
      count,
      (i) => Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controllers[i],
          curve: Curves.linearToEaseOut,
        ),
      ),
    );

    _started = List.generate(count, (_) => false);

    _runStaggeredAnimations();
  }

  void _runStaggeredAnimations() async {
    for (int i = 0; i < widget.texts.length; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      if (mounted) {
        setState(() => _started[i] = true);
        _controllers[i].forward();
      }
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.texts.length,
      itemBuilder: (context, index) {
        return _started[index]
            ? FadeTransition(
                opacity: _fadeAnimations[index],
                child: SlideTransition(
                  position: _slideAnimations[index],
                  child: AnimatedBuilder(
                    animation: _blurAnimations[index],
                    builder: (context, child) {
                      return InkWell(
                        overlayColor: MaterialStateProperty.all(
                            MyColors.transparentColor),
                        onTap: () {
                          widget.onChange(index);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: _blurAnimations[index].value,
                                sigmaY: _blurAnimations[index].value,
                              ),
                              child: Container(
                                height: 68.h,
                                decoration: BoxDecoration(
                                  color: widget.selected
                                          .contains(widget.texts[index])
                                      ? context.secondary
                                      : context.lightContainerColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: widget.icons != null
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                                  children: [
                                    if (widget.icons != null) ...[
                                      if (widget.isText!)
                                        Text(
                                          widget.icons![index],
                                          style: getMediumStyle(
                                            color: widget.selected.contains(
                                                    widget.texts[index])
                                                ? context.whiteColor
                                                : context.secondary,
                                            fontSize: MyFonts.size18,
                                          ),
                                        )
                                      else if (widget.isPng!)
                                        Image.asset(
                                          widget.icons![index],
                                          width: 32.w,
                                          height: 32.h,
                                        )
                                      else
                                        SvgPicture.asset(
                                          widget.icons![index],
                                          width: 32.w,
                                          height: 32.h,
                                          color: widget.selected
                                                  .contains(widget.texts[index])
                                              ? context.whiteColor
                                              : context.secondary,
                                        ),
                                      const SizedBox(width: 12),
                                    ],
                                    Text(
                                      widget.texts[index],
                                      style: getMediumStyle(
                                        color: widget.selected
                                                .contains(widget.texts[index])
                                            ? context.whiteColor
                                            : context.secondary,
                                        fontSize: MyFonts.size18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            : const SizedBox(height: 78); // Empty space until animation starts
      },
    );
  }
}
