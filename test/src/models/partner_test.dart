import 'package:dart_azampay/dart_azampay.dart';
import 'package:test/test.dart';

void main() {
  group('Partner', () {
    test('model', () {
      final partner = Partner(
        id: '6ebafc56-6d4d',
        logoUrl: 'https://domain.example.com/azampesa.png',
        partnerName: 'Azampesa',
        provider: 1,
        vendorName: 'kay_gmail_com',
        paymentVendorId: '36a4cb2b-172c',
        paymentPartnerId: '08d997ae-1961',
        paymentAcknowledgmentRoute: null,
        currency: 'TZS',
        status: '1',
        vendorType: 'seller',
        partnerType: 'mno',
      );

      final map = partner.toMap();

      final result = Partner.fromMap(map);

      expect(result.id, '6ebafc56-6d4d');
      expect(result.partnerName, 'Azampesa');
      expect(result.provider, 1);
      expect(result.vendorName, 'kay_gmail_com');
      expect(result.paymentVendorId, '36a4cb2b-172c');
      expect(result.paymentPartnerId, '08d997ae-1961');
      expect(result.paymentAcknowledgmentRoute, null);
      expect(result.currency, 'TZS');
      expect(result.status, '1');
      expect(result.vendorType, 'seller');
      expect(result.partnerType, 'mno');
    });

    test('list of partners', () {
      final data = [
        {
          "id": "6ebafc56-6d4d-4265-a8d4-c0e1e7806c19",
          "logoUrl":
              "https://azampay-sarafutest.s3.eu-central-1.amazonaws.com/azampesa.png",
          "partnerName": "Azampesa",
          "provider": 5,
          "vendorName": "kaykhahima_gmail_com",
          "paymentVendorId": "36a4cb2b-172c-46bc-ac50-451a8f022b40",
          "paymentPartnerId": "08d997ae-1961-4c32-8b2f-e00f53003b00",
          "paymentAcknowledgmentRoute": "",
          "currency": "TZS",
          "status": "1",
          "vendorType": "seller",
          "partnerType": "mno"
        },
        {
          "id": "bbb6121c-b158-4078-aa09-67a584100746",
          "logoUrl":
              "https://pg-vnext-banners.s3.eu-central-1.amazonaws.com/vnext-images/pgvnext-payment-images/halopesa.svg",
          "partnerName": "HaloPesa",
          "provider": 4,
          "vendorName": "kaykhahima_gmail_com",
          "paymentVendorId": "36a4cb2b-172c-46bc-ac50-451a8f022b40",
          "paymentPartnerId": "08d99549-2d49-4694-8320-f60b4e76be6a",
          "paymentAcknowledgmentRoute": "",
          "currency": "TZS",
          "status": "1",
          "vendorType": "seller",
          "partnerType": "mno"
        },
        {
          "id": "bf61faec-1421-4e93-bc5b-41090fde3aa9",
          "logoUrl":
              "https://pg-vnext-banners.s3.eu-central-1.amazonaws.com/vnext-images/pgvnext-payment-images/tigopesa.svg",
          "partnerName": "Tigopesa",
          "provider": 3,
          "vendorName": "kaykhahima_gmail_com",
          "paymentVendorId": "36a4cb2b-172c-46bc-ac50-451a8f022b40",
          "paymentPartnerId": "8f2b5341-78c1-4aa2-a8a4-0e1fbe263f1c",
          "paymentAcknowledgmentRoute": "",
          "currency": "TZS",
          "status": "1",
          "vendorType": "seller",
          "partnerType": "mno"
        },
        {
          "id": "e21d2941-804f-42e6-a547-66bbbfc7d533",
          "logoUrl":
              "https://pg-vnext-banners.s3.eu-central-1.amazonaws.com/vnext-images/pgvnext-payment-images/airtel.svg",
          "partnerName": "Airtel",
          "provider": 2,
          "vendorName": "kaykhahima_gmail_com",
          "paymentVendorId": "36a4cb2b-172c-46bc-ac50-451a8f022b40",
          "paymentPartnerId": "08d9945a-c9df-4834-876e-04b2df375d8e",
          "paymentAcknowledgmentRoute": "",
          "currency": "TZS",
          "status": "1",
          "vendorType": "seller",
          "partnerType": "mno"
        }
      ];
      final response = Response(data: data);

      final result = response.data?.map((p) => Partner.fromMap(p)).toList();

      expect(result, isA<List<Partner>>());
      expect(result![0].provider, 5);
    });
  });
}
