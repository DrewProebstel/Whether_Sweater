class BookSerializer
  def self.format_book(books,weather,destination)
    binding.pry
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
      books: [
        {
          isbn: [
            0762507845,
            9780762507849
          ],
          title: Denver, Co,
          publisher: [
            Universal Map Enterprises
          ]
        },
        {
          isbn: [
            9780883183663,
            0883183668
          ],
          title: Photovoltaic safety, Denver, CO, 1988,
          publisher: [
            American Institute of Physics
          ]
        },
        { ... same format for books 3, 4 and 5 ... }
      ]
    }
  }
}
  end
end
