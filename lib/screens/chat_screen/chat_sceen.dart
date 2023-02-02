import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  File? _image;

  Future getImage() async {
    PickedFile? image =
        await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 2,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Center(
              child: Image.asset(
                "assets/Stroke 1.png",
                height: 18.25,
                color: kSecoundryColor,
              ),
            ),
          ),
        ),
        title: Column(
          children: [
            CustomText(
              title: "Rainbow Trout Weekly Bags Chat",
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: kBlackColor,
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              title: "38 chat participants",
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: kGreyDarkColor,
            ),
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                height: 36,
                width: 36,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/Rectangle 2600 (3).png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RightBubble(
                      msg: "I caught them under the bridge over on 192 🤙🏼",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                      title: "Amy Macntire",
                      color: kGreyDarkColor,
                      fontSize: 12,
                    ),
                    LeftBubble(
                      msg:
                          "I want to use the same baits that you used when you went",
                      img: "assets/Rectangle 2600 (3).png",
                    ),
                    LeftBubble(
                      msg:
                          "I want to use the same baits that you used when you went",
                      img: "assets/Rectangle 2600 (3).png",
                    ),
                    SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              color: kMainColor,
              margin: EdgeInsets.zero,
              elevation: 5,
              child: Container(
                  height: 40,
                  margin:
                      EdgeInsets.only(bottom: 30, top: 15, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles();
                        },
                        child: Image.asset(
                          "assets/image 16 (1).png",
                          height: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Image.asset(
                          "assets/image 17.png",
                          height: 20,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          color: kMainColor,
                          border: Border.all(color: kSecoundryColor),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextField(
                          // controller: widget.controller,
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 15,
                          ),
                          cursorColor: kBlackColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18.h, horizontal: 20),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kSecoundryColor),
                        child: Center(
                            child: Image.asset(
                          "assets/image 18.png",
                          height: 10,
                        )),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class RightBubble extends StatefulWidget {
  var msg;
  var emoji;
  var time;

  RightBubble({
    this.msg,
    this.emoji,
    this.time,
  });

  @override
  _RightBubbleState createState() => _RightBubbleState();
}

class _RightBubbleState extends State<RightBubble> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
            color: kSecoundryColor,
            margin: const EdgeInsets.only(top: 30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                color: kSecoundryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.61,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        widget.msg,
                        style: TextStyle(
                          fontSize: 14,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeftBubble extends StatefulWidget {
  var msg;
  var name;
  final img;
  var clr;

  LeftBubble({
    this.msg,
    this.name,
    this.img,
    this.clr,
  });

  @override
  _LeftBubbleState createState() => _LeftBubbleState();
}

class _LeftBubbleState extends State<LeftBubble> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 36,
            width: 36,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                widget.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.only(top: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  decoration: const BoxDecoration(
                    color: kGreyBackColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.msg,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: kBlackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
