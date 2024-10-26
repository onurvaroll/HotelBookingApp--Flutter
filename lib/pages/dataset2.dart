import 'package:cloud_firestore/cloud_firestore.dart';

class HotelUploader {
  List<Map<String, dynamic>> hotels = [
    {
      "id": "20241",
      "hotelName": "Güzel Otel",
      "location": "İstanbul",
      "perHour": 50,
      "starRating": 4.5,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/coverphoto7.jpg?alt=media&token=7291f8ee-af12-4511-89db-6d0ab963ff64",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261"
      ]
    },
    {
      "id": "20242",
      "hotelName": "Deluxe Hotel",
      "location": "Antalya",
      "perHour": 75,
      "starRating": 4.7,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54"
      ]
    },
    {
      "id": "20243",
      "hotelName": "Royal Palace",
      "location": "Ankara",
      "perHour": 60,
      "starRating": 4.3,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99"
      ]
    },
    {
      "id": "20244",
      "hotelName": "Paradise Resort",
      "location": "Muğla",
      "perHour": 80,
      "starRating": 4.9,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/coverphoto7.jpg?alt=media&token=7291f8ee-af12-4511-89db-6d0ab963ff64",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54"
      ]
    },
    {
      "id": "20245",
      "hotelName": "Sunny Beach Hotel",
      "location": "İzmir",
      "perHour": 55,
      "starRating": 4.4,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c"
      ]
    },
    {
      "id": "20246",
      "hotelName": "Luxury Inn",
      "location": "Bursa",
      "perHour": 65,
      "starRating": 4.6,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54"
      ]
    },
    {
      "id": "20247",
      "hotelName": "Mountain View Hotel",
      "location": "Kayseri",
      "perHour": 70,
      "starRating": 4.2,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c"
      ]
    },
    {
      "id": "20248",
      "hotelName": "City Center Hotel",
      "location": "İstanbul",
      "perHour": 60,
      "starRating": 4.5,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c"
      ]
    },
    {
      "id": "20249",
      "hotelName": "Seaside Inn",
      "location": "Antalya",
      "perHour": 75,
      "starRating": 4.8,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261"
      ]
    },
    {
      "id": "202410",
      "hotelName": "Garden Hotel",
      "location": "Adana",
      "perHour": 50,
      "starRating": 4.3,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54"
      ]
    },
    {
      "id": "202411",
      "hotelName": "Historic Hotel",
      "location": "Ankara",
      "perHour": 65,
      "starRating": 4.5,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c"
      ]
    },
    {
      "id": "202412",
      "hotelName": "Ocean View Hotel",
      "location": "Muğla",
      "perHour": 80,
      "starRating": 4.7,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261"
      ]
    },
    {
      "id": "202413",
      "hotelName": "Boutique Hotel",
      "location": "İzmir",
      "perHour": 55,
      "starRating": 4.4,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99"
      ]
    },
    {
      "id": "202414",
      "hotelName": "Grand Hotel",
      "location": "Bursa",
      "perHour": 65,
      "starRating": 4.6,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c"
      ]
    },
    {
      "id": "202415",
      "hotelName": "Elegant Hotel",
      "location": "Kayseri",
      "perHour": 70,
      "starRating": 4.2,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54"
      ]
    },
    {
      "id": "202416",
      "hotelName": "Downtown Hotel",
      "location": "İstanbul",
      "perHour": 60,
      "starRating": 4.5,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99"
      ]
    },
    {
      "id": "202417",
      "hotelName": "Coastal Hotel",
      "location": "Antalya",
      "perHour": 75,
      "starRating": 4.8,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c"
      ]
    },
    {
      "id": "202418",
      "hotelName": "Forest Hotel",
      "location": "Adana",
      "perHour": 50,
      "starRating": 4.3,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54"
      ]
    },
    {
      "id": "202419",
      "hotelName": "Historic Palace",
      "location": "Ankara",
      "perHour": 65,
      "starRating": 4.5,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c"
      ]
    },
    {
      "id": "202420",
      "hotelName": "Seaside Resort",
      "location": "Muğla",
      "perHour": 80,
      "starRating": 4.7,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto6.jpg?alt=media&token=8375dc54-aded-47a6-bb64-9dcbe2a8005c",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261"
      ]
    },
    {
      "id": "202421",
      "hotelName": "Urban Hotel",
      "location": "İzmir",
      "perHour": 55,
      "starRating": 4.4,
      "coverPhoto": "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto1.jpg?alt=media&token=27ada8e1-6f49-4e4c-bf14-d79406505d54",
      "detailsPhotos": [
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto2.jpg?alt=media&token=f1896bda-9b9e-4481-8502-1dca3d665261",
        "https://firebasestorage.googleapis.com/v0/b/hotelbooking-679f4.appspot.com/o/otelphoto3.jpg?alt=media&token=104ff244-5c09-4df0-a318-07030b04ea99"
      ]
    }
  ];

  final firestore = FirebaseFirestore.instance;

  Future<void> addHotelsToFirestore({int startIndex = 0, int endIndex = 10}) async {


    WriteBatch batch = firestore.batch();

    for (var i = startIndex; i <= endIndex && i < hotels.length; i++) {
      var hotel = hotels[i];
      var docRef = firestore.collection('hotels').doc(hotel['id']);
      batch.set(docRef, hotel);
    }

    await batch.commit();
  }

  Future<void> addToFirebase()async{
    for(int i =0;i<hotels.length;i++){
      var hotel =hotels[i];
      await firestore.collection("hotels").doc(hotel['id']).set({
        "id": hotel["id"],
        "hotelName": hotel["hotelName"],
        "location": hotel["location"],
        "perHour":hotel["perHour"],
        "starRating": hotel["starRating"],
        "coverPhoto": hotel["coverPhoto"],
        "detailsPhotos": hotel["detailsPhotos"]
      });
    }
  }
}

