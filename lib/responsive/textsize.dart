double textSize(double width) {
  if (width >= 1000) {
    return 20;
  } else if (width < 1000 && width >= 700) {
    return 16;
  }else if (width < 700 && width >= 500) {
    return 14;
  }else if (width < 500 && width >= 400) {
    return 12;
  }else {
    return 10;
  }
}
