package data

import (
	"fmt"

	"github.com/fibs7000/go-graphql-benchmark/graph/model"
)

func GenData() []*model.Author {
	var authors []*model.Author
	for i := 0; i < 20; i++ {
		var books []*model.Book

		for k := 0; k < 3; k++ {
			book := model.Book{
				ID:       fmt.Sprintf("book-%d-%d", i, k),
				Name:     fmt.Sprintf("Book %d", k),
				NumPages: i * k * 100,
			}
			books = append(books, &book)
		}

		author := model.Author{
			ID:      fmt.Sprintf("author-%d", i),
			Name:    fmt.Sprintf("Author %d", i),
			Company: fmt.Sprintf("Company %d", i),
			Books:   books,
		}
		authors = append(authors, &author)
	}

	return authors
}
