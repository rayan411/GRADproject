import 'package:bridge/widgets/Colors/colors.dart';
import 'package:flutter/material.dart';

class SmallCardLearn extends StatefulWidget {
  final String? enterName;
  final Function()? onPress;
  final String? sourceImage;

  const SmallCardLearn(
      {Key? key, this.enterName, this.onPress, this.sourceImage})
      : super(key: key);

  @override
  State<SmallCardLearn> createState() => _SmallCardLearnState();
}

class _SmallCardLearnState extends State<SmallCardLearn> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove item from Learn.'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Would you like to remove this path ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: InkWell(
        onTap: widget.onPress,
        child: SizedBox(
          width: 327,
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(widget.sourceImage ?? "images/front2.png"),
                height: 48,
                width: 48,
              ),
            ),
            title: Text(widget.enterName ?? "Not enter Name",
                style: TextStyle(
                  fontSize: 16,
                  color: ColorSelect.Color5,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: const Text('Lets go', style: TextStyle()),
            textColor: ColorSelect.Color4,
            tileColor: ColorSelect.Color1,
            iconColor: ColorSelect.Color5,
            trailing: InkWell(onTap: _showMyDialog, child: Icon(Icons.close)),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
          ),
        ),
      ),
    );
  }
}
