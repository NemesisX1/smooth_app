import 'package:smooth/locator.dart';
import 'package:smooth/services/firebase/firestore.service.dart';
import 'package:smooth/viewmodels/base.viewmodel.dart';

class ClientDashboardViewModel extends BaseViewModel {
  FirestoreService _firestoreService = locator<FirestoreService>();

  Stream getClientAsStream() =>
      _firestoreService.getCollectionAsStream(Collection.clients);

  Stream getCommandsAsStream(String clientName) =>
      _firestoreService.getCollectionByTagAsStream(
        Collection.commands,
        'name',
        clientName,
      );
}
