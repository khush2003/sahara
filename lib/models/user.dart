class UserSahara {
  final String name;
  final String? phone, address;
  UserSahara({
    required this.name,
    this.phone,
    this.address,
  });
  factory UserSahara.test() {
    return UserSahara(
        name: 'James',
        phone: '09876545425',
        address:
            '123/456 Soi Sukhumvit, Khwaeng Khlong Toei, Khet Khlong Toei, Bangkok 10110, Thailand');
  }
}
