import 'package:bloc_favrouite_app/bloc/home_bloc.dart';
import 'package:bloc_favrouite_app/model/favouriet_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(FetchFavouriteList());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          actions: [
            BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    return IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<HomeBloc>().add(DeleteItem());
              },
            );
  },
),]

        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch(state.status){
              case ListStatus.loading:
                return Center(child: CircularProgressIndicator());
              case ListStatus.success:
                return ListView.builder(
                    itemCount: state.favrouiteItemList.length,
                    itemBuilder: (BuildContext context, index) {
                      final item = state.favrouiteItemList[index];
                      return ListTile(
                        leading: Checkbox(
                          // value: state.tempfavrouiteItemList.contains(item)?true:false,
                          value: state.tempfavrouiteItemList.indexWhere((element) => element.id == item.id) != -1 ? true : false,
                          onChanged: (value) {
                            if (value!) {
                              context.read<HomeBloc>().add(SelectItem(item: item));
                            } else {
                              context.read<HomeBloc>().add(UnSelectItem(item: item));
                            }
                          },
                        ),

                          title: Text('Item ${item.title}'),
                        onTap: () {
                          // TODO: Navigate to detail screen
                        },
                        trailing: IconButton(onPressed:(){
                          FavouriteListModel items=FavouriteListModel(title: item.title, id: item.id,
                          isFavourite: item.isFavourite?false:true,
                          );
                          context.read<HomeBloc>().add(FavouriteList(item: items));
                        }, icon:item.isFavourite? Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_border,))

                      );
                    });
              case ListStatus.error:
                return Text('An error occurred ');
              default:
                return Text('No data available');
            }
          },
        )
    );
  }
}
