// import 'package:shop_app/provider/productmodel.dart';

// List<Product> Productdata = [
//   Product(
//     id: 'p1',
//     title: 'Red Shirt',
//     description: 'A red shirt - it is pretty red!',
//     price: 29.99,
//     titlecontent:
//         "Red solid casual shirt, has a button-down collar, button placket, and curved hem",
//     offers: ["This product is already at its best price"],
//     delivaryoption: [
//       "100% Original Products",
//       "Pay on delivery might be available",
//       "Easy 30 days returns and exchanges",
//       "Try & Buy might be available"
//     ],
//     imageUrl:
//         'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/1729391/2019/8/28/a9d4a7aa-af7e-4a37-a9d4-a94dc8c057e81566992341974-WROGN-Navy-Blue-Slim-Fit-Checked-Casual-Shirt-52415669923403-1.jpg',
//   ),
//   Product(
//     id: 'p2',
//     title: 'Trousers',
//     description: 'A nice pair of trousers.',
//     price: 59.99,
//     titlecontent:
//         "Dark no fade black jeans has skinny fit, mid-rise, clean look, non stretchable with 5 pocket",
//     delivaryoption: [
//       "100% Original Products",
//       "Pay on delivery might be available",
//       "Easy 30 days returns and exchanges",
//       "Try & Buy might be available"
//     ],
//     offers: [
//       "Applicable on: Orders above Rs. 2499 (only on first purchase)",
//       "Coupon Discount: Rs. 400 off (check cart for final savings)"
//     ],
//     imageUrl:
//         'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2020/12/12/18fcbe9f-9f65-4315-a195-d8406ac7db9e1607765817279-1.jpg',
//   ),
//   Product(
//     id: 'p3',
//     title: 'Yellow Scarf',
//     description: 'Warm and cozy - exactly what you need for the winter.',
//     price: 19.99,
//     titlecontent: "Yellow and Green striped Scarf and has a tasselled border",
//     delivaryoption: [
//       "100% Original Products",
//       "Pay on delivery might be available",
//       "Easy 30 days returns and exchanges",
//       "Try & Buy might be available"
//     ],
//     offers: [
//       "Applicable on: Orders above Rs. 999 (only on first purchase)",
//       "Coupon Discount: Rs. 150 off (check cart for final savings)"
//     ],
//     imageUrl: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
//   ),
//   Product(
//     id: 'p4',
//     title: 'Teakwood Leathers',
//     description: 'Men Blue Solid Genuine Leather Belt',
//     price: 799,
//     delivaryoption: [
//       "100% Original Products",
//       "Pay on delivery might be available",
//       "Easy 30 days returns and exchanges",
//       "Try & Buy might be available"
//     ],
//     offers: ["This product is already at its best price"],
//     titlecontent:
//         "Add this hip Teakwood Leathers black belt to your wardrobe and look trendy any day of the year. This black piece can be matched with trim denims and easy loafers for a spiffy work outfit.",
//     imageUrl:
//         'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2020/12/12/18fcbe9f-9f65-4315-a195-d8406ac7db9e1607765817279-1.jpg',
//   ),
//   Product(
//     id: 'p5',
//     title: 'Roadster',
//     description: 'men blue solid denim jacket.',
//     price: 1139,
//     titlecontent:
//         "Blue solid denim jacket, has a spread collar, 4 pockets, button closures, long sleeves, straight hem with button-and-tab feature",
//     delivaryoption: [
//       "100% Original Products",
//       "Pay on delivery might be available",
//       "Easy 30 days returns and exchanges",
//       "Try & Buy might be available"
//     ],
//     offers: [
//       "Applicable on: Orders above Rs. 2499 (only on first purchase)",
//       "Coupon Discount: Rs. 400 off (check cart for final savings)"
//     ],
//     imageUrl:
//         'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/12288660/2020/11/7/483d7584-dcb7-42f0-9bd1-7fbbc37ec2c41604745706828-Roadster-Men-Jackets-7241604745704851-2.jpg',
//   ),
//   Product(
//     id: 'p6',
//     title: 'Mast & Harbour',
//     description: 'Men Green & White Striped Pullover Sweater',
//     price: 1139,
//     delivaryoption: [
//       "100% Original Products",
//       "Pay on delivery might be available",
//       "Easy 30 days returns and exchanges",
//       "Try & Buy might be available"
//     ],
//     titlecontent:
//         "Green and White striped pullover sweater, has a round neck, long sleeves, and ribbed hem",
//     offers: [
//       "Applicable on: Orders above Rs. 2499 (only on first purchase)",
//       "Coupon Discount: Rs. 400 off (check cart for final savings)"
//     ],
//     imageUrl:
//         'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/12749406/2020/11/13/60af8cac-e482-49da-bca9-06379015db431605261354017-Mast--Harbour-Men-Sweaters-951605261352551-1.jpg',
//   ),
//   Product(
//     id: 'p7',
//     title: 'Park Avenue',
//     description: 'Men Teal-Blue Solid Super Slim-Fit Formal Suit',
//     price: 4949,
//     offers: ["This product is already at its best price"],
//     delivaryoption: [
//       "100% Original Products",
//       "Pay on delivery might be available",
//       "Easy 30 days returns and exchanges",
//       "Try & Buy might be available"
//     ],
//     titlecontent:
//         "Black solid formal suit Black solid formal blazer, has a notched lapel collar, long sleeves, single-breasted with button closure, three pockets, an attached lining, double-vented back hem Black solid formal trousers, has a waistband with belt loops, button closure, zip fly, four pockets",
//     imageUrl:
//         'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/12/14/29440cea-5d96-40f5-94c4-dd0f90c5c3261576274131629-1.jpg',
//   ),
//   Product(
//     id: 'p8',
//     title: 'peter england',
//     description: 'men turquise blue slim fit formal shirt',
//     price: 909,
//     titlecontent:
//         "Multi stripes striped opaque Casual shirt ,has a button-down collar, button placket, pocket, long regular sleeves, curved hem",
//     offers: ["This product is already at its best price"],
//     delivaryoption: [
//       "100% Original Products",
//       "Pay on delivery might be available",
//       "Easy 30 days returns and exchanges",
//       "Try & Buy might be available"
//     ],
//     imageUrl:
//         'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/14200038/2021/6/14/3e793bcf-cec4-4fcf-a16a-54e81e76d1281623663541957-Peter-England-Men-Shirts-4411623663540895-1.jpg',
//   ),
//   Product(
//     id: 'p9',
//     title: 'ADIDAS',
//     description: 'Men Black Woven Design Adicaz Running Shoes',
//     price: 2879,
//     titlecontent:
//         "A pair of black and fluorescent green football shoes, has regular Styling",
//     delivaryoption: [
//       "100% Original Products",
//       "Pay on delivery might be available",
//       "Easy 30 days returns and exchanges",
//       "Try & Buy might be available"
//     ],
//     offers: ["This product is already at its best price"],
//     imageUrl:
//         'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/13444770/2021/3/22/01ecf5ad-bb82-48bd-bb53-401408b7e1cd1616407741483-ADIDAS-Men-Sports-Shoes-8971616407740711-1.jpg',
//   ),
//   Product(
//     id: 'p10',
//     title: 'Roadster',
//     description: 'Men Tan Brown Solid Comfort Sandals',
//     price: 831,
//     titlecontent:
//         "A pair of tan brown solid comfort sandals Synthetic upper with Velcro closure Cushioned footbed Patterned PU outsole",
//     offers: ["This product is already at its best price"],
//     delivaryoption: [
//       "100% Original Products",
//       "Pay on delivery might be available",
//       "Easy 30 days returns and exchanges",
//       "Try & Buy might be available"
//     ],
//     imageUrl:
//         'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/13242212/2021/5/5/9946fc14-225c-4dbd-8da9-b721077893d31620191714045-Roadster-Men-Tan-Brown-Solid-Comfort-Sandals-261162019171389-6.jpg',
//   ),
//   Product(
//     id: 'p11',
//     title: 'Philips',
//     description:
//         'Men S1121/45 3D Pivot & Flex Heads Wet or Dry Electric Shaver - Navy & Black',
//     price: 1995,
//     delivaryoption: [
//       "100% Original Products",
//       "This item is not returnable. Items like inner-wear, personal care, make-up, socks and certain accessories do not come under our return policy. Read More."
//     ],
//     titlecontent:
//         "S1323/45 3D Pivot & Flex Heads Wet or Dry Electric Shaver - Navy & Black",
//     offers: [
//       "Applicable on: Purchase of 3 or more items",
//       "Coupon code: BEAUTY15",
//       "Coupon Discount: 15% off (Your total saving: Rs. 730)"
//     ],
//     imageUrl:
//         'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/11704162/2020/5/6/b4e4f1e4-d7a5-491e-95e0-fa5ce44a6d911588752701381-Philips-Men-Trimmer-6231588752700550-1.jpg',
//   ),
//   Product(
//     id: 'p12',
//     title: 'Provogue',
//     description: 'Unisex Sea Green Solid Backpack with rain cover',
//     delivaryoption: [],
//     offers: ["This product is already at its best price"],
//     titlecontent:
//         "This bag of Provogue comes with spacious comparment with unique design along with laptop sleeve and with 6 month manufacturer warranty.The quality proves the worth of the product.",
//     price: 1287,
//     imageUrl:
//         'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2021/5/20/7163323f-02a3-4fba-8dd5-74e624a3dea61621490046730-1.jpg',
//   ),
// ];
