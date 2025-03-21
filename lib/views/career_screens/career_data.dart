import 'package:flutter/material.dart';
import 'package:infoklub/widgets/custom_button.dart';
import 'package:infoklub/app/theme.dart';
import '../../app/routes.dart';
import '../../widgets/custom_form.dart';

class CareerData extends StatelessWidget {
  const CareerData({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<CareerDataViewmodel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final TextEditingController degreeController = TextEditingController();
    final TextEditingController institutionController = TextEditingController();
    final TextEditingController totalGradeController = TextEditingController();
    final TextEditingController scoreGradeController = TextEditingController();
    final TextEditingController percentageController = TextEditingController();
    final TextEditingController achievementsController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'lib/assets/Images/backarrow.png',
            color: AppTheme.purpleAccent,
            height: 22,
            width: 22,
          ),
        ),
        title: Text(
          "Add Career Information",
          style: AppTheme.getResponsiveTextTheme(context).labelLarge,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.02,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight, // Ensures proper layout
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 0.0, top: 0.0),
                    child: CustomButton(
                      text: 'Add Experience',
                      color: const Color.fromARGB(238, 243, 243, 243),
                      borderColor: const Color.fromARGB(205, 228, 228, 228),
                      borderRadius: 10,
                      textColor: AppTheme.blackColor,
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        print("Add career Button Pressed");
                      },
                    ),
                  ),
                  //take info from user
                  ReusableForm(
                    degreeController: degreeController,
                    institutionController: institutionController,
                    totalGradeController: totalGradeController,
                    scoreGradeController: scoreGradeController,
                    percentageController: percentageController,
                    achievementsController: achievementsController,
                    onFileUpload: () {
                      print("File upload clicked");
                    },
                    onScanDocuments: () {
                      print("Scan documents clicked");
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  bottom: 20, left: 10, right: 10, top: 0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.mdcndata);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.purpleAccent,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
