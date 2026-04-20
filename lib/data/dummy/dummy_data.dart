import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../routes/routes.dart';
import '../../utils/constants/image_strings.dart';

class YDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: YImage.banner1,
      targetScreen: YRoutes.order,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner2,
      targetScreen: YRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner3,
      targetScreen: YRoutes.favourites,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner4,
      targetScreen: YRoutes.search,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner5,
      targetScreen: YRoutes.settings,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner6,
      targetScreen: YRoutes.userAddress,
      active: true,
    ),
    BannerModel(
      imageUrl: YImage.banner8,
      targetScreen: YRoutes.checkout,
      active: false,
    ),
  ];

  /// - List of all Categories
  static final List<CategoryModel> categories = [
    // Main Categories (Featured)
    CategoryModel(
      id: '1',
      image: YImage.iconBurger,
      name: 'Burgers',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: YImage.iconPizza,
      name: 'Pizza',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: YImage.iconBeverage,
      name: 'Beverages',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: YImage.iconKhmerFood,
      name: 'Khmer Food',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image: YImage.iconChineseFood,
      name: 'Chinese Food',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image: YImage.iconStore,
      name: 'Top Stores',
      isFeatured: true,
    ),

    // Smartphone Subcategories
    // CategoryModel(
    //   id: '7',
    //   image: YImage.phoneIcon,
    //   name: 'Flagship Phones',
    //   parentId: '1',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '8',
    //   image: YImage.phoneIcon,
    //   name: 'Gaming Phones',
    //   parentId: '1',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '9',
    //   image: YImage.phoneIcon,
    //   name: 'Budget Phones',
    //   parentId: '1',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '10',
    //   image: YImage.phoneIcon,
    //   name: 'Mid Range Phones',
    //   parentId: '1',
    //   isFeatured: false,
    // ),
    //
    // // Smartwatch Subcategories
    // CategoryModel(
    //   id: '11',
    //   image: YImage.smartWatchIcon,
    //   name: 'Fitness Tracker',
    //   parentId: '2',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '12',
    //   image: YImage.smartWatchIcon,
    //   name: 'Heart Rate Smartwatch',
    //   parentId: '2',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '13',
    //   image: YImage.smartWatchIcon,
    //   name: 'GPS Smart Watch',
    //   parentId: '2',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '14',
    //   image: YImage.smartWatchIcon,
    //   name: 'Medical Alert Smart Watch',
    //   parentId: '2',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '15',
    //   image: YImage.smartWatchIcon,
    //   name: 'Cellular Smart Watch',
    //   parentId: '2',
    //   isFeatured: false,
    // ),

    // // Headphones Subcategories
    // CategoryModel(
    //   id: '16',
    //   image: YImage.headphonesIcon,
    //   name: 'Headphone',
    //   parentId: '3',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '17',
    //   image: YImage.headphonesIcon,
    //   name: 'Earphones',
    //   parentId: '3',
    //   isFeatured: false,
    // ),
    //
    // // PowerBanks Subcategories
    // CategoryModel(
    //   id: '18',
    //   image: YImage.powerBankIcon,
    //   name: 'Standard Power Bank',
    //   parentId: '4',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '19',
    //   image: YImage.powerBankIcon,
    //   name: 'Solar Power Bank',
    //   parentId: '4',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '20',
    //   image: YImage.powerBankIcon,
    //   name: 'Wireless Power Bank',
    //   parentId: '4',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '21',
    //   image: YImage.powerBankIcon,
    //   name: 'Accessories',
    //   parentId: '4',
    //   isFeatured: false,
    // ),
    //
    // // GameControllers Subcategories
    // CategoryModel(
    //   id: '22',
    //   image: YImage.gameControllerIcon,
    //   name: 'GamePads',
    //   parentId: '5',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '23',
    //   image: YImage.gameControllerIcon,
    //   name: 'JoySticks',
    //   parentId: '5',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '24',
    //   image: YImage.gameControllerIcon,
    //   name: 'Steering Wheels',
    //   parentId: '5',
    //   isFeatured: false,
    // ),
    // CategoryModel(
    //   id: '25',
    //   image: YImage.gameControllerIcon,
    //   name: 'motion controllers',
    //   parentId: '5',
    //   isFeatured: false,
    // ),
  ];

  /// -- List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(
      id: '1',
      image: YImage.burgerKingBrand,
      name: 'Burger King',
      productsCount: 265,
      isFeatured: true,
    ),
  ];

  /// -- List of all Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Texas Double Whopper',
      productType: 'ProductType.single',
      stock: 150,
      price: 10,
      isFeatured: true,
      thumbnail: YImage.texasDoubleWhopperBurger,
      description:
          'Two flame-grilled beef patties topped with crispy bacon, melted cheese, fresh lettuce, ripe tomatoes, crunchy pickles, onions, creamy mayo, and smoky BBQ sauce on a toasted sesame seed bun. Big, bold, and full of Texas-style flavor.',
      brand: BrandModel(
        id: '1',
        image: YImage.burgerKingBrand,
        name: 'Burger King',
        productsCount: 265,
        isFeatured: true,
      ),
      // images: [
      //   YImage.originalChickenSandwichBurger,
      //   YImage.whopperWithCheeseBurger,
      // ],
      salePrice: 9,
      categoryId: '1',
      // productAttributes: [
      //   ProductAttributeModel(name: 'Size', values: ['Regular', 'Large']),
      //   ProductAttributeModel(
      //     name: 'Spicy Level',
      //     values: ['Mild', 'Medium', 'Spicy'],
      //   ),
      // ],
      // productVariations: [
      //   ProductVariationModel(
      //     id: '1',
      //     stock: 20,
      //     price: 10,
      //     salePrice: 9,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Mild'},
      //   ),
      //   ProductVariationModel(
      //     id: '2',
      //     stock: 20,
      //     price: 10,
      //     salePrice: 9,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Medium'},
      //   ),
      //   ProductVariationModel(
      //     id: '3',
      //     stock: 20,
      //     price: 10,
      //     salePrice: 9,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Spicy'},
      //   ),
      //   ProductVariationModel(
      //     id: '4',
      //     stock: 20,
      //     price: 15,
      //     salePrice: 13,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Mild'},
      //   ),
      //   ProductVariationModel(
      //     id: '5',
      //     stock: 30,
      //     price: 15,
      //     salePrice: 13,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Medium'},
      //   ),
      //   ProductVariationModel(
      //     id: '6',
      //     stock: 20,
      //     price: 15,
      //     salePrice: 13,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Spicy'},
      //   ),
      // ],
    ),
    ProductModel(
      id: '002',
      title: 'Original Chicken Sandwich',
      productType: 'ProductType.single',
      stock: 150,
      price: 12,
      isFeatured: true,
      thumbnail: YImage.originalChickenSandwichBurger,
      description:
          'A crispy, lightly breaded white-meat chicken patty topped with fresh lettuce and creamy mayonnaise, served on a soft sesame seed bun. Simple, crunchy, and satisfying.',
      brand: BrandModel(
        id: '1',
        image: YImage.burgerKingBrand,
        name: 'Burger King',
        productsCount: 265,
        isFeatured: true,
      ),
      // images: [
      //   YImage.originalChickenSandwichBurger,
      //   YImage.whopperWithCheeseBurger,
      // ],
      salePrice: 10,
      categoryId: '1',
      // productAttributes: [
      //   ProductAttributeModel(name: 'Size', values: ['Regular', 'Large']),
      //   ProductAttributeModel(
      //     name: 'Spicy Level',
      //     values: ['Mild', 'Medium', 'Spicy'],
      //   ),
      // ],
      // productVariations: [
      //   ProductVariationModel(
      //     id: '1',
      //     stock: 20,
      //     price: 12,
      //     salePrice: 10,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Mild'},
      //   ),
      //   ProductVariationModel(
      //     id: '2',
      //     stock: 20,
      //     price: 12,
      //     salePrice: 10,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Medium'},
      //   ),
      //   ProductVariationModel(
      //     id: '3',
      //     stock: 20,
      //     price: 12,
      //     salePrice: 10,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Spicy'},
      //   ),
      //   ProductVariationModel(
      //     id: '4',
      //     stock: 20,
      //     price: 17,
      //     salePrice: 15,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Mild'},
      //   ),
      //   ProductVariationModel(
      //     id: '5',
      //     stock: 30,
      //     price: 17,
      //     salePrice: 15,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Medium'},
      //   ),
      //   ProductVariationModel(
      //     id: '6',
      //     stock: 20,
      //     price: 17,
      //     salePrice: 15,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Spicy'},
      //   ),
      // ],
    ),
    ProductModel(
      id: '003',
      title: 'Whopper with Cheese',
      productType: 'ProductType.single',
      stock: 150,
      price: 7,
      isFeatured: true,
      thumbnail: YImage.whopperWithCheeseBurger,
      description:
          'A flame-grilled beef patty topped with melted cheese, fresh lettuce, juicy tomatoes, onions, pickles, creamy mayonnaise, and ketchup, served on a toasted sesame seed bun. Classic, cheesy, and satisfying.',
      brand: BrandModel(
        id: '1',
        image: YImage.burgerKingBrand,
        name: 'Burger King',
        productsCount: 265,
        isFeatured: true,
      ),
      // images: [
      //   YImage.originalChickenSandwichBurger,
      //   YImage.whopperWithCheeseBurger,
      // ],
      salePrice: 7,
      categoryId: '1',
      // productAttributes: [
      //   ProductAttributeModel(name: 'Size', values: ['Regular', 'Large']),
      //   ProductAttributeModel(
      //     name: 'Spicy Level',
      //     values: ['Mild', 'Medium', 'Spicy'],
      //   ),
      // ],
      // productVariations: [
      //   ProductVariationModel(
      //     id: '1',
      //     stock: 20,
      //     price: 7,
      //     salePrice: 7,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Mild'},
      //   ),
      //   ProductVariationModel(
      //     id: '2',
      //     stock: 20,
      //     price: 7,
      //     salePrice: 7,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Medium'},
      //   ),
      //   ProductVariationModel(
      //     id: '3',
      //     stock: 20,
      //     price: 7,
      //     salePrice: 7,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Spicy'},
      //   ),
      //   ProductVariationModel(
      //     id: '4',
      //     stock: 20,
      //     price: 10,
      //     salePrice: 10,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Mild'},
      //   ),
      //   ProductVariationModel(
      //     id: '5',
      //     stock: 30,
      //     price: 10,
      //     salePrice: 10,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Medium'},
      //   ),
      //   ProductVariationModel(
      //     id: '6',
      //     stock: 20,
      //     price: 10,
      //     salePrice: 10,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Spicy'},
      //   ),
      // ],
    ),
    ProductModel(
      id: '004',
      title: 'Seafood Pizza',
      productType: 'ProductType.single',
      stock: 150,
      price: 13,
      isFeatured: true,
      thumbnail: YImage.seafoodPizza,
      description:
          'A savory pizza topped with a rich tomato or creamy sauce, loaded with shrimp, squid, and other seafood, finished with melted mozzarella cheese and a sprinkle of herbs. Fresh, flavorful, and deliciously ocean-inspired.',
      brand: BrandModel(
        id: '1',
        image: YImage.burgerKingBrand,
        name: 'Burger King',
        productsCount: 265,
        isFeatured: true,
      ),
      // images: [
      //   YImage.originalChickenSandwichBurger,
      //   YImage.whopperWithCheeseBurger,
      // ],
      salePrice: 10,
      categoryId: '2',
      // productAttributes: [
      //   ProductAttributeModel(name: 'Size', values: ['Regular', 'Large']),
      //   ProductAttributeModel(
      //     name: 'Spicy Level',
      //     values: ['Mild', 'Medium', 'Spicy'],
      //   ),
      // ],
      // productVariations: [
      //   ProductVariationModel(
      //     id: '1',
      //     stock: 20,
      //     price: 13,
      //     salePrice: 10,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Mild'},
      //   ),
      //   ProductVariationModel(
      //     id: '2',
      //     stock: 20,
      //     price: 13,
      //     salePrice: 10,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Medium'},
      //   ),
      //   ProductVariationModel(
      //     id: '3',
      //     stock: 20,
      //     price: 13,
      //     salePrice: 10,
      //     attributeValues: {'Size': 'Regular', 'Spicy Level': 'Spicy'},
      //   ),
      //   ProductVariationModel(
      //     id: '4',
      //     stock: 20,
      //     price: 15,
      //     salePrice: 13,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Mild'},
      //   ),
      //   ProductVariationModel(
      //     id: '5',
      //     stock: 30,
      //     price: 15,
      //     salePrice: 13,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Medium'},
      //   ),
      //   ProductVariationModel(
      //     id: '6',
      //     stock: 20,
      //     price: 15,
      //     salePrice: 13,
      //     attributeValues: {'Size': 'Large', 'Spicy Level': 'Spicy'},
      //   ),
      // ],
    ),
  ];
}
