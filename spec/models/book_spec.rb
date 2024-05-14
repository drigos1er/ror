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
  it "can be instanciated" do
    expect(book).not_to be nil
  end

  it "can be saved" do
    expect(book.save).to be true
  end
end
