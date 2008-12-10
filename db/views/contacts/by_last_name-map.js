function(doc) {
  if (doc.type == "Contact") {
    emit(doc.last_name, doc);
  }
}
