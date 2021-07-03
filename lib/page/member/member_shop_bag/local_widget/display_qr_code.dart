import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DisplayQrCode extends StatelessWidget {
  static const id = '/display_qr_code';

  const DisplayQrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    final _qrCode = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: QrImage(
                data: _qrCode,
                version: QrVersions.auto,
                size: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'DIGITAL LIBRE ID',
                    style: _textTheme.headline5,
                  ),
                  Text(
                    'Please show the qrcode to the staff in order to scan it!',
                    style: _textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            FloatingActionButton(
              child: Icon(Icons.keyboard_arrow_down),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
