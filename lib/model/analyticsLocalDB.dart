// Centralized DB

// Analytics

// TODO: Wellness Page
String behaviorRecommendationForStudent =
    "If you ever feel like you are not keeping pace together with your peers, remember that is not the permanent scenario.In such scenario we recommend  you to eat alimental food, take eight hours of sleep and exercise daily so as maintain a healthy lifestyle. Create a routine for your daily activities as following a routine might help you in bringing things back on track. Lastly, don't forget to smile, as a result of it is the best remedy that you're going to ever notice.";

// TODO:  Professional Interest

// Summary for professional Interest
String professionalInterestSummary =
    "As per the analysis we have found that you have proficiency in science and technology. So we highly recommend you to keep working. You can come with great ideas and bring a positive change in the society.";

// Data for Professional Interest main graph
Map<String, double> professionalInterestsMainPageData = {
  'Space science': 97.3,
  'Astrophysics': 77.6,
  'Computer science': 97.3,
  'Literature': 25.7,
  'Mathematics': 95.6,
};

List<String> getSkills() {
  List<String> result = [];
  result = professionalInterestsMainPageData.keys.toList();
  return result;
}

// TODO: MyReport Page
String qualitiesSummary =
    "You posses great interpersonal skills. You are doing great with your  academics as well. Maintain a good balance and keep growing.And do remember hardwork pays off.";

String behaviorSummary =
    "Based upon your response and our analysis, you are doing great in both academics and Co curricular activities. For most people, this kind of response is likely to bring happiness and peace. However, you may benefit from a consultation with a trianed professional if in case you experience difficulties in daily functioning in near future.";

String academicsSummary =
    "As per the analysis we have found that you have worked really hard to achieve good grades and came up with a nice working plan. So we highly recommend you to follow the same in the upcoming semester. You will surely come up with better results in the coming exams also.";

String learningStyleSummary =
    "As per the analysis we have found that you are an all rounder student. You are doing great in Mathematics and physics and we really appreciate your efforts. You are also a good sports person. We want you to make a schedule and give required attention to specific tasks.";

String performanceProjectionSummary =
    "We have checked your overall response of the quiz and other responses and gathered that your academic performance is going pretty well and you are doing great with co curricular activities. Keep it up";
