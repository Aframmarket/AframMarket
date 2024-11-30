import 'dart:async';
import 'package:afram_project/Screens/Driver-Ui/profileScreens/ChatComponents/responseChat.dart';
import 'package:afram_project/Screens/Driver-Ui/profileScreens/ChatComponents/senderChat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../Colors/colors.dart';
import '../../Reusables/UIText.dart';
import 'ChatComponents/chat_massages.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;

class SupportChatScreen extends StatefulWidget {
  const SupportChatScreen({super.key});

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  List<Message> _messages = [];
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool _isEmojiVisible = false;

  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();

    // Listen to keyboard visibility changes
    keyboardSubscription =
        KeyboardVisibilityController().onChange.listen((bool visible) {
          if (visible) {
            setState(() {
              _isEmojiVisible = false; // Hide emoji picker when keyboard is visible
            });
          }
        });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  void _sendMessage() {
    String text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(Message(text: text, isSender: true, time: DateTime.timestamp()));
      });
      _controller.clear();
      FocusScope.of(context).requestFocus(_focusNode);

      // Hide emoji picker if visible
      if (_isEmojiVisible) {
        setState(() {
          _isEmojiVisible = false;
        });
      }

      // Send back the user's message after 5 seconds
      Future.delayed(Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _messages.add(Message(text: text, isSender: false, time: DateTime.timestamp()));
          });
        }
      });
    }
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.emoji_emotions_outlined),
            onPressed: () {
              if (_isEmojiVisible) {
                // Show keyboard and hide emoji picker
                FocusScope.of(context).requestFocus(_focusNode);
                setState(() {
                  _isEmojiVisible = false;
                });
              } else {
                // Hide keyboard and show emoji picker
                FocusScope.of(context).unfocus();
                Future.delayed(Duration(milliseconds: 100), () {
                  setState(() {
                    _isEmojiVisible = true;
                  });
                });
              }
            },
          ),
          Expanded(
            child: TextField(
              cursorColor: AppColors.primaryGreenColor,
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message',
              ),
              onTap: () {
                if (_isEmojiVisible) {
                  setState(() {
                    _isEmojiVisible = false;
                  });
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: AppColors.primaryYellowColor,
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }


  Widget _buildEmojiPicker() {
    return Visibility(
      visible: _isEmojiVisible,
      child: Flexible(
        fit: FlexFit.loose,
        child: EmojiPicker(
          onEmojiSelected: (category, emoji) {
            _controller
              ..text += emoji.emoji
              ..selection = TextSelection.fromPosition(
                TextPosition(offset: _controller.text.length),
              );
          },
          config: Config(
            height: 300,
            checkPlatformCompatibility: true,
            viewOrderConfig: const ViewOrderConfig(),
            emojiViewConfig: EmojiViewConfig(
              emojiSizeMax: 28 *
                  (foundation.defaultTargetPlatform ==
                      TargetPlatform.iOS
                      ? 1.2
                      : 1.0),
            ),
            skinToneConfig: const SkinToneConfig(),
            categoryViewConfig: const CategoryViewConfig(),
            bottomActionBarConfig: const BottomActionBarConfig(),
            searchViewConfig: const SearchViewConfig(), // Adjust emoji size for different platforms
          ),
        ),
      ),
    );
  }


  Widget _buildMessageList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _messages.length,
        reverse: true,
        itemBuilder: (context, index) {
          Message message = _messages[_messages.length - index - 1];
          if (message.isSender) {
            return Senderchat(message: message.text);
          } else {
            return ResponseChat(message: message.text);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.lightGreyBg2
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  UiText(
                      text: "Support",
                      textColor: AppColors.darkTxt3,
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                  ),
                  ImageIcon(
                    size: 40,
                      color: AppColors.hintTextColor,
                      AssetImage("assets/search_icon.png")
                  )
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  _buildMessageList(),
                  SizedBox(height: 20,),
                  Divider(height: 1),
                  _buildInputArea(),
                  _buildEmojiPicker(),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //     child: TextFormField(
          //       decoration: InputDecoration(
          //         suffixIcon: ImageIcon(AssetImage("assets/send_icon.png")),
          //           filled: true,
          //           fillColor: AppColors.softWhite,
          //           hintStyle: TextStyle(
          //             color: AppColors.lightTxt, fontSize: 12, fontWeight: FontWeight.w400
          //           ),
          //           hintText: "Write somethings",
          //           border: OutlineInputBorder(
          //             borderSide: BorderSide(color: Colors.transparent),
          //             borderRadius: BorderRadius.circular(10),),
          //           focusedBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: Colors.transparent),
          //             borderRadius: BorderRadius.circular(10),),
          //           enabledBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: Colors.transparent),
          //             borderRadius: BorderRadius.circular(10),),
          //           prefixIcon: ImageIcon(AssetImage("assets/emoji.png",))),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
