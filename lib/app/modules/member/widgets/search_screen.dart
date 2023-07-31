import 'package:flutter/material.dart';
import 'package:genesis/app/modules/member/widgets/search_single_profile.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:genesis/app/data/models/search_model.dart';
import '../../../data/providers/search_provider.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog pd =SimpleFontelicoProgressDialog(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
        backgroundColor: const Color(0xff800000),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 60,width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                autocorrect: true,
                enableSuggestions: true,
                cursorColor: const Color(0xff800000),
                enabled: true,
                autofocus: true,
                onChanged: (text){
                  print('-------on changed ------');
                  print(text);
                  controller.getSearches(searchController.text);
                },
                decoration: InputDecoration(
                    border:const  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: Color(0xff800000)
                        )
                    ),
                    enabledBorder:const  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: Color(0xff800000)
                        )
                    ),
                    focusedBorder:const  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: Color(0xff800000)
                        )
                    ),
                    hintText: 'Search your connect',
                    suffixIcon: InkWell(
                        onTap: ()async{
                          pd.show(message: 'Finding Match', type: SimpleFontelicoProgressDialogType.threelines, indicatorColor: const Color(0xff800000));
                          //await Future.delayed(const Duration(seconds: 1));

                          await controller.getSearches(searchController.text);
                          pd.hide();
                        },
                        child: SizedBox(
                          width: 40,
                          child: Row(
                            children: const[
                              VerticalDivider(color: Colors.grey,thickness: 1,),
                              Icon(Icons.search,color: Color(0xff800000),size: 28,),
                            ],
                          ),
                        )
                    )
                ),
              ),),
            const Divider(thickness: 1,color: Colors.grey,),

            Obx(() =>
                controller.searches.isEmpty?
                    const Text('Nothing found'):
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.searches.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, index){
                        return Container(
                            width: Get.width,
                            margin:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius:const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Colors.grey.shade400)
                            ),
                            child: SearchSingleProfile(doc: controller.searches[index],)
                        );
                      },
                    )
            ),

          ],
        ),
      ),
    );
  }
}

class SearchController extends GetxController{
  List searches = <Doc>[].obs;

  Future<void>getSearches(String text)async{
    print('inside controller getsearches');
    List<Doc>? res= await SearchProvider().getSearchedMembers(text);

    print(res?.length);

    if(res!=null){
      if(res.isNotEmpty){
        searches.clear();
        searches.addAll(res);
      }
    }
  }

}
