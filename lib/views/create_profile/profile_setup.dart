import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infoklub/app/constants.dart';
import 'dart:io';

import 'package:infoklub/app/theme.dart';
import 'package:infoklub/widgets/custom_input.dart';

import '../../app/routes.dart';
import '../../widgets/custom_button.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  File? _selectedImage;
  String _selectedFlag = '🇧🇩';
  String _selectedCode = '880';
  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, // To pick from the gallery
        imageQuality: 80, // Compress the image to reduce file size
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      // Handle error gracefully
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to pick image: $e"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.06,
            bottom: screenHeight * 0.02,
            left: screenWidth * 0.03,
            right: screenWidth * 0.03,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Profile Set Up",
                  style: AppTheme.getResponsiveTextTheme(context).labelMedium,
                ),
                Text(
                  "Add Your Details",
                  style: AppTheme.getResponsiveTextTheme(context).labelLarge,
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppTheme.skyBlue,
                        radius: 60.0,
                        backgroundImage: _selectedImage != null
                            ? FileImage(_selectedImage!)
                            : null,
                        child: _selectedImage == null ? personImage : null,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.whiteColor,
                              width: 2.0,
                            ),
                          ),
                          child: GestureDetector(
                            //update image here
                            child: const Icon(
                              Icons.edit,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      personName,
                      style:
                          AppTheme.getResponsiveTextTheme(context).labelMedium,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    GestureDetector(
                      //name update here
                      child: const Icon(Icons.edit),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email Address",
                        textAlign: TextAlign.start,
                        style: AppTheme.getResponsiveTextTheme(context)
                            .displaySmall,
                      ),
                      const SizedBox(height: 6.0),
                      const CustomInput(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Phone Number",
                        textAlign: TextAlign.start,
                        style: AppTheme.getResponsiveTextTheme(context)
                            .displaySmall,
                      ),
                      const SizedBox(height: 6.0),
                      CustomInput(
                        keyboardType: TextInputType.phone,
                        hintText: "$_selectedCode 726-0592",
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        hintTextColor: Colors.grey,
                        leftWidget: GestureDetector(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              onSelect: (Country country) {
                                if (kDebugMode) {
                                  print(
                                      'Selected country: ${country.displayName}');
                                }
                                setState(() {
                                  _selectedFlag = country.flagEmoji;
                                  _selectedCode =
                                      '+${country.phoneCode}'; // Set the country code
                                });
                              },
                            );
                          },
                          child: Text(
                            _selectedFlag, // Display emoji directly
                            style: const TextStyle(fontSize: 24), // Adjust size
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Date of Birth",
                        textAlign: TextAlign.start,
                        style: AppTheme.getResponsiveTextTheme(context)
                            .displaySmall,
                      ),
                      const SizedBox(height: 6.0),
                      const CustomInput(
                        hintText: '24 Oct 2000',
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "City",
                        textAlign: TextAlign.start,
                        style: AppTheme.getResponsiveTextTheme(context)
                            .displaySmall,
                      ),
                      const SizedBox(height: 6.0),
                      const CustomInput(
                        hintText: 'City',
                        keyboardType: TextInputType.streetAddress,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Bio",
                        textAlign: TextAlign.start,
                        style: AppTheme.getResponsiveTextTheme(context)
                            .displaySmall,
                      ),
                      const SizedBox(height: 6.0),
                      CustomInput(
                        height: screenHeight * 0.20,
                        hintText: 'About',
                        keyboardType: TextInputType.multiline,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10.0),
                      CustomButton(
                        text: "Connect with",
                        onPressed: () {
                          //connect with linkedln
                        },
                        image: Image.asset(
                          "lib/assets/Images/linkedlnlogo.png",
                          height: 40,
                          width: 60,
                        ),
                        color: AppTheme.whiteColor,
                        textColor: AppTheme.secondaryColor,
                        borderColor: AppTheme.secondaryColor,
                        borderRadius: 10.0,
                      ),
                      const SizedBox(height: 10.0),
                      CustomButton(
                        text: "Next",
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.addlinks);
                        },
                        color: AppTheme.secondaryColor,
                        borderRadius: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
