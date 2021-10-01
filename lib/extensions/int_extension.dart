extension IntToString on int {
  toThousandsString() {
    return (this ~/ 1000).toString() + 'К';
  }
}
