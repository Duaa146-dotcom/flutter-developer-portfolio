class FaqItem {
  final String question;
  final String answer;

  const FaqItem({required this.question, required this.answer});
}

final List<FaqItem> appFaqs = [
  const FaqItem(
    question: 'ما التقنيات التي تستخدمها في تطوير المشاريع؟',
    answer:
        'أعتمد بشكل أساسي على Flutter وDart لتطوير تطبيقات الجوال ومواقع الويب، مع استخدام PHP وMySQL وREST API عند الحاجة إلى Backend وقاعدة بيانات.',
  ),
  const FaqItem(
    question: 'هل يمكن تطوير تطبيق يعمل على Android وiOS؟',
    answer:
        'نعم، يمكن تطوير تطبيق واحد باستخدام Flutter ليعمل على Android وiOS مع الحفاظ على تجربة استخدام متناسقة بين المنصتين.',
  ),
  const FaqItem(
    question: 'هل تقدم خدمات تطوير مواقع الويب؟',
    answer:
        'نعم، أطور مواقع وتطبيقات ويب باستخدام Flutter Web مع تصميم متجاوب يتناسب مع الجوال والتابلت والكمبيوتر.',
  ),
  const FaqItem(
    question: 'هل يمكن ربط التطبيق بقاعدة بيانات وAPI؟',
    answer:
        'نعم، يمكن ربط التطبيقات بواجهات REST API وقواعد البيانات بحسب متطلبات المشروع.',
  ),
  const FaqItem(
    question: 'هل يمكنني طلب تصميم خاص لمشروعي؟',
    answer:
        'نعم، يتم تنفيذ واجهة المشروع بما يتناسب مع فكرة المشروع وهوية العلامة التجارية واحتياجات المستخدمين.',
  ),
  const FaqItem(
    question: 'كم يستغرق تنفيذ المشروع؟',
    answer:
        'تختلف مدة التنفيذ حسب حجم المشروع وعدد المميزات المطلوبة. بعد فهم تفاصيل المشروع يمكن تحديد مدة تنفيذ تقديرية مناسبة.',
  ),
  const FaqItem(
    question: 'كيف أبدأ مشروعي؟',
    answer:
        'يمكنك التواصل من خلال نموذج التواصل وإرسال فكرة المشروع والمتطلبات الأساسية، وبعد ذلك يتم مناقشة التفاصيل والخطوات القادمة.',
  ),
];
