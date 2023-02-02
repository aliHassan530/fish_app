import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../utilites/helper.dart';
import '../../widget/custom_text.dart';
import 'log_fish_verify_meaurements.dart';

class CaptureImageScreen extends StatefulWidget {
  @override
  _CaptureImageScreenState createState() => _CaptureImageScreenState();
}

class _CaptureImageScreenState extends State<CaptureImageScreen> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for caputred image

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  bool torchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: kSecoundryColor,
                          width: 2,
                        )),
                    height: MediaQuery.of(context).size.height,
                    child: controller == null
                        ? Center(child: Text("Loading Camera..."))
                        : !controller!.value.isInitialized
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : CameraPreview(controller!)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 234.h,
                  width: MediaQuery.of(context).size.width,
                  color: kBlackColor.withOpacity(0.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        title: image == null
                            ? "Continue scanning surface..."
                            : "Fill box with fish and capture",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: kMainColor,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                image = null;
                                setState(() {});
                              },
                              child: Container(
                                height: 54.h,
                                width: 54.w,
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/Vector (50).png",
                                    height: 20,
                                  ),
                                ),
                              ),
                            ),
                            image == null
                                ? GestureDetector(
                                    onTap: () async {
                                      try {
                                        if (controller != null) {
                                          if (controller!.value.isInitialized) {
                                            image =
                                                await controller!.takePicture();
                                          }
                                        }
                                      } catch (e) {
                                        print(e); //show error
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 70.h,
                                      width: 70.h,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 5,
                                        backgroundColor: kGreyDarkColor,
                                        color: kMainColor,
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      Helper.toReplacementScreen(
                                        context,
                                        LogFishVerifyMeasurements(
                                          image: image?.path,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 80.h,
                                      width: 80.h,
                                      child: Image.asset(
                                        "assets/screenshot.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            torchValue
                                ? GestureDetector(
                                    onTap: () {
                                      torchValue = !torchValue;
                                      setState(() {});
                                      controller?.setFlashMode(FlashMode.torch);
                                    },
                                    child: Container(
                                      height: 54.h,
                                      width: 54.w,
                                      decoration: BoxDecoration(
                                        color: kMainColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/flash_light_black 1.png",
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      torchValue = !torchValue;
                                      controller?.setFlashMode(FlashMode.off);
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 54.h,
                                      width: 54.w,
                                      decoration: BoxDecoration(
                                        color: kMainColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/flash_light_black 1.png",
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
