import 'package:flutter/material.dart';

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
  bool _shouldLoad = false;
  bool _hasLoaded = false;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _shouldLoad = widget.shouldLoad;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fillProgress) {
      return Container(
        height: 3,
        decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)), color: AppColors.primaryText),
      );
    }

    if (_shouldLoad) {
      widget.onLoadingStart?.call();
      Future.delayed(const Duration(seconds: 2), () {
        widget.onLoadingComplete?.call();
        setState(() {
          _shouldLoad = false;
          _hasLoaded = true;
        });
      });
    }

    return Container(
      height: 3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
        color: AppColors.tertiaryText,
      ),
      child: Row(
        children: [
          Flexible(
            fit: (_shouldLoad && !_hasLoaded) ? FlexFit.tight : FlexFit.loose,
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.linear,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                color: AppColors.primaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
