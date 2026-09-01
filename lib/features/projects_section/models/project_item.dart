class ProjectItem {
  final String title;
  final List<String> technologies;
  final String imagePath;
  final String url;

  const ProjectItem({
    required this.title,
    required this.technologies,
    required this.imagePath,
    required this.url,
  });
}

final List<ProjectItem> appProjects = [
  const ProjectItem(
    title: 'JOBSY Platform',
    technologies: ['Flutter', 'Dart', 'REST API', 'PHP', 'MYSQL'],
    imagePath: 'assets/images/project3.jpg',
    url: 'https://jobsy-website.freehosting.dev/',
  ),
  const ProjectItem(
    title: 'EDARA SYSTEM',
    technologies: ['Flutter', 'Dart', 'REST API', 'HIVE', 'PHP', 'MYSQL'],
    imagePath: 'assets/images/project2.png',
    url: 'https://edara-website.freehosting.dev/',
  ),
  const ProjectItem(
    title: 'Super Admin Dashboard',
    technologies: ['Flutter Web', 'Dart', 'REST API', 'PHP', 'MYSQL'],
    imagePath: 'assets/images/project1.jpg',
    url: 'https://edara-dashboard-website.freehosting.dev/',
  ),
];
