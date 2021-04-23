import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  
  ChatMessage(this.data, this.mine);
  final Map<String, dynamic> data;
  final bool mine;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          !mine ? Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data["senderPhotoUrl"]),
            ),
          ): Container(),

          Expanded(
            child: Column(
              crossAxisAlignment: mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                data["imgUrl"] != null ?
                  Image.network(data["imgUrl"], width: 250.0) :
                  Text(data["text"], style: TextStyle(fontSize: 16.0)),

                Text(
                  data["sendName"],
                  textAlign: mine ? TextAlign.end : TextAlign.start,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey
                  ),
                )
              ],
            ),
          ),

          mine ? Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data["senderPhotoUrl"]),
            ),
          ): Container(),


        ],
      ),
    );
  }
}