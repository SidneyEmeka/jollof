import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import '../server/getxserver.dart';
import '../utils/stylings.dart';

class Aiadvisor extends StatefulWidget {
  const Aiadvisor({super.key});

  @override
  State<Aiadvisor> createState() => _AiadvisorState();
}

class _AiadvisorState extends State<Aiadvisor> {
  final TextEditingController _userInput = TextEditingController();
  final apiKey = 'AIzaSyC-ySXlpynP8hqESVJMsYpBRzMmCnXyOMk';


    Future<void>sendInput() async{
      final message = _userInput.text;
      setState(() {
        _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
      });
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: apiKey,
        generationConfig: GenerationConfig(
          temperature: 1,
          topK: 64,
          topP: 0.95,
          maxOutputTokens: 8192,
          responseMimeType: 'text/plain',
        ),
        systemInstruction: Content.system(
            '''Your name is Jollof when a user greets you reply by 
             telling them "Hello ${Get.find<Jollofx>().validatedlastName}, 
             welcome to Jollof how may I help you",then send them these options 
             to choose from (1) Short term investment(3-6 months), ROI(10-50%). 
             (2) Mid term investment(6-10 months), ROI(50-100%) (3) Long term investment(1-2 years), 
             ROI(100-150%). if the user chooses  then ask him the amount he plans on investing, 
             when he send amount then ask him the duration,then using the duration tell him the percentage
              return of his using the ROI of the plan he choose, please remember the thread, i mean previous 
              conversation, don't repeat response, if have sent exact command.'''),
      );

      final chat = model.startChat(history: []);
      final content = Content.text(message);

      final response = await chat.sendMessage(content);
      setState(() {
        _messages.add(Message(isUser: false, message: response.text?? "", date: DateTime.now()));
      });
     // print(response.text);
      _userInput.text = '';
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
            padding: const EdgeInsets.all(13),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              Get.find<Jollofx>().validatedUserAvatar.value,
              fit: BoxFit.contain,
            )),
        title: Text(
          "AI Advisor",
          style: Stylings.titles,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.menu,
              size: 17,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ListView.builder(physics: const BouncingScrollPhysics(),itemCount:_messages.length,itemBuilder: (context,index){
                  final message = _messages[index];
                  return Messages(isUser: message.isUser, message: message.message, date: DateFormat('h:mm a').format(message.date));
                })
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                  child: TextField(
                    //key: const Key("AI"),
                    controller: _userInput,
                    style: Stylings.subTitles,
                    cursorColor: Colors.grey.shade300,
                    decoration: InputDecoration(
                      hintText: "Message...",
                      hintStyle: Stylings.subTitles
                          .copyWith(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.transparent)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.transparent)),
                      isDense: false,
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                  ),
                ),
              IconButton(onPressed: (){
                sendInput();
              }, icon:   const Icon(Icons.send_outlined,color: Colors.black,size: 20,),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//handling responses
final List<Message> _messages = [];
class Message{
  final bool isUser;
  final String message;
  final DateTime date;
  Message({ required this.isUser, required this.message, required this.date});
}
class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;

  const Messages({
    super.key,
    required this.isUser,
    required this.message,
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
          left: isUser ? 20 : 10,
          right: isUser ? 10 : 20
      ),
      decoration: BoxDecoration(
          color: isUser ? Stylings.yellow : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30),
              bottomLeft: isUser ? const Radius.circular(30) : Radius.zero,
              topRight: const Radius.circular(30),
              bottomRight: isUser ? Radius.zero : const Radius.circular(30)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: Stylings.subTitles.copyWith(color: isUser ? Colors.white : Colors.black,fontSize: 13),),
          Align(
            alignment:isUser ?  Alignment.bottomRight:Alignment.bottomLeft,
            child: Text(
              date,
              style: Stylings.subTitles.copyWith(color: isUser ? Colors.white : Colors.black,fontSize: 10)
            ),
          )
        ],
      ),
    );
  }
}
