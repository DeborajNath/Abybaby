import 'package:demoproject/utils/constants/dimensions.dart';
import 'package:flutter/material.dart';

class NavigationDrawers extends StatefulWidget {
  const NavigationDrawers({super.key});

  @override
  State<NavigationDrawers> createState() => _NavigationDrawersState();
}

class _NavigationDrawersState extends State<NavigationDrawers> {
  String selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    double widthP = Dimensions.myWidthThis(context);
    // double heightP = Dimensions.myHeightThis(context);
    double heightF = Dimensions.myHeightFThis(context);
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 20 * widthP, top: 5 * heightF, right: 20 * widthP),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      height: 58 * widthP,
                      width: 58 * widthP,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50 * widthP),
                          color: Colors.blue),
                    ),
                    SizedBox(
                      width: 20 * heightF,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: (14 * widthP),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'lorem_teal_falcon',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: (14 * widthP),
                              ),
                              overflow:
                                  TextOverflow.ellipsis, // Handle long names
                              maxLines: 1,
                            ),
                            Icon(
                              Icons.copy,
                              size: 10 * widthP,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 290 * heightF,
                  width: 297 * widthP,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 18, 172, 15),
                    borderRadius: BorderRadius.circular(50 * widthP),
                    border: Border.all(
                      color: const Color.fromARGB(255, 146, 37, 255),
                      width: 1.0,
                    ),
                  ),
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (18 * widthP),
                  ),
                ),
                SizedBox(
                  height: 20 * heightF,
                ),
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (18 * widthP),
                  ),
                ),
                SizedBox(
                  height: 20 * heightF,
                ),
                Text(
                  'Likes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (18 * widthP),
                  ),
                ),
                SizedBox(
                  height: 20 * heightF,
                ),
                Text(
                  'Dislikes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (18 * widthP),
                  ),
                ),
                SizedBox(
                  height: 20 * heightF,
                ),
                ExpansionTile(
                  title: Text(
                    'Languages',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: (18 * widthP),
                    ),
                  ),
                  children: [
                    // Submenu with a list of languages
                    ListView(
                      shrinkWrap: true,
                      children: [
                        buildLanguageItem('English'),
                        buildLanguageItem('Hindi'),
                        buildLanguageItem('Bengali'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * heightF,
                ),
                Text(
                  'Saved Posts',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (18 * widthP),
                  ),
                ),
                SizedBox(
                  height: 20 * heightF,
                ),
                Text(
                  'New Post',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (18 * widthP),
                  ),
                ),
                SizedBox(
                  height: 20 * heightF,
                ),
                Text(
                  'LoremIpsum',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (18 * widthP),
                  ),
                ),
                SizedBox(
                  height: 20 * heightF,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (18 * widthP),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLanguageItem(String language) {
    return ListTile(
      title: Text(
        language,
        style: TextStyle(
          color: language == selectedLanguage ? Colors.blue : Colors.black,
          fontSize: (14),
        ),
      ),
      onTap: () {
        // Handle language selection
        setState(() {
          selectedLanguage = language;
        });
        Navigator.pop(context); // Close the drawer
      },
    );
  }
}
