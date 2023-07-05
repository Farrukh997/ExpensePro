extension Capiltalize on String {
  String startWithCapital() {
    return this[0].toUpperCase() + substring(1);
  }
}

extension Format on double {
  num sumFormat() {
    if (this - truncate() > .0) {
      return this;
    }
    return floor();
  }
}
