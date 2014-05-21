require "./phonebook.rb"

describe Phonebook do

  before(:each) do
    @pb = Phonebook.new
  end

  it "should insert a name into the database" do
    expect(@pb.add_contact("Trace", "8133803438")).not_to raise_error
  end

  it "should get all contacts" do
  end

  it "should get a contact by name" do
  end

  it "should get the first record" do
  end

  it "should get the last record" do
  end

  it "should get rows in the database matching a given condition" do
  end
end
