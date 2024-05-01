class StaticArray {
  List<dynamic> journey = [
    {
      "id": "#J0001-N1",
      "date": "29 March 2024",
      "product": 3,
      "status": "Pending"
    },
    {
      "id": "#J0001-N2",
      "date": "29 March 2024",
      "product": 2,
      "status": "Unable to Deliver"
    },
    {
      "id": "#J0001-N3",
      "date": "29 March 2024",
      "product": 4,
      "status": "Pending"
    },
    {
      "id": "#J0001-N4",
      "date": "29 March 2024",
      "product": 1,
      "status": "Delivered"
    },
    {
      "id": "#J0001-N5",
      "date": "29 March 2024",
      "product": 5,
      "status": "Pending"
    },
  ];

  List<dynamic> delivery = [
    {
      "id": "#J0001-N1",
      "date": "29 March 2024",
      "deliveryTitle": "Kling, Hilpert and Feil",
      "address": "Reaver House, 12 Street.-BH1 1SA",
      "parcel": 1,
      "delivery_status": "Pending",
      "isSelect": false,
    },
    {
      "id": "#J0001-N2",
      "date": "29 March 2024",
      "deliveryTitle": "Glover Ltd",
      "address": "2118 Thornridge Cir. Syracuse-BH1 1SB",
      "parcel": 1,
      "delivery_status": "Picked",
      "isSelect": false,
    },
    {
      "id": "#J0001-N3",
      "date": "29 March 2024",
      "deliveryTitle": "Product 3",
      "address": "18 Thornridge Cir. Syracuse-BH1 1SC",
      "parcel": 1,
      "delivery_status": "Out for Delivery",
      "isSelect": false,
    },
    {
      "id": "#J0001-N4",
      "date": "29 March 2024",
      "deliveryTitle": "Product 4",
      "address": "22 Thornridge Cir. Syracuse-BH1 1SC",
      "parcel": 1,
      "delivery_status": "Delivered",
      "isSelect": false,
    },
  ];

  List<dynamic> journetList = [
    {
      "id": "#5K3M43S1",
      "journeyname": "Journey-1",
      "type": "Collection",
      "companyname": "Jenny Wilson",
      "deliveryaddress": "20 Winchcombe Street-GL522LY",
      "postcode": "BH11SA",
      "instructions":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
      "deliverystatus": "Pending",
      "products": [
        {
          "id": "#5K3M43P1",
          "date": "29 March 2024",
          "productname": "Kling, Hilpert and Feil",
          "isSelect": false,
          "address": "",
          "parcel": 1,
          "delivery_status": "Pending"
        },
        {
          "id": "#5K3M43P2",
          "date": "29 March 2024",
          "productname": "Glover Ltd",
          "isSelect": false,
          "address": "",
          "parcel": 1,
          "delivery_status": "Pending"
        },
        {
          "id": "#5K3M43P3",
          "date": "29 March 2024",
          "productname": "Product 3",
          "isSelect": false,
          "address": "",
          "parcel": 1,
          "delivery_status": "Pending"
        },
      ]
    },
    {
      "id": "#5K3M43S2",
      "journeyname": "Journey-2",
      "type": "Collection",
      "companyname": "Joy Magic",
      "deliveryaddress": "49 Featherstone Street",
      "postcode": "EC1Y 8SY",
      "instructions":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
      "deliverystatus": "Delivered",
      "products": [
        {
          "id": "#5K3M43P1",
          "date": "29 March 2024",
          "productname": "Product 1",
          "isSelect": false
        },
        {
          "id": "#5K3M43P2",
          "date": "29 March 2024",
          "productname": "Product 2",
          "isSelect": false
        },
      ]
    },
  ];

  List<dynamic> collection = [
    {
      "id": "#J0001-N1",
      "date": "29 March 2024",
      "collectionTitle": "Maruti Courier",
      "address": "02 Thornridge Cir. Syracuse-BH11SB",
      "collection_status": "Pending",
    },
    {
      "id": "#J0001-N2",
      "date": "29 March 2024",
      "collectionTitle": "Anand Courier",
      "address": "02 Thornridge Cir. Syracuse-BH11SB",
      "collection_status": "Pending",
    },
  ];

  List<dynamic> parcelList = [
    {
      "id": "#6K3M43S1",
      "order_qty": "5",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
    {
      "id": "#6K3M43S2",
      "order_qty": "3",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
    {
      "id": "#6K3M43S1",
      "order_qty": "5",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
    {
      "id": "#6K3M43S2",
      "order_qty": "3",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
    {
      "id": "#6K3M43S1",
      "order_qty": "5",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
    {
      "id": "#6K3M43S2",
      "order_qty": "3",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
    {
      "id": "#6K3M43S1",
      "order_qty": "5",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
    {
      "id": "#6K3M43S2",
      "order_qty": "3",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
    {
      "id": "#6K3M43S1",
      "order_qty": "5",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
    {
      "id": "#6K3M43S2",
      "order_qty": "3",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
    {
      "id": "#6K3M43S1",
      "order_qty": "5",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
    {
      "id": "#6K3M43S2",
      "order_qty": "3",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "isSelect": false,
    },
  ];

  List<dynamic> parcelAddressList = [
    {
      "id": 1,
      "company_name": "Kling, Hilpert Feil",
      "address": "2-Lansdowne Crescent-BH1 1SA.2-Lansdowne Crescent-BH1 1SA.",
      "status": "Out for Delivery",
      "miles": 2,
    },
    {
      "id": 2,
      "company_name": "Glover Ltd.",
      "address": "Reaver House, 12 Street-CMK 12A.",
      "status": "Out for Delivery",
      "miles": 3,
    },
    {
      "id": 3,
      "company_name": "Marquardt Co.",
      "address": "2-Lansdowne Crescent-BH1 1SA.",
      "status": "Out for Delivery",
      "miles": 5,
    },
    {
      "id": 4,
      "company_name": "Amodil Steels Ltd",
      "address": "Forest Park, Cleobury Mortimer, Kidderm...",
      "status": "Pick for collection",
      "miles": 8,
    },
    {
      "id": 5,
      "company_name": "Kling, Hilpert Feil",
      "address": "2-Lansdowne Crescent-BH1 1SA.",
      "status": "Out for Delivery",
      "miles": 2,
    },
    {
      "id": 6,
      "company_name": "Glover Ltd.",
      "address": "Reaver House, 12 Street-CMK 12A.",
      "status": "Out for Delivery",
      "miles": 3,
    },
    {
      "id": 7,
      "company_name": "Marquardt Co.",
      "address": "2-Lansdowne Crescent-BH1 1SA.",
      "status": "Out for Delivery",
      "miles": 5,
    },
    {
      "id": 8,
      "company_name": "Amodil Steels Ltd",
      "address": "Forest Park, Cleobury Mortimer, Kidderm...",
      "status": "Pick for collection",
      "miles": 8,
    },
  ];

  List<String> delivery_status = [
    'Delivered',
    'Proven Delivery',
    'Left as Instructed',
    'Unable to Deliver',
    'Partial Delivery',
    'Damaged'
  ];
}
