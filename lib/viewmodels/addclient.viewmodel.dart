import 'package:smooth/locator.dart';
import 'package:smooth/models/client.model.dart';
import 'package:smooth/services/firebase/firestore.service.dart';

import 'base.viewmodel.dart';

class AddClientViewModel extends BaseViewModel {
  FirestoreService firestore = locator<FirestoreService>();

  Future<void> addClient(Client newClient) async {
    print(newClient.toJson());
    await firestore.addModelToCollection(newClient, Collection.clients);
  }
}
