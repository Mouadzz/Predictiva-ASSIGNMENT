import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/filter_drop_down_widget.dart';

class OpenTradesHeaderWidget extends StatefulWidget {
  const OpenTradesHeaderWidget({required this.dropDownController, super.key});

  final OverlayPortalController dropDownController;

  @override
  State<OpenTradesHeaderWidget> createState() => _OpenTradesHeaderWidgetState();
}

class _OpenTradesHeaderWidgetState extends State<OpenTradesHeaderWidget> {
  final _link = LayerLink();

  double? dropDownWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          CompositedTransformTarget(
            link: _link,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Open trades',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                OverlayPortal(
                  controller: widget.dropDownController,
                  overlayChildBuilder: (BuildContext context) {
                    return CompositedTransformFollower(
                      link: _link,
                      targetAnchor: Alignment.bottomLeft,
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child:
                            FilterDropDownWidget(dropDownWidth: dropDownWidth),
                      ),
                    );
                  },
                  child: filterButton(
                    onTap: toggle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void toggle() {
    dropDownWidth = context.size?.width;
    widget.dropDownController.toggle();
  }

  Widget filterButton({required void Function() onTap}) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.stroke),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/filter-list.png',
              width: 20,
              height: 20,
            ),
          ),
        ),
      );
}
