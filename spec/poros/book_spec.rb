require 'rails_helper'

RSpec.describe Book do
  it 'exists and has attributes' do
  	params = {
        "isbn": [123456789,3333333],
        "title": "To Drew A Drewking Dr(Bird)ew",
        "publisher": ["publisher1", "Drew Proebstel"]
    }

    book = Book.new(params)
    expect(book).to be_a(Book)
    expect(book.isbn).to eq([123456789,3333333])
    expect(book.title).to eq("To Drew A Drewking Dr(Bird)ew")
    expect(book.publisher).to eq(["publisher1", "Drew Proebstel"])

  end



end
