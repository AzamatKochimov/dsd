import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Prifile",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 160,
                width: 160,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Image.asset(
                  'assets/images/user.png',
                  fit: BoxFit.fill,
                ),
              ),
              const Text(
                "Zikrulloh Akramov",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Lil Bro",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {},
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFF8EE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                                  child: const Icon(Icons.person, color: Color(0xffFF9385),),
                        ),
                      ),
                      Spacer(),
                      const Text("Edit Profile", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                child: InkWell(
                  onTap: () {},
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFF8EE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                                  child: const Icon(Icons.settings, color: Color(0xffFF9385),),
                        ),
                      ),
                      Spacer(),
                      const Text("Settings", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),              
              const SizedBox(height: 30,),
              Container(
                child: InkWell(
                  onTap: () {},
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFF8EE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                                  child: const Icon(Icons.feed_rounded, color: Color(0xffFF9385),),
                        ),
                      ),
                      Spacer(),
                      const Text("Help Center", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),              
              const SizedBox(height: 30,),
              Container(
                child: InkWell(
                  onTap: () {},
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFF8EE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                                  child: const Icon(Icons.logout_rounded, color: Color(0xffFF9385),),
                        ),
                      ),
                      Spacer(),
                      const Text("Log Out", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),              

            
            ],
          ),
        ),
      ),
    );
  }
}
