import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../user/user_data.dart';
import '../widget/appbar_widget.dart';

ImagePicker imagePicker = ImagePicker();
File? fileImage;

class EditImagePage extends StatefulWidget {
  const EditImagePage({Key? key}) : super(key: key);

  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  var user = UserData.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 55,
              backgroundImage:
                  (fileImage != null) ? FileImage(fileImage!) : null,
              child: (fileImage != null)
                  ? null
                  : Image.asset('assets/images/Dp.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () async {
                    XFile? xfile =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    setState(() {
                      fileImage = File(xfile!.path);
                    });
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 30,
                    color: Colors.blue,
                  )),
              IconButton(
                  onPressed: () async {
                    XFile? xfile = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      fileImage = File(xfile!.path);
                    });
                  },
                  icon: const Icon(
                    Icons.image,
                    size: 30,
                    color: Colors.blue,
                  )),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 330,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Update',
                        style: TextStyle(fontSize: 15,color: Colors.white),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}