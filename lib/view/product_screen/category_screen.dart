import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nashreasar/gen/assets.gen.dart';
import 'package:nashreasar/model/Category_model.dart';
import 'package:nashreasar/repository/bloc/blocs.dart';
import 'package:nashreasar/repository/bloc/event.dart';
import 'package:nashreasar/repository/bloc/state.dart';
import 'package:nashreasar/repository/repository_screen.dart';
import 'package:nashreasar/view/component_screen/loading.dart';
import 'package:nashreasar/view/component_screen/storage_screen.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  var box = GetStorage();
  //func build
  @override
  Widget build(BuildContext context) {

    // scrooll();
    var size = MediaQuery.sizeOf(context);
    double sizeScreenMain = box.read(sizeScreen);
    Repository _repository = RepositoryProvider.of<Repository>(context);
    return BlocProvider(
      create: ((context)=>Category_bloc(_repository)..add(Category_bloc_event_loading())),
      child:Stack(
        children: [
        Padding(
          padding: EdgeInsets.only(top: size.height*0.3),
          child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.all(Radius.circular(30.0))
          ),),
        ),
          Padding(
            padding: EdgeInsets.only(top: size.height*0.26),
            child: Center(
              child: BlocBuilder<Category_bloc,Category_bloc_state>(builder: (context,state){

                if(state is Category_bloc_state_loading){

                  return Loading().showloading(context);
                }
                if(state is Category_bloc_state_loaded){
                  print("loaded ...........   ");
                  //sliderr
                  // if(imageSlidersMain.length==0){
                  // //   getSliderPic();//get slider
                  // // }
                  List<Category_model> category_product = state.category;
                  print(" ...........   ${category_product}");
                  return  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Container(
                      width: sizeScreenMain < 900 ? size.width/1.20 : size.width/1.0,
                      //   decoration: BoxDecoration(
                      //       color: CupertinoColors.white,
                      //       borderRadius: BorderRadius.all(Radius.circular(30.0))
                      //   ),
                      child: CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate([
                              // category_product.isEmpty ? Header(icon: Assets.images.slider.provider(),type: 'static',globalContext: context,size: size,)
                              //     : InkWell(key:widget.keyBottomNavigation2,child: Header(icon: Assets.images.slider.provider(),type: 'slider',globalContext: context,size: size,imageSlidersMain: imageSlidersMain,))
                            ]),
                          ),
                          SliverPadding(
                            padding: EdgeInsets.only(top: 1,bottom:5,left: 0 ,right: 0),
                            sliver: SliverGrid(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: sizeScreenMain < 900 ? 2 : 4,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 30,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  double width, height;
                                  width = 100;
                                  height = 100;
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(seconds: 1),
                                    columnCount: 2,
                                    child: ScaleAnimation(
                                      child: FadeInAnimation(
                                        child: Container(
                                          width: size.width/1.30,
                                          child: InkWell(
                                            onTap: (){

                                            },
                                            child: Container(
                                                width: size.width/1.30,
                                                // height: double.infinity,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25.0))),
                                                child:Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Container(
                                                          width:double.infinity,
                                                          height: double.infinity,
                                                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25.0)), image: DecorationImage(
                                                            image: Assets.images.backGreen.provider(),
                                                            fit: BoxFit.cover, // تصویر کل فضا را پر می‌کند
                                                          ),),
                                                          child: Center(child: Text("${category_product[index]!.category_product_title}"))
                                                          ),

                                                    ])
                                              // Image.network(
                                              //   '${JJ.server}upload/${category_product[index].category_product_picIcon}',
                                              //   width: 100,
                                              //   height: 100,
                                              // ),
                                              // TODO : change when use web or android,ios
                                              // CachedNetworkImage(
                                              //   imageUrl: "${JJ.server}upload/${category_product[index].category_product_picIcon}",
                                              //   placeholder: (context, url) => Loading().showLoadingBox(context,16.0,16.0),
                                              //   errorWidget: (context, url, error) => Loading().showLoadingBox(context,16.0,16.0),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                childCount: category_product.length, // تعداد کل خانه‌ها
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                }
                if(state is Category_bloc_state_Error){
                  late String error = state.error_text;
                  return Center(child: Text(error),);
                }
                return Center(child: const Text("1111"),);
              },),
            ),
          ),
        ]
      ),
    );
  }
}
