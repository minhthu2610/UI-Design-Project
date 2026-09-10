class ResourceModel {
  final String id;
  final String title;
  final String type; // 'PDF', 'ZIP', 'DOCX'
  final String url;
  final String fileSize;

  const ResourceModel({
    required this.id,
    required this.title,
    required this.type,
    required this.url,
    required this.fileSize,
  });
}
