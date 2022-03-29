function genData() {
  const authors = [];
  for (let i = 0; i < 20; i++) {
    const books = [];

    for (let k = 0; k < 3; k++) {
      books.push({
        id: "book-" + i + "-" + k,
        name: "Book " + i + "-" + k,
        numPages: i * k * 100,
      });
    }

    authors.push({
      id: "author-" + i,
      name: "Author " + i,
      company: "Company " + i,
      books,
    });
  }

  return authors;
}

module.exports.data = genData();
