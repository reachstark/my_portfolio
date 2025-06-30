import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/model/project_model.dart';

class FirebaseController extends GetxController {
  static FirebaseController get to => Get.find();

  RxList<ProjectModel> projects = <ProjectModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    readProjects();
  }

  void readProjects() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('projects')
        .get();
    projects.clear();
    for (var doc in snapshot.docs) {
      projects.add(ProjectModel.fromJson(doc.data()));
    }
    projects.refresh();
  }

  void createNewProject() async {
    final project = ProjectModel(
      title: 'Simple QR Code Generator',
      description:
          'A simple QR code generator app that can generate QR codes for any text with customization options, including color, embedded logo, and more. With responsive design built in, the app is perfect for both mobile and desktop users. The app is open-source and free to use.',
      isFeatured: true,
      isDownloadable: true,
      githubLink: 'https://github.com/reachstark/simple_qr_code_generator',
      downloadUrl: 'https://mega.nz/folder/skE3BIAB#5IFIvVhk1FBy6OEMlkSSmQ',
      images: [
        'https://i.postimg.cc/rFtsCHFj/Android-QR.png',
        'https://i.postimg.cc/BbR6fTN2/Android-QR-logo.png',
        'https://i.postimg.cc/52d0PmXV/Android-QR-share.png',
        'https://i.postimg.cc/FF61Svm1/Windows-QR.png',
      ],
      isOpenSource: true,
      thumbnail: 'https://i.postimg.cc/VLt8Gr0Q/QR-Thumbnail.png',
      tags: [
        'Flutter',
        'Dart',
        'Free',
        'Ad-free',
        'Beautiful UI',
        'Open-source',
        'Responsive',
        'Android',
        'Windows',
      ],
    );

    await FirebaseFirestore.instance
        .collection('projects')
        .doc(project.title)
        .set(project.toJson());
  }
}
