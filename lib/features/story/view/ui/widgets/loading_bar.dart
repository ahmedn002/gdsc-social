import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/colors.dart';

class LoadingBar extends StatefulWidget {
  final bool shouldLoad;
  final bool shouldPause;
  final void Function()? onLoadingStart;
  final void Function()? onLoadingComplete;
  final bool fillProgress;
  const LoadingBar({super.key, this.shouldLoad = false, this.shouldPause = false, this.onLoadingStart, this.onLoadingComplete, this.fillProgress = false});

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> with SingleTickerProviderStateMixin {
  final Duration _animationDuration = 3.seconds;
  bool _shouldLoad = false;
  bool _isLoading = false;

  // If the user goes to a previous story, the onLoadingComplete callback should not be called
  // We can't use the shouldLoad property to check if the loading has been cancelled because the user may
  // Navigate back to the same story and the then the old callback would be called in the middle of the new loading
  bool _loadingHasBeenCancelled = false;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _shouldLoad = widget.shouldLoad;
    _initAnimationController();
  }

  @override
  void didUpdateWidget(covariant LoadingBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // debugPrint('LoadingBar didUpdateWidget: shouldPause: ${widget.shouldPause}, oldWidget.shouldPause: ${oldWidget.shouldPause}');
    if (oldWidget.shouldLoad && !widget.shouldLoad) {
      _isLoading = false;
      _loadingHasBeenCancelled = true;
      _controller.reset();
    }
    if (widget.shouldPause && _controller.isAnimating) {
      _controller.stop();
    }
    if (oldWidget.shouldPause && !widget.shouldPause && _shouldLoad) {
      _controller.forward();
    }
    _shouldLoad = widget.shouldLoad;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The container should be fully loaded if fillProgress is true (for stories already passed)
    if (widget.fillProgress) {
      return _buildFilledContainer();
    }

    _handleAnimation();

    return Container(
      height: 3,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        color: AppColors.tertiaryText,
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizeTransition(
                sizeFactor: _controller,
                axis: Axis.horizontal,
                child: Container(
                  height: 3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                    color: AppColors.primaryText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // TODO: Decide whether to put this in a separate widget class
  Widget _buildFilledContainer() {
    return Container(
      height: 3,
      decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)), color: AppColors.primaryText),
    );
  }

  void _initAnimationController() {
    _controller = AnimationController(vsync: this, duration: _animationDuration);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onLoadingComplete?.call();
      }
    });
  }

  void _scheduleAnimationStop() {
    Future.delayed(_animationDuration, () {
      if (_loadingHasBeenCancelled) return;
      if (mounted) {
        setState(() {
          _shouldLoad = false;
          _isLoading = false;
        });
      }
    });
  }

  void _handleAnimation() {
    if (_shouldLoad && !_isLoading) {
      _isLoading = true;
      widget.onLoadingStart?.call();
      _controller.forward();
      _scheduleAnimationStop();
    }
  }
}
