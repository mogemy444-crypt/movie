import 'package:flutter/material.dart';
import 'package:movie_project/models/onboardingDM.dart';
import 'package:movie_project/ui/screens/splash/splash.dart';
import 'package:movie_project/ui/utils/AppColor.dart';
int staticIndex=0;
class OnboardingWidget extends StatefulWidget{
  Function setState;
  OnboardingWidget({super.key,required this.setState});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme=Theme.of(context);
    return Container(
      padding: EdgeInsets.only(bottom: 16,left: 16,right: 16,top: 28),
      decoration:  BoxDecoration(
        color: staticIndex==0?Colors.transparent:AppColor.black,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          Text(OnboardingDM.onboardingList[staticIndex].title,
            textAlign: TextAlign.center,
            style: staticIndex==0?theme.textTheme.displayMedium:theme.textTheme.displaySmall,
          ),
          Text(OnboardingDM.onboardingList[staticIndex].description,
            textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge,
          ),
          buildElevatedButton(
            status: staticIndex==5?"finish":"next",
            text: staticIndex==0?"Explore Now":staticIndex==5?"Finish":"Next",
            backgroundColor: theme.primaryColor,
            foregroundColor: theme.colorScheme.secondary
          ),
          if(staticIndex>1)
            buildElevatedButton(
                status: "back",
                backgroundColor: theme.colorScheme.secondary,
                foregroundColor: theme.primaryColor,
                text: "Back"
            )
        ],
      ),
    );
  }
  Widget buildElevatedButton({required Color backgroundColor,required Color foregroundColor,required String text,required String status})=>ElevatedButton(
      onPressed: (){
        if(status=="next"){
          if(staticIndex<5) {
            staticIndex++;
            widget.setState();
            setState(() {

            });
          }
        }
        else if(status=="back"){
          if(staticIndex>0){
            staticIndex--;
            widget.setState();
            setState(() {

            });
          }
        }
        else{
          Navigator.pushNamed(context, Splash.routeName);
        }
      },

      style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(16),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
        side: BorderSide(color: theme.primaryColor,width: 2)
      )
  ),
    child: Text(text),
  );
}
