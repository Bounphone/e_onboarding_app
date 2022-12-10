import 'package:flutter/material.dart';

class DialogError extends StatelessWidget {
  const DialogError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child:  ListView(
          shrinkWrap: true,
          children: [
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.cancel, color: Colors.red,)),
                  ),
                  Icon(Icons.warning_amber, color: Colors.red, size: 30),
                  SizedBox(height: 20),
                  Text('error'),
                  SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
    );
  }
}
