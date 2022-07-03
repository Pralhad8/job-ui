import 'package:flutter/material.dart';
import 'package:job_ui/util/recent_job_card.dart';

import 'util/job_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List jobForYou = [
    ['Uber', 'UI Designer', 'lib/icons/uber.jpg', 45],
    ['Google', 'Product Dev', 'lib/icons/google.jpg', 12],
    ['Uber', 'Software Eng', 'lib/icons/apple.jpg', 32],
  ];
  final List recentJobs = [
    ['Nike', 'Web Designer', 'lib/icons/uber.jpg', 45],
    ['Google', 'Product Manager', 'lib/icons/google.jpg', 12],
    ['Apple', 'Software Eng', 'lib/icons/apple.jpg', 32],
    ['Apple', 'Software Eng', 'lib/icons/apple.jpg', 32],
    ['Apple', 'Software Eng', 'lib/icons/apple.jpg', 32],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 50,
        ),
        //app bar
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
              height: 45,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white),
              child: Image.asset('lib/icons/drawer_icon.jpg')),
        ),
        const SizedBox(
          height: 50,
        ),

        //discover a new path
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'Discover a New Path',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        // search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 30,
                          child: Image.asset('lib/icons/search2.png'),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search for a job',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset('lib/icons/filter.png'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        //for you -> job cards
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'For You',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        Container(
          height: 140,
          child: ListView.builder(
              itemCount: jobForYou.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return JobCard(
                  companyName: jobForYou[index][0],
                  jobTitle: jobForYou[index][1],
                  logoImagePath: jobForYou[index][2],
                  hourlyRate: jobForYou[index][3],
                );
              }),
        ),
        SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'Recently Added',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              itemCount: recentJobs.length,
              itemBuilder: (context, index) {
                return RecentJobCard(
                    companyName: recentJobs[index][0],
                    jobTitle: recentJobs[index][1],
                    logoImagePath: recentJobs[index][2],
                    hourlyRate: recentJobs[index][3]);
              }),
        )),
        // recently add -> new tiles
      ]),
    );
  }
}
