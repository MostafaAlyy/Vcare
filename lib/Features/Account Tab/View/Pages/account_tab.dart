import 'package:flutter/material.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Icon(Icons.account_circle_outlined,size: 50,)),
          SizedBox(height: 10,),
          Center(
            child: Text('User Name',style: TextStyle(
              fontSize: 24
            ),),
          ),
          Center(
            child: TextButton.icon(
              label: Icon(Icons.edit,color: Colors.grey,),
                icon: const Text('Edit Account Details',style: TextStyle(
                    fontSize: 18,
                  color: Colors.grey
                )),
                onPressed: (){},
            ),
          ),
          Divider(),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.email_outlined),
              SizedBox(width: 10,),
              Text('employee@email.com',style: TextStyle(
                  fontSize: 18
              ))
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 10,),
              Text('+20123178903',style: TextStyle(
                  fontSize: 18
              )),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.lock_outline),
              SizedBox(width: 10,),
              Text('ºººººººººº',style: TextStyle(
                  fontSize: 18
              )),
            ],
          ),
          SizedBox(height: 40,),
          Text('History',style: TextStyle(
              fontSize: 24
          )),
          Container(
            height: 1,
            width: 55,
            color: Colors.grey,
          ),
          SizedBox(height: 20,),
         
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Booking date',style: TextStyle(
                            fontSize: 12
                        ),),
                        Text('Status',style: TextStyle(
                            fontSize: 12
                        )),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 19,),
                itemCount: 10),
          )

        
        ],
      ),
    );
  }
}
