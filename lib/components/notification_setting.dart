import 'package:flutter/material.dart';
import 'package:graduationproject/utils/color_palette.dart';

class NotificationSetting extends StatefulWidget {
  final String text;
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onClick;

  NotificationSetting({
    Key? key,
    required this.text,
    this.initialValue = false,
    required this.onChanged,
    this.onClick,
  }) : super(key: key);

  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool _value;

  _NotificationSettingState() : _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: widget.onClick,
                child: Text(
                  widget.text,
                  style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Switch(
                value: _value,
                onChanged: (bool newValue) {
                  setState(() {
                    _value = newValue;
                  });
                  widget.onChanged(newValue);
                },
                activeColor: PRIMARY_COLOR,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
