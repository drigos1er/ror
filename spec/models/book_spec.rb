require 'rails_helper'
# code no refactoring
  #RSpec.describe Book, type: :model do
   # it "can be instanciated" do
    #  expect(FactoryBot.build(:book)).not_to be nil
   # end

   # it "can be saved" do
    #  expect(FactoryBot.build(:book).save).to be true
   # end
  #end

  # code refactoring
RSpec.describe Book, type: :model do
  let(:book) { FactoryBot.build(:book)}  # Permet d'affecter une variable à une expression à évaluer
  
  #it { should validate_presence_of(:title) }  # Validation de presence avec shoulda matchers
  #it { should validate_uniqueness_of(:author) } # Validation de presence avec shoulda matchers
  
  
  it "can be instanciated" do
    expect(book).not_to be nil
  end

  it "can be saved" do
    expect(book.save).to be true
  end

  it "is invalid without title" do
    book.title = nil 
    expect(book.valid?).to be false
    expect(book.errors.messages).to have_key(:title)
  end

  it "is invalid without author" do
    book.author= nil 
    expect(book.valid?).to be false
    expect(book.errors.messages).to have_key(:author)
  end

  it "is invalid with a negative page count" do
    book.page_count = -1
    expect(book.valid?).to be false
    expect(book.errors.messages).to have_key(:page_count)
  end

  it "is invalid with a 0 page count" do
    book.page_count = 0
    expect(book.valid?).to be false
    expect(book.errors.messages).to have_key(:page_count)
  end

end
