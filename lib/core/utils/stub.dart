import 'dart:math';

class StubUtils {
  static String getRandomAvatar([bool girl = false]) {
    final int random = Random().nextInt(1000);
    return 'https://avatar.iran.liara.run/public/${girl ? 'girl' : 'boy'}?username=$random';
  }
}
