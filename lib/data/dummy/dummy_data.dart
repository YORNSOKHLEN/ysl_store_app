import '../../features/shop/models/category_model.dart';
import '../../utils/constants/image_strings.dart';

class YDummyData {
  /// -- Banners
  // static final List<BannerModel> banners = [
  //   BannerModel(
  //     imageUrl: Images.banner1,
  //     targetScreen: TRoutes.order,
  //     active: false,
  //   ),
  //   BannerModel(
  //     imageUrl: Images.banner2,
  //     targetScreen: TRoutes.cart,
  //     active: true,
  //   ),
  //   BannerModel(
  //     imageUrl: Images.banner3,
  //     targetScreen: TRoutes.favourites,
  //     active: true,
  //   ),
  //   BannerModel(
  //     imageUrl: Images.banner4,
  //     targetScreen: TRoutes.search,
  //     active: true,
  //   ),
  //   BannerModel(
  //     imageUrl: Images.banner5,
  //     targetScreen: TRoutes.settings,
  //     active: true,
  //   ),
  //   BannerModel(
  //     imageUrl: Images.banner6,
  //     targetScreen: TRoutes.userAddress,
  //     active: true,
  //   ),
  //   BannerModel(
  //     imageUrl: Images.banner8,
  //     targetScreen: TRoutes.checkout,
  //     active: false,
  //   ),
  // ];
  //
  // /// -- User
  // static final UserModel user = UserModel(
  //   firstName: 'Coding',
  //   lastName: 'with T',
  //   email: 'support@codingwithT.com',
  //   phoneNumber: '+14155552671',
  //   profilePicture: TImages.user,
  //   addresses: [
  //     AddressModel(
  //       id: '1',
  //       name: 'Coding with T',
  //       phoneNumber: '+923178059528',
  //       street: '82356 Timmy Coves',
  //       city: 'South Liana',
  //       state: 'Maine',
  //       postalCode: '87665',
  //       country: 'USA',
  //     ),
  //   ],
  // );
  //
  // /// -- Cart
  // static final CartModel cart = CartModel(
  //   cartId: '001',
  //   items: [
  //     CartItemModel(
  //       productId: '001',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       // Assuming 'products' list exists elsewhere
  //       image: products[0].thumbnail,
  //       brandName: products[0].brand!.name,
  //       price: products[0].productVariations![0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //     ),
  //   ],
  // );
  //
  // /// -- Orders
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: 'CWT0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2023, 09, 1),
  //     deliveryDate: DateTime(2023, 09, 9),
  //   ),
  // ];

