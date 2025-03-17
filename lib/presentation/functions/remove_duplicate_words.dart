

  String removeDuplicateWords(String text) {
    List<String> words = text.split(" ");
    Set<String> uniqueWords = {};
    List<String> filteredWords = words.where((word) {
      if (uniqueWords.contains(word)) {
        return false;
      } else {
        uniqueWords.add(word);
        return true;
      }
    }).toList();
    return filteredWords.join(" ");
  }