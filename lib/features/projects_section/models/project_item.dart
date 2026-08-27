class ProjectItem {
  final String title;
  final List<String> technologies;
  final String imagePath;

  const ProjectItem({
    required this.title,
    required this.technologies,
    required this.imagePath,
  });
}

final List<ProjectItem> appProjects = [
  const ProjectItem(
    title: 'JobSy Platform',
    technologies: ['Flutter Web', 'REST API', 'PHP'],
    imagePath: 'assets/images/project1.jpg',
  ),
  const ProjectItem(
    title: 'EDARA System',
    technologies: ['Flutter', 'Dart', 'Figma'],
    imagePath: 'assets/images/project2.png',
  ),
  const ProjectItem(
    title: 'Super Admin Dashboard',
    technologies: ['Flutter', 'Firebase', 'State Management'],
    imagePath: 'assets/images/project3.jpg',
  ),
];
