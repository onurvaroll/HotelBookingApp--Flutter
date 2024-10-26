import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hotel/model/booked_model.dart';
import 'package:hotel/service/auth.dart';
import '../model/otel_model.dart';
import '../model/user_model.dart';

class FireStoreService extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final AuthorizationService auth = Get.put(AuthorizationService());

  Future<void> saveUser({required UserModel user}) async {
    await fireStore.collection("users").doc(user.id).set({
      "fullName": user.fullName,
      "email": user.email,
      "photoUrl": user.photoUrl,
      "phoneNumber": user.phoneNumber,
      "gender": user.gender,
      "name": user.name,
      "birthday":user.birthDay
    });
  }

  Future<UserModel?> getUser(userId) async {
    DocumentSnapshot docUser =
        await fireStore.collection("users").doc(userId).get();
    if (docUser.exists) {
      UserModel user = UserModel.todocument(docUser);
      return user;
    }
    return null;
  }

  void updateUser(
      {required String? userId,
      required String userName,
      required String photoUrl,
      required String content}) {
    fireStore.collection("users").doc(userId).update({
      "kullaniciAdi": userName,
      "fotoUrl": photoUrl,
      "hakkinda": content,
    });
  }

  Future<List<HotelModel>> searchHotel(String text) async {
    QuerySnapshot snapshot = await fireStore
        .collection("hotels")
        .where("hotelName", isGreaterThanOrEqualTo: text)
        .get();
    List<HotelModel> searchingHotel =
        snapshot.docs.map((doc) => HotelModel.fromFirestore(doc)).toList();
    print('Firebase: ${searchingHotel.length}');
    print('Data:\n${snapshot.docs}');
    return searchingHotel;
  }

  Future<List<HotelModel>> getHotelList() async {
    QuerySnapshot snapshot = await fireStore.collection("hotels").get();
    List<HotelModel> hotels =
        snapshot.docs.map((doc) => HotelModel.fromFirestore(doc)).toList();
    return hotels;
  }

  Future<void> addFavHotel(String userId, String hotelId) async {
    fireStore
        .collection("favorites")
        .doc('user')
        .collection(userId)
        .doc(hotelId)
        .set({
      'hotelId': hotelId,
    }).then((_) {
      print("Hotel added to favorites successfully");
    }).catchError((error) {
      print("Failed to add hotel to favorites: $error");
    });

    print("user:$userId");
    print("hotel:$hotelId");
  }

  Future<void> removeFavHotel(String userId, String hotelId) async {
    try {
      await fireStore
          .collection("favorites")
          .doc('user')
          .collection(userId)
          .doc(hotelId)
          .delete()
          .then((_) {
        print("Hotel removed from favorites successfully");
      }).catchError((error) {
        print("Failed to remove hotel from favorites: $error");
      });
      print("Removed hotel for user: $userId, hotel: $hotelId");
    } catch (error) {
      print("Error removing hotel from favorites: $error");
    }
  }


  Future<List<HotelModel>> getFavoriteHotels(String userId) async {
    try {
      // 'favorites' koleksiyonundaki ilgili kullanıcıya ait favori otellerin id'lerini al
      QuerySnapshot snapshot = await fireStore
          .collection("favorites")
          .doc('user')
          .collection(userId)
          .get();

      // Favori otel id'leri listesini oluştur
      List<String> favoriteHotelIds = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return data['hotelId'] as String;
      }).toList();

      List<HotelModel> favoriteHotels = [];
      for (String hotelId in favoriteHotelIds) {
        DocumentSnapshot hotelSnapshot = await fireStore
            .collection("hotels")
            .doc(hotelId)
            .get();

        if (hotelSnapshot.exists) {
          HotelModel hotel = HotelModel.fromFirestore(hotelSnapshot);
          favoriteHotels.add(hotel);
        }
      }

      return favoriteHotels;
    } catch (e) {
      print("Failed to get favorite hotels: $e");
      return [];
    }
  }


  Future<bool> favoriteHotelStatus(String userId, String hotelId) async {
    try {
      DocumentSnapshot docLike = await fireStore
          .collection("favorites")
          .doc('user')
          .collection(userId)
          .doc(hotelId)
          .get();

      if (docLike.exists) {
        print("Hotel is in favorites");
        return true;
      } else {
        print("Hotel is not in favorites");
        return false;
      }
    } catch (error) {
      print("Failed to check favorite status: $error");
      return false;
    }
  }

  void addBooked(BookedModel bookedModel) {
    fireStore
        .collection('bookings')
        .doc(bookedModel.bookedUserId)
        .collection('usersBookings')
        .add({
      'bookedUserId': bookedModel.bookedUserId,
      'bookedUserName': bookedModel.bookedUserName,
      'bookedUserPhone': bookedModel.bookedUserPhone,
      'bookedCheckInDate': bookedModel.bookedCheckInDate,
      'bookedCheckOutDate': bookedModel.bookedCheckOutDate,
      'bookedCheckInTime': bookedModel.bookedCheckInTime,
      'bookedCheckOutTime': bookedModel.bookedCheckOutTime,
      'bookedHotelName': bookedModel.bookedHotelName,
      'bookedAdultSize': bookedModel.bookedAdultSize,
      'bookedChildSize': bookedModel.bookedChildSize,
      'bookedStatus': bookedModel.bookedStatus,
      'bookedHotelId': bookedModel.bookedHotelId
    });
    print("Booked eklendi ekleyen id: ${bookedModel.bookedUserId}");
  }

  Future<List<BookedModel>> getBooked(String userId) async {
    print('Metoda girildi');
    //String userId = auth.activeUserId.value;
    print('user id:$userId');

    print('Hata yok');
    QuerySnapshot snapshot = await fireStore
        .collection("bookings")
        .doc(userId)
        .collection("usersBookings")
        .get();
    print('veri geldi');
    List<BookedModel> hotels =
        snapshot.docs.map((doc) => BookedModel.fromFirestore(doc)).toList();
    print('veri aktarıldı');

    return hotels;
  }
}
