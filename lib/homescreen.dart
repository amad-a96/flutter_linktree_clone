import 'package:flutter/material.dart';
import 'package:flutter_application_1/config.dart';

import 'package:url_launcher/url_launcher.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(child: Profile()),
            Container(color: Colors.black12, child: Text("looking for a job")),
            SizedBox(
              height: 20,
            ),
            Text(name),
            Text(title),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 15,
              endIndent: 15,
              color: Colors.grey,
            ),
            Text(bio),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: links.length,
                itemBuilder: (context, index) {
                  return linkCard(index);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(child: phoneCard(phone)),
            )
          ],
        ),
      ),
    );
  }

  Widget phoneCard(phone) {
    return InkWell(
      child: Row(
        children: [
          Container(
              height: 40,
              width: 40,
              color: Colors.green,
              child: Icon(Icons.phone)),
        ],
      ),
      onTap: () => _launchURL(phone),
      splashColor: Colors.green,
    );
  }

  Widget linkCard(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Center(child: Text(links[index].name.toString())),
          onTap: () => _launchURL(links[index].url),
          splashColor: Colors.amber,
        ),
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 190.0,
        height: 190.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(
                    "https://illumesense.com/resources/illumesense/style/img/website/profile-picture-blanks/male-profile.jpg"))));
  }
}
