class BookSerializer
  def self.format_book(books,weather,destination)
    {
    data: {
    id: nil,
    type: 'books',
    attributes: {
      destination: destination,
      forecast: {
        summary: weather[:current_weather].conditions,
        temperature: weather[:current_weather].temperature
      },
      total_books_found: books[:found],
      books: books[:books].map do |book|
        {
          isbn: book.isbn,
          title:book.title,
          publisher:book.publisher
        }
      end
    }
  }
}
  end
end
