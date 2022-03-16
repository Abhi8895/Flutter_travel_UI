import 'package:flutter/material.dart';
import 'package:foodapp_ui/utils/colors.dart';
import 'package:foodapp_ui/utils/dimentions.dart';
import 'package:foodapp_ui/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firtHalf;
  late String seconHalf;

  bool hidingText = true;

  double textHeight = Dimensions.screenHeight / 5.63;
  //I love Flutter Laravel and golang 30 50

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firtHalf = widget.text.substring(0, textHeight.toInt());
      seconHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firtHalf = widget.text;
      seconHalf = " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: seconHalf.isEmpty
          ? SmallText(text: firtHalf)
          : Column(
              children: [
                SmallText(
                    text: hidingText
                        ? (firtHalf + "...")
                        : (firtHalf + seconHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hidingText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show More",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
