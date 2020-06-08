import 'package:firebase_storage/firebase_storage.dart';
import 'package:adota_pet/widgets/copyright_footer.dart';
import 'package:flutter/material.dart';
import 'package:adota_pet/widgets/default_page.dart';
import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:flutter/cupertino.dart';


class DenouncePage extends StatefulWidget {

  static const String routeName = '/denounce';

  @override
  _DenouncePageState createState() => _DenouncePageState();
}

class _DenouncePageState extends State<DenouncePage> {
  @override

  List<UploadJob> _profilePictures = [];

  Widget build(BuildContext context) {

    var widgetsList = <Widget> [
      // _list(),

      _test(),

      new CopyrightFooter()
    ];

    return DefaultPage(
      back: true,
      search: false,
      elements: widgetsList,
      title: 'Denúncia',
    );
  }

  Widget _test() {

    /*return new PictureUploadWidget(
      onPicturesChange: profilePictureCallback,
      initialImages: _profilePictures,
      settings: PictureUploadSettings(onErrorFunction: onErrorCallback),
      buttonStyle: const PictureUploadButtonStyle(),
      buttonText: 'Enviar Imagem',
      enabled: true,
    );
    */
  }
  /*

  void onErrorCallback(error, stackTrace) {
    print(error);
    print(stackTrace);
  }

  void profilePictureCallback(
    {List<UploadJob> uploadJobs, bool pictureUploadProcessing}) {
    _profilePictures = uploadJobs;
  }

  Future<StorageReference> uploadProfilePicture(File image, int id) async {
    StorageReference imgRef = FirebaseStorage.instance.ref()
      .child('/Uploads/' + id.toString() + '_800.jpg');

    // start upload
    // StorageUploadTask uploadTask = imgRef.putFile(image, new StorageMetadata(contentType: 'image/jpg'));

    // wait until upload is complete
    //await uploadTask.onComplete;

    // return imgRef;
  }

  Future<void> deleteProfilePicture(StorageReference oldUpload) async {
    // ask backend to transform images
    await oldUpload.delete();
  }
  */
}
