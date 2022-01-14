import 'package:flutter/material.dart';

class DatabaseListviewScreen extends StatelessWidget {
  const DatabaseListviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://img.lovepik.com/free-png/20210918/lovepik-character-png-image_400195163_wh1200.png'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 25.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 25.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color: Colors.grey[300],
                ),
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'search',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index)=>buildStoryItem(),
                  separatorBuilder: (context,index)=>const SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 7,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index)=> const SizedBox(
                  height: 20.0,
                ),
                itemCount: 10,
                ),
            ],
          ),
        ),
      ),
    );
  }

//1.build item
//2.build list
//3.add item to list

//arrow function
  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://img.lovepik.com/free-png/20210918/lovepik-character-png-image_400195163_wh1200.png'),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'omart dffg  fewsf we ertwe wesrsefesfes rfes fwefrwefret efew',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'data is  fdd  ererger erege gere gerg e trgt rtgnow',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const Text(
                      '2:00',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  // ignore: sized_box_for_whitespace
  Widget buildStoryItem() => Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                      'https://img.lovepik.com/free-png/20210918/lovepik-character-png-image_400195163_wh1200.png'),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 3.0,
                    end: 3.0,
                  ),
                  child: CircleAvatar(
                    radius: 7.0,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'omar elhasan',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
