import 'package:flutter/material.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';

class PostCardBottomSectionToolboxComponent extends StatelessWidget {
  final Widget child;
  final int count;
  final void Function() onPressed;

  const PostCardBottomSectionToolboxComponent({
    super.key,
    required this.child,
    required this.count,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        child,
        4.hs,
        Text(count.toString()),
      ],
    );
  }
}
