import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Reusables/UIText.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../provider/delivery_map_provider.dart';

class DeliveryMapBody extends StatefulWidget {
  final bool isViewing;

  const DeliveryMapBody({super.key, required this.isViewing});

  @override
  State<DeliveryMapBody> createState() => _DeliveryMapBodyState();
}

class _DeliveryMapBodyState extends State<DeliveryMapBody> {
  int currentStatus = 3; // Simulated API call result

  // Titles for each step
  final List<String> stepTitles = [
    'Your order has been received',
    'Your order has been picked up for delivery',
    'The package is now in transit. you will receive the parcel shortly',
    'Order Delivered!',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DeliveryMapProvider>(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Consumer<DeliveryMapProvider>(
            builder: (context, provider, child) {
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: provider.currentPosition ?? LatLng(0, 0),
                  zoom: 14,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                polylines: Set<Polyline>.of(provider.polylines.values),
                onMapCreated: (GoogleMapController controller) {
                  if (!provider.mapController.isCompleted) {
                    provider.mapController.complete(controller);
                  }
                },
              );
            },
          ),
          if (!widget.isViewing)
            Positioned(
              bottom: 20,
              left: 20,
              child: ElevatedButton(
                onPressed: () {
                  // End the delivery
                  provider.isDeliveryOngoing = false;
                  // Optionally, you can perform additional actions here
                  Navigator.pop(context);
                },
                child: Text('End Delivery'),
              ),
            ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              // style: ButtonStyle(),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        width: screenWeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.bgWhite,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 6,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.softTxt2,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage("assets/foodImg.png")),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      UiText(
                                          text: "Food Dot",
                                          textColor: AppColors.darkTxt,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      UiText(
                                          text: "Ordered at 06 Sept, 10:00pm",
                                          textColor: AppColors.greyTxt4,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      UiText(
                                          text: "2x Pepper",
                                          textColor: AppColors.greyTxt4,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      UiText(
                                          text: "1x Brama Fish",
                                          textColor: AppColors.greyTxt4,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      UiText(
                                          text: "ID: #32053",
                                          textColor: AppColors.darkTxt7,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            UiText(
                                text: "20 min",
                                textColor: AppColors.darkTxt7,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                            UiText(
                                text: "ESTIMATED DELIVERY TIME",
                                textColor: AppColors.softText,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                      primary: AppColors.primaryGreenColor)),
                              child: Stepper(
                                physics: ClampingScrollPhysics(),
                                // Prevents scrolling
                                currentStep: currentStatus - 1,
                                steps: _buildSteps(),
                                controlsBuilder: (BuildContext context,
                                    ControlsDetails details) {
                                  return Container(); // Hides the default navigation buttons
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 2,
                                        style: BorderStyle.solid,
                                        color: AppColors.borderColor5)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/girlAvater.png"),
                                        radius: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: 180,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            UiText(
                                                text: "Nnamdi S. Amrohore is the goat",
                                                textColor: AppColors.darkTxt7,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                            UiText(
                                                text: "Client",
                                                textColor: AppColors.greyTxt4,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: AppColors.primaryYellowColor,
                                        ),
                                        child: ImageIcon(
                                          AssetImage("assets/phone-call.png"),
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.white,
                                        ),
                                        child: ImageIcon(
                                          AssetImage("assets/chat-vector.png"),
                                          color: AppColors.primaryYellowColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              },
              child: Text('View Delivery'),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> _buildSteps() {
    return List.generate(4, (index) {
      return Step(
        title: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                stepTitles[index],
                style: GoogleFonts.sen(
                  color: currentStatus > index
                      ? AppColors.primaryGreenColor
                      : Colors.grey,
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        content: Text(""),
        isActive: currentStatus >= index + 1,
        state: _getState(index),
      );
    });
  }

  StepState _getState(int index) {
    if (currentStatus > index + 1) {
      return StepState.complete;
    } else if (currentStatus == index + 1) {
      return StepState.complete;
    } else {
      return StepState.values[2];
    }
  }
}
