import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/animate_progress.dart';
import 'package:portfolio/components/area_information.dart';
import 'package:portfolio/components/coding_progress.dart';
import 'package:portfolio/components/my_info.dart';
import 'package:portfolio/constants.dart';

import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const MyInfo(),
          Expanded(
          child: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                const AreaInformation(title: 'Email', text: 'manishsaini97285@gmail.com'),
                const AreaInformation(title: 'DOB', text: '04-September-1997'),
                const AreaInformation(title: 'City', text: 'Ambala,Naraingarh'),
                const AreaInformation(title: 'Residence', text: 'Haryana,India'),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding,top: defaultPadding/2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Skills",style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Expanded(child: AnimatedProgressIndicator(percentage: 0.95,text: "Flutter",)),
                    SizedBox(width: defaultPadding),
                    Expanded(child: AnimatedProgressIndicator(percentage: 0.9,text: "Riverpod",)),
                    SizedBox(width: defaultPadding),
                    Expanded(child: AnimatedProgressIndicator(percentage: 0.95,text: "GetX",)),

                  ],
                ),
                const SizedBox(height: defaultPadding),
                const Row(
                  children: [

                    Expanded(child: AnimatedProgressIndicator(percentage: 0.95,text: "Clean Architecture",)),
                    SizedBox(width: defaultPadding),
                    Expanded(child: AnimatedProgressIndicator(percentage: 0.90,text: "Firebase",)),
                    SizedBox(width: defaultPadding),
                    Expanded(child: AnimatedProgressIndicator(percentage: 0.50,text: "Nest js",)),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                const Row(
                  children: [
                    Expanded(child: AnimatedProgressIndicator(percentage: 0.95,text: "Mongo db",)),
                    SizedBox(width: defaultPadding),
                    Expanded(child: AnimatedProgressIndicator(percentage: 0.90,text: "Socket",)),
                    SizedBox(width: defaultPadding),
                    Expanded(child: AnimatedProgressIndicator(percentage: 0.90,text: "Pub dev",)),

                  ],
                ),
                const SizedBox(height: defaultPadding/2),
                const Divider(),
                //Coding portion
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding,top: defaultPadding/2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Coding",style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  ),
                ),
                const Column(
                  children: [
                    CodingProgress(text: "Dart",percentage: 0.95),
                    SizedBox(width: defaultPadding),
                    CodingProgress(text: "Kotlin",percentage: 0.85),
                    SizedBox(width: defaultPadding),
                    CodingProgress(text: "Java",percentage: 0.7),
                    SizedBox(width: defaultPadding),
                    CodingProgress(text: "JavaScript",percentage: 0.7),
                  ],
                ),
                const Divider(),
                //Knowledge portion
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding,top: defaultPadding/2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Knowledge",style: Theme.of(context).textTheme.titleMedium,),
                        ],
                      ),
                    ),
                    const KnowledgeWidget(text: 'Flutter, dart'),
                    const SizedBox(height: defaultPadding/2,),
                    const KnowledgeWidget(text: 'Pub Dev Package'),
                    const SizedBox(height: defaultPadding/2,),
                    const KnowledgeWidget(text: 'Google APIS-MAPS'),
                    const SizedBox(height: defaultPadding/2,),
                    const KnowledgeWidget(text: 'Social Authentication'),
                    const SizedBox(height: defaultPadding/2,),
                    const KnowledgeWidget(text: 'Github,Github Action,CI/CD'),
                    const SizedBox(height: defaultPadding/2,),
                    const KnowledgeWidget(text: 'API TOOL-Postman'),
                    const SizedBox(height: defaultPadding/2,),
                    const KnowledgeWidget(text: 'REST-API'),
                    const SizedBox(height: defaultPadding/2,),
                    const KnowledgeWidget(text: 'Third Party Libraries'),
                    const SizedBox(height: defaultPadding/2,),
                    const KnowledgeWidget(text: 'GooglePlay Store App Publication'),
                    const SizedBox(height: defaultPadding/2,),
                    const KnowledgeWidget(text: 'AppStore App Publication'),
                    const SizedBox(height: defaultPadding/2,),
                    const KnowledgeWidget(text: 'Send Bird - Video call & Live Stream'),

                    const SizedBox(height: defaultPadding/2,),
                  ],
                ),
                const Divider(),
                TextButton(onPressed:(){
                  Uri url = Uri.parse('https://drive.google.com/file/d/1p24ZbIfTpr5qSb2rXGPfABkNRLAJcLw6/view?usp=drivesdk');
                  _launchUrl(url);

                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("DOWNLOAD CV",style: Theme.of(context).textTheme.titleMedium,),
                    const SizedBox(width:defaultPadding/2),
                    SvgPicture.asset('assets/icons/download.svg',

                      width: 14,height: 14,color: Colors.white,)
                  ],
                )),
                const SizedBox(height: defaultPadding/2),
                Container(
                  margin: const EdgeInsets.all(defaultPadding/2),
                  padding: const EdgeInsets.all(defaultPadding/2),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(defaultPadding/2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(
                         0,0
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(onTap:(){
                        Uri url = Uri.parse('https://www.linkedin.com/in/manish-kumar-6256a0196');
                        _launchUrl(url);
                      }, child: SvgPicture.asset("assets/icons/linkedin.svg",                                color:primaryColor ,
                          height:30,width: 30)),
                      GestureDetector(onTap:(){
                        Uri url = Uri.parse('https://github.com/Manish-dev200');
                        _launchUrl(url);
                      },child: SvgPicture.asset("assets/icons/github.svg",                                color:primaryColor ,
                          height:24,width: 24)),
                      // GestureDetector(onTap:(){
                      //   Uri url = Uri.parse('https://stackoverflow.com/users/12035507/jatin-sharma');
                      //   _launchUrl(url);
                      // },child: SvgPicture.asset("assets/icons/stack_overflow.svg",height:30,width: 30)),
                      // GestureDetector(onTap:(){
                      //   Uri url = Uri.parse('https://twitter.com/jbhardwaj304');
                      //   _launchUrl(url);
                      // },child: SvgPicture.asset("assets/icons/twitter.svg",height:24,width: 24)),

                    ],
                  ),
                )
              ],
            ),)
          ))
        ],
      ),
    );
  }


  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class KnowledgeWidget extends StatelessWidget {
  const KnowledgeWidget({Key? key,required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SvgPicture.asset("assets/icons/tick.svg",height: 14,width: 14),
        const SizedBox(width: defaultPadding/4),
        Flexible(child: Text(text,style: Theme.of(context).textTheme.titleSmall,overflow: TextOverflow.ellipsis,)),
      ],
    );
  }
}













