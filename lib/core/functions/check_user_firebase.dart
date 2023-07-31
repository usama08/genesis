import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:genesis/app/modules/inbox/widgets/UserModel.dart';

final CollectionReference myCollection =
    FirebaseFirestore.instance.collection('users');

Future<void> addDocumentIfNotExists(String id, UserModel data) async {
  DocumentReference documentReference = myCollection.doc(data.uid);
  DocumentSnapshot documentSnapshot = await documentReference.get();

  if (documentSnapshot.exists) {
    // Document with the specified ID already exists, overwrite it
    print('user is already present in database');
  } else {
    // Document with the specified ID does not exist, create it
    await documentReference.set({
      'name': data.fullname,
      'email': data.email,
      'uid': data.uid,
      'createdAt': DateTime.now(),
      'phone': null,
      'imgUrl': data.profilepic
    });
  }
}
