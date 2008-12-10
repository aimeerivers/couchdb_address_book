function(doc) {
  // Keys is first letter of _id
  emit(doc._id[0], doc);
}
