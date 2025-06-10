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
      title: 'BMI Calculator',
      description:
          'Track your health effortlessly with our beautifully designed BMI Calculator app. Featuring an intuitive and responsive UI, it automatically calculates your Body Mass Index (BMI) as you input your height and weight—no extra taps needed. Stay consistent with your fitness goals by logging your BMI daily and monitoring trends over time through a clean and user-friendly dashboard. Whether you\'re maintaining, gaining, or losing weight, this app makes health tracking simple, accurate, and visually engaging.',
      isFeatured: true,
      isDownloadable: false,
      githubLink: '',
      downloadUrl: '',
      images: [],
      isOpenSource: false,
      thumbnail: '',
      tags: [
        'Flutter',
        'Dart',
        'Firebase',
        'Cloud Firestore',
        'Beautiful UI',
        'Health',
      ],
    );

    await FirebaseFirestore.instance
        .collection('projects')
        .doc('BMI Calculator') // <-- Your custom document ID
        .set(project.toJson());
  }
}
