// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:travel_hour/blocs/sign_in_bloc.dart';
// import 'package:travel_hour/services/app_service.dart';
// import 'package:travel_hour/utils/snacbar.dart';
// import 'package:easy_localization/easy_localization.dart';

// class EditProfile extends StatefulWidget {

//   final String? name;
//   final String? imageUrl;

//   EditProfile({Key? key, required this.name, required this.imageUrl}) : super(key: key);

//   @override
//   _EditProfileState createState() => _EditProfileState(this.name, this.imageUrl);
// }

// class _EditProfileState extends State<EditProfile> {

//   _EditProfileState(this.name, this.imageUrl);

//   String? name;
//   String? imageUrl;


//   File? imageFile;
//   String? fileName;
//   bool loading = false;
  
//   var formKey = GlobalKey<FormState>();
//   var nameCtrl = TextEditingController();


//   Future pickImage() async {
//     final  _imagePicker = ImagePicker();
//     var imagepicked = await _imagePicker.pickImage(source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
    
//     if (imagepicked != null) {
//       setState(() {
//       imageFile = File(imagepicked.path);
//       fileName = (imageFile!.path);
//     });
      
//     } else {
//       debugPrint('No image has is selected!');
      
//     }
// }



//   Future uploadPicture() async {
//     final SignInBloc sb = context.read<SignInBloc>();
//     Reference storageReference = FirebaseStorage.instance.ref().child('Profile Pictures/${sb.uid}');
//     UploadTask uploadTask = storageReference.putFile(imageFile!);

//     await uploadTask.whenComplete(()async{
//       var _url = await storageReference.getDownloadURL();
//       var _imageUrl = _url.toString();
//       setState(() {
//         imageUrl = _imageUrl;
//       });
//     });
      
//   }




//   Future handleUpdateData () async {
//     final sb = context.read<SignInBloc>();
//     await AppService().checkInternet().then((hasInternet)async{
//       if(hasInternet == false){
//         openSnacbar(context, 'no internet'.tr());
//       }else{
//         if(formKey.currentState!.validate()){
//           formKey.currentState!.save();
//           setState(()=> loading = true);
//           imageFile == null 
//           ? await sb.updateUserProfile(nameCtrl.text, imageUrl!)
//             .then((value){
//               openSnacbar(context, 'updated successfully'.tr());
//               setState(()=> loading = false);
//             })
          
//           : await uploadPicture()
//             .then((value) => sb.updateUserProfile(nameCtrl.text, imageUrl!).then((_) {
//             openSnacbar(context, 'updated successfully'.tr());
//             setState(()=> loading = false );
        
//           }));
//         }
//       }
//     });
//   }



//   @override
//   void initState() {
//     super.initState();
//     nameCtrl.text = name!;
    
//   }

  

  

  

  





//   @override
//   Widget build(BuildContext context) {
    

//     return 
//     Scaffold(
//       appBar: AppBar(
//         title: Text('edit profile').tr(),
        
//       ),
//       body: ListView(
//           padding: const EdgeInsets.all(25),
//           children: <Widget>[
//             InkWell(
//                   child: CircleAvatar(
//                   radius: 70,
//                   backgroundColor: Colors.grey[300],
//                     child: Container(
//                     height: 120,
//                     width: 120,
                    
//                     decoration: BoxDecoration(
//                         border: Border.all(
//                           width: 1,
//                           color: Colors.grey[800]!
//                         ),
                        
//                         color: Colors.grey[500],
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                             image: (imageFile == null ? CachedNetworkImageProvider(imageUrl!) : FileImage(imageFile!)) as ImageProvider<Object>,
//                             fit: BoxFit.cover)),
//                     child: Align(
//                         alignment: Alignment.bottomRight,
//                         child: Icon(
//                           Icons.edit,
//                           size: 30,
//                           color: Colors.black,
//                         )),
//                   ),
//                 ),
//                 onTap: (){
//                   pickImage();
//                 },
//             ),

//             SizedBox(height: 50,),
//             Form(
//               key: formKey,
//               child: TextFormField(
              
//               decoration: InputDecoration(
//                 hintText: 'enter new name'.tr(),
//               ),
//               controller: nameCtrl,
//               validator: (value){
//                 if (value!.length == 0) return "Name can't be empty";
//                 return null;
//               },
              
//             )),

//             SizedBox(height: 50,),
//             Container(
//               height: 45,
//               width: MediaQuery.of(context).size.width,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor: WidgetStateProperty.resolveWith((states) => Theme.of(context).primaryColor),
//                   textStyle: WidgetStateProperty.resolveWith((states) => TextStyle(
//                     color: Colors.white
//                   ))
//                 ),
//                 child: loading == true 
//                   ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),)
//                   : Text('update profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),).tr(),
//                 onPressed: (){
//                   handleUpdateData();
//                 },

                
//               ),
//             ),
            
//           ],
//         )
      
      
//     );
//   }
// }