import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CreateUserButton extends StatefulWidget {
  const CreateUserButton({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<CreateUserButton> createState() => _CreateUserButtonState();
}

class _CreateUserButtonState extends State<CreateUserButton> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (isVisible) setState(() => isVisible = false);
    } else if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!isVisible) setState(() => isVisible = true);
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 300),
      offset: isVisible ? Offset.zero : const Offset(0, 2),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isVisible ? 1 : 0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/createUser');
          },
          backgroundColor: Colors.blueAccent,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.person_add_alt_1,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
