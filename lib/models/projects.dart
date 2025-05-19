import 'package:portfolio/content/project_content.dart';

class Projects{
  final String? title,description,animationMessage,projectType,projectLink,longContent,iosLink;

  Projects({this.title,this.description,this.animationMessage,this.projectType,this.projectLink,this.longContent,this.iosLink});
}

List<Projects> demoProjects=[

  Projects(
      title: "Vivid Panel",
      animationMessage: "Indie Comic Series App",
      projectType: "Flutter",
      projectLink: "https://play.google.com/store/apps/details?id=com.app.vividpanel",
      iosLink:'https://apps.apple.com/in/app/vivid-panel/id1639112308' ,
      longContent: ProjectContent.vividPanel,
    description: ProjectContent.vividPanel,
  ),

  Projects(
      title: "Help Quest",
      animationMessage: "Environmental awareness and emergency assistance App",
      projectType: "Flutter",
      longContent: ProjectContent.helpQuest,
      projectLink: "https://play.google.com/store/apps/details?id=com.app.helpquest",
    description: ProjectContent.helpQuest,
  ),

  Projects(
    title: "The Technical Traders Mobile",
    animationMessage: "Trade and invest with confidence everywhere you go",
    projectType: "Flutter",
    longContent: ProjectContent.technicalTraders,
    projectLink: "https://play.google.com/store/apps/details?id=techincaltraders.technicaltraders&hl=en_IN",
    iosLink: "https://apps.apple.com/in/app/the-technical-traders-mobile/id1506870453",
    description: ProjectContent.technicalTraders,
  ),

  Projects(
    title: "Rosary Experience: 3000 Videos",
    animationMessage: "A Video Streaming Platform for the Holy Rosary!",
    projectType: "Flutter",
    longContent: ProjectContent.rosaryExp,
    projectLink: "https://play.google.com/store/apps/details?id=com.app.rosaryexperience&hl=en_IN",
    iosLink: "https://apps.apple.com/us/app/rosary-experience-3000-videos/id1515670052",
    description: ProjectContent.rosaryExp,
  ),
  Projects(
    title: "TaskNexus",
    animationMessage: "Web App- Backend Developer (NestJS) .",
    projectType: "Nest Js",
    longContent: ProjectContent.taskNexus,
    projectLink: "https://tasknexus.infodevbox.com",
    description: ProjectContent.taskNexus,
  ),


  Projects(
    title: "SnapSeats",
    animationMessage: "Restaurant Table Seats Booking App",
    projectType: "Flutter",
    longContent: ProjectContent.snapSeats,
    projectLink: "https://play.google.com/store/apps/details?id=com.app.snapseats",
    iosLink: "https://snapseats.com/",
    description: ProjectContent.snapSeats,
  ),
  Projects(
    title: "Admit Early",
    animationMessage: "Designed and developed a student decision-making platform with live video calls.",
    projectType: "Flutter",
    longContent: ProjectContent.admitEarly,
    projectLink: "https://play.google.com/store/apps/details?id=com.app.admitearly",
    description: ProjectContent.admitEarly,
  ),
  Projects(
    title: "Barteroll",
    animationMessage: "Designed and developed a student decision-making platform with live video calls.",
    projectType: "Flutter",
    longContent: ProjectContent.barteroll,
    projectLink: "https://play.google.com/store/apps/details?id=com.app.barteroll",
    iosLink: "https://apps.apple.com/in/app/barteroll/id1619734886",
    description: ProjectContent.barteroll,
  ),

];