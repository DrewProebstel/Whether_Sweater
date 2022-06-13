class BookFacade
  def self.find_books(location,quantity)
  	book_data = BookService.get_books(location,quantity)
    books = book_data[:docs].map do |book|
      Book.new(book)
    end
  end
end
