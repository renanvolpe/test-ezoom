import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/core/style/style.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          30.sizeH,
          Text("A summary about me", style: Style.defaultTextStyle.copyWith(fontSize: 24), textAlign: TextAlign.center),
          15.sizeH,
          ListTile(
            title: Text("Renan Pereira Volpe", style: Style.defaultTextStyle.copyWith(fontSize: 18)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("I´m Mobile developer with Flutter", style: Style.defaultTextStyle.copyWith(fontSize: 14)),
                Text("I have been working with mobile for 3 years",
                    style: Style.defaultTextStyle.copyWith(fontSize: 14)),
              ],
            ),
            trailing: CircleAvatar(
              radius: 25,
              child: ClipOval(child: Image.asset("assets/images/fotoPerfil.jpg")),
            ),
          ),
          Column(
            children: [
              15.sizeH,
              Text("My experiences:", style: Style.defaultTextStyle.copyWith(fontSize: 22)),
              15.sizeH,
              ListTile(
                title: Text("Desenvolvedor Flutter - PJ (8 months) - Estudologia",
                    style: Style.defaultTextStyle.copyWith(fontSize: 18)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "The project consisted of an application from scratch for an education platform. Various features related to student studies were created, such as authentication, question resolution and simulation, message-based classes, video-recorded classes, among other features. The technologies worked on were Flutter, Dart, BLoC (and Cubit), Push Notification, Flutter Modular, API Consume (with Dio), WEB Socket and video Player",
                        style: Style.defaultTextStyle.copyWith(fontSize: 14)),
                  ],
                ),
              ),
              15.sizeH,
              ListTile(
                title: Text("Tech Lead Flutter - Master class (5 months, but weekly) - UNIFESP",
                    style: Style.defaultTextStyle.copyWith(fontSize: 18)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "I worked as a Tech Lead with undergraduate students to help them with mistakes, new technologies, compliance with defined standards, among other points that were requested by the team. System for local agricultural producers to meet with potential buyers. We use: API consumption; BLoC state management; FlutterMap location API; Versioning with Git with Pull Requests; Use of Shared Preferences; API testing; Singleton Pattern for Dependency Injection; It is Kanban(weekly)",
                        style: Style.defaultTextStyle.copyWith(fontSize: 14)),
                  ],
                ),
              ),
              15.sizeH,
              ListTile(
                title: Text("Flutter developer - CLT (1 year and 2 months) - B2ML",
                    style: Style.defaultTextStyle.copyWith(fontSize: 18)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Delivery and urban transport app. In this project, I worked using Flutter and Dart to consume an API to create the screens and execute the functionalities desired by the client. Project features: BLoC state management; Differentiation of environments with Flavor; Organization of files via modules; Wireframes created by Figma; Use of cell phone location and address using latitude and longitude; and diversity of packages to adapt the code. In the time available, activities were studied, including: GoRouter; Unit test; Widget test; MockApi; Widget life cycles; and Integration Tests",
                        style: Style.defaultTextStyle.copyWith(fontSize: 14)),
                  ],
                ),
              ),
              15.sizeH,
              ListTile(
                title: Text("Flutter developer - Freelancer (5 months) - Sypsa",
                    style: Style.defaultTextStyle.copyWith(fontSize: 18)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "I worked on implementing several functionalities of a finance system for the company. Using API, Build Runner and BLoC state manager in addition to several implemented libraries using MVC architecture. I also upload app to PlayStore",
                        style: Style.defaultTextStyle.copyWith(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