  /// - List of all Categories
  static final List<CategoryModel> categories = [
    // Main Categories (Featured)
    CategoryModel(
      id: '1',
      image: YImage.phoneIcon,
      name: 'Smartphone',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: YImage.smartWatchIcon,
      name: 'Smartwatch',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: YImage.headphonesIcon,
      name: 'Headphones',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: YImage.powerBankIcon,
      name: 'PowerBanks',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image: YImage.gameControllerIcon,
      name: 'GameControllers',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image: YImage.coolingFanIcon,
      name: 'CoolingFans',
      isFeatured: true,
    ),
    CategoryModel(id: '7', image: '', name: '', isFeatured: true),
    CategoryModel(id: '8', image: '', name: '', isFeatured: true),

    // Smartphone Subcategories
    CategoryModel(
      id: '9',
      image: YImage.phoneIcon,
      name: 'Flagship Phones',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '10',
      image: YImage.phoneIcon,
      name: 'Gaming Phones',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '11',
      image: YImage.phoneIcon,
      name: 'Budget Phones',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '12',
      image: YImage.phoneIcon,
      name: 'Mid Range Phones',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '13',
      image: '',
      name: '',
      parentId: '1',
      isFeatured: false,
    ),

    // Furniture Subcategories
    CategoryModel(
      id: '14',
      image: YImage.smartWatchIcon,
      name: 'Fitness Tracker',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '15',
      image: YImage.smartWatchIcon,
      name: 'Heart Rate Smartwatch',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '16',
      image: YImage.smartWatchIcon,
      name: 'GPS Smart Watch',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '17',
      image: YImage.smartWatchIcon,
      name: 'Medical Alert Smart Watch',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '18',
      image: YImage.smartWatchIcon,
      name: 'Cellular Smart Watch',
      parentId: '2',
      isFeatured: false,
    ),

    // Electronics Subcategories
    CategoryModel(
      id: '19',
      image: YImage.headphonesIcon,
      name: 'Headphone',
      parentId: '3',
      isFeatured: false,
    ),
    CategoryModel(
      id: '20',
      image: YImage.headphonesIcon,
      name: 'Earphones',
      parentId: '3',
      isFeatured: false,
    ),
    // CategoryModel(id: '21', image: YImage.headphonesIcon, name: 'TVs & Monitors', parentId: '3', isFeatured: false),
    // CategoryModel(id: '22', image: YImage.headphonesIcon, name: 'Audio Devices', parentId: '3', isFeatured: false),
    // CategoryModel(id: '23', image: YImage.headphonesIcon, name: 'Gaming Consoles', parentId: '3', isFeatured: false),
    // CategoryModel(id: '24', image: YImage.headphonesIcon, name: 'Cameras', parentId: '3', isFeatured: false),

    // Clothes Subcategories
    CategoryModel(
      id: '25',
      image: YImage.powerBankIcon,
      name: 'Standard Power Bank',
      parentId: '4',
      isFeatured: false,
    ),
    CategoryModel(
      id: '26',
      image: YImage.powerBankIcon,
      name: 'Solar Power Bank',
      parentId: '4',
      isFeatured: false,
    ),
    CategoryModel(
      id: '27',
      image: YImage.powerBankIcon,
      name: 'Wireless Power Bank',
      parentId: '4',
      isFeatured: false,
    ),
    CategoryModel(
      id: '28',
      image: YImage.powerBankIcon,
      name: 'Accessories',
      parentId: '4',
      isFeatured: false,
    ),

    // Animals Subcategories
    CategoryModel(
      id: '29',
      image: YImage.gameControllerIcon,
      name: 'GamePads',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '30',
      image: YImage.gameControllerIcon,
      name: 'JoySticks',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '31',
      image: YImage.gameControllerIcon,
      name: 'Steering Wheels',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '32',
      image: YImage.gameControllerIcon,
      name: 'motion controllers',
      parentId: '5',
      isFeatured: false,
    ),

    // Shoes Subcategories
    CategoryModel(
      id: '33',
      image: YImage.coolingFanIcon,
      name: 'Colling Fans',
      parentId: '6',
      isFeatured: false,
    ),
    // CategoryModel(id: '34', image: YImage.coolingFanIcon, name: 'Formal Shoes', parentId: '6', isFeatured: false),
    // CategoryModel(id: '35', image: YImage.coolingFanIcon, name: 'Boots', parentId: '6', isFeatured: false),
    // CategoryModel(id: '36', image: YImage.coolingFanIcon, name: 'Sandals', parentId: '6', isFeatured: false),

    // // Cosmetics Subcategories
    // CategoryModel(id: '37', image: YImage.cosmeticsIcon, name: 'Skincare', parentId: '7', isFeatured: false),
    // CategoryModel(id: '38', image: YImage.cosmeticsIcon, name: 'Makeup', parentId: '7', isFeatured: false),
    // CategoryModel(id: '39', image: YImage.cosmeticsIcon, name: 'Fragrances', parentId: '7', isFeatured: false),
    // CategoryModel(id: '40', image: YImage.cosmeticsIcon, name: 'Hair Care', parentId: '7', isFeatured: false),
    //
    // // Jewellery Subcategories
    // CategoryModel(id: '41', image: YImage.jeweleryIcon, name: 'Necklaces', parentId: '8', isFeatured: false),
    // CategoryModel(id: '42', image: YImage.jeweleryIcon, name: 'Earrings', parentId: '8', isFeatured: false),
    // CategoryModel(id: '43', image: YImage.jeweleryIcon, name: 'Bracelets', parentId: '8', isFeatured: false),
    // CategoryModel(id: '44', image: YImage.jeweleryIcon, name: 'Rings', parentId: '8', isFeatured: false),
    // CategoryModel(id: '45', image: YImage.jeweleryIcon, name: 'Watches', parentId: '8', isFeatured: false),
  ];
}
