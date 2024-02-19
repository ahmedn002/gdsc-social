import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/constants/colors.dart';

class LoadingBar extends StatefulWidget {
  final bool shouldLoad;
  final void Function()? onLoadingStart;
  final void Function()? onLoadingComplete;
  final bool fillProgress;
  const LoadingBar({super.key, this.shouldLoad = false, this.onLoadingStart, this.onLoadingComplete, this.fillProgress = false});

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> {
  final Duration _animationDuration = 3.seconds;
  bool _shouldLoad = false;
  bool _isLoading = false;
  double _loadingContainerWidth = 0;
  double _maxWidth = 0;

  @override
  void initState() {
    super.initState();
    _shouldLoad = widget.shouldLoad;
  }

  @override
  Widget build(BuildContext context) {
    // The container should be fully loaded if fillProgress is true (for stories already passed)
    if (widget.fillProgress) {
      return _buildFilledContainer();
    }

    return Container(
      height: 3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        color: AppColors.tertiaryText,
      ),
      child: Row(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                _maxWidth = constraints.maxWidth;
                _handleAnimation();
                return Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    width: _loadingContainerWidth,
                    duration: const Duration(seconds: 2),
                    curve: Curves.linear,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                      color: AppColors.primaryText,
                    ),
                  ),
                );
              },
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

  void _schedulePostFrameCallBack() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isLoading = true;
        _loadingContainerWidth = _maxWidth; // This is what animates the container
      });
    });
  }

  void _scheduleAnimationStop() {
    Future.delayed(_animationDuration, () {
      widget.onLoadingComplete?.call();
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
      widget.onLoadingStart?.call();

      // Starting the animation on the next frame
      _schedulePostFrameCallBack();

      // Making sure animation stops after 2 seconds
      _scheduleAnimationStop();
    }
  }
}
