import 'dart:ui';

extension ColorExtensions on Color {
  Color getLighterShade(double factor) {
    assert(factor >= 0 && factor <= 1, 'Factor must be between 0 and 1');

    // Extract the red, green, and blue components of the color
    int red = r.toInt();
    int green = g.toInt();
    int blue = b.toInt();

    // Calculate the new lighter color components
    int newRed = red + ((255 - red) * factor).round();
    int newGreen = green + ((255 - green) * factor).round();
    int newBlue = blue + ((255 - blue) * factor).round();

    // Ensure the values are within the valid range (0-255)
    newRed = newRed.clamp(0, 255);
    newGreen = newGreen.clamp(0, 255);
    newBlue = newBlue.clamp(0, 255);

    // Return the new lighter color
    return Color.fromARGB(a.toInt(), newRed, newGreen, newBlue);
  }

  Color lightenColor(double percentage) {
    assert(percentage >= 0.0 && percentage <= 1.0);

    double red = r + ((255 - r) * percentage);
    double green = g + ((255 - g) * percentage);
    double blue = b + ((255 - b) * percentage);

    return Color.from(alpha: a, red: red, green: green, blue: blue);
  }
}
