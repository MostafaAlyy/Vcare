

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Home%20Tab/ViewModel/Cubit/home_states.dart';

import '../../ViewModel/Cubit/home_cubit.dart';

class HomeTab extends StatelessWidget {
   HomeTab({super.key});
var viewModel = HomeCubit();
  @override
  Widget build(BuildContext context) {
viewModel.getData( 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjk1NDY5ODI3LCJleHAiOjE2OTU0NzM0MjcsIm5iZiI6MTY5NTQ2OTgyNywianRpIjoiT0pGN3o2a1VseXpMaXRtZSIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.3tsITl_cgdpFadz7G_izQpatAJYE1YMlFbOlsX8QgGw');
    return BlocBuilder<HomeCubit,HomeState>(
      bloc: viewModel,
      builder: (context, state) {
       // var cupit = HomeCubit.get(context);
       // cupit.getHomeData(token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjk1NDY1OTkyLCJleHAiOjE2OTU0Njk1OTIsIm5iZiI6MTY5NTQ2NTk5MiwianRpIjoiY2tKUGlqa3dlNHhiWjFMaSIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.SqrysNDNniyc7Pqg5cr1nwqWBNaK3luGRVyEdKQ2Wf8');

        if(state is HomeSuccessState){
          print('object');
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Expanded(
                  // height: double.infinity,
                  // width: double.infinity,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, majorIndex) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.homeTabResponse.data?[majorIndex].name??'',style: TextStyle(
                                  fontSize: 20
                              ),) ,
                              TextButton.icon(
                                onPressed: (){},
                                icon: Text('More Details'),
                                label: Icon(Icons.arrow_right_alt_rounded),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 220,
                            width: double.infinity,
                            child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => SizedBox(width: 10,),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.homeTabResponse.data?[majorIndex].doctors?.length??0,
                              itemBuilder: (context, doctorsIndex) {
                                return Container(
                                  height: 210,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      border: Border.all(color: Colors.black)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: ColorHelper.mainColor,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child:CachedNetworkImage(
                                          imageUrl: "https://via.placeholder.com/640x480.png/005566?text=doctors+aliquid",
                                          placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(state.homeTabResponse.data?[majorIndex].doctors?[doctorsIndex].name??'',style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16
                                            ),),
                                            Text(state.homeTabResponse.data?[majorIndex].doctors?[doctorsIndex].degree??'',style: TextStyle(

                                                fontSize: 12
                                            ),),

                                          ],
                                        ),

                                      ),
                                      Spacer(),

                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: TextButton.icon(
                                          onPressed: (){},
                                          icon: Text('More Details'),
                                          label: Icon(Icons.arrow_right_alt_rounded),

                                        ),
                                      ),



                                    ],
                                  ),
                                );
                              },),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    itemCount: state.homeTabResponse.data?.length??0,
                  ),
                ),
              ],
            ),
          );
        }
        else if(state is HomeLoading){
          return CircularProgressIndicator();
        }
        else if(state is HomeErrorState){
          return Text(state.message??'');
        }
        else {
          return Container();
        }

      },

    );
  }
}
