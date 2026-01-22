import 'package:flutter/material.dart';

class DeviceFooter extends StatelessWidget {
  final String deviceName;

  const DeviceFooter({super.key, required this.deviceName});

  @override
  Widget build(BuildContext context) {
    const runOn = 'run on: ';

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              runOn,
              // style: TealText.text.copyWith(
              //   fontSize: 12,
              //   fontStyle: FontStyle.italic,
              // ),
            ),
            Text(
              deviceName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
