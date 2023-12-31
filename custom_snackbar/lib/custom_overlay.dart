import 'dart:async';
import 'package:flutter/material.dart';

enum SnackAlignment {
  TOP,
  CENTER,
  BOTTOM,
}

class CustomOverlay {
  static OverlayEntry? _overlayEntry;
  static Timer? _timer;
  static OverlayEntry _createOverlayEntry(
      String? message, SnackAlignment alignment) {
    return OverlayEntry(
        builder: (context) => Stack(
              alignment: Alignment.center,
              // Without Stack we will not able to align our Snackbar at center of widget
              children: [
                Positioned(
                  top: alignment == SnackAlignment.TOP ? kToolbarHeight : null,
                  bottom: alignment == SnackAlignment.BOTTOM
                      ? kToolbarHeight
                      : null,
                  child: Material(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(5),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.9),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.check_circle,
                                color: Colors.white, size: 18),
                            const SizedBox(width: 8),
                            Flexible(
                                child: Text(
                              message!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
  }

  static show(
      {String? message,
      required BuildContext context,
      required SnackAlignment alignment}) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _timer?.cancel();
    }

    _overlayEntry = _createOverlayEntry(message!, alignment);
    _insertOverlay(context);
  }

  static _insertOverlay(BuildContext context) async {
    Navigator.of(context).overlay!.insert(_overlayEntry!);

    _timer = Timer(const Duration(seconds: 3), () {
      if (_overlayEntry != null) {
        _overlayEntry?.remove();
        _overlayEntry = null;
        _timer?.cancel();
      }
    });
  }
}
