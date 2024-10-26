import 'package:cloud_firestore/cloud_firestore.dart';

class BookedModel {
  final String bookedUserId;
  final String bookedHotelId;
  final String bookedUserName;
  final String bookedUserPhone;
  final String bookedCheckInDate;
  final String bookedCheckOutDate;
  final String bookedCheckInTime;
  final String bookedCheckOutTime;
  final String bookedHotelName;
  final int bookedAdultSize;
  final int bookedChildSize;
  final String bookedStatus;

  BookedModel({
    required this.bookedUserId,
    required this.bookedHotelId,
    required this.bookedUserName,
    required this.bookedUserPhone,
    required this.bookedCheckInDate,
    required this.bookedCheckOutDate,
    required this.bookedCheckInTime,
    required this.bookedCheckOutTime,
    required this.bookedHotelName,
    required this.bookedAdultSize,
    required this.bookedChildSize,
    required this.bookedStatus,
  });

  factory BookedModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return BookedModel(

        bookedUserName: data['bookedUserName'] ?? '',
        bookedUserPhone: data['bookedUserPhone'] ?? '',
        bookedAdultSize: data['bookedAdultSize'] ?? '',
        bookedCheckInDate: data['bookedCheckInDate'] ?? '',
        bookedCheckInTime: data['bookedCheckInTime'] ?? '',
        bookedCheckOutDate: data['bookedCheckOutDate'] ?? '',
        bookedCheckOutTime: data['bookedCheckOutTime'] ?? '',
        bookedChildSize: data['bookedChildSize'] ?? '',
        bookedHotelName: data['bookedHotelName'] ?? '',
        bookedUserId: data['bookedUserId'] ?? '',
        bookedStatus: data['bookedStatus'] ?? '',
        bookedHotelId: data['bookedHotelId'] ?? '');
  }
}
