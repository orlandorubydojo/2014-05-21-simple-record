require "./phonebook.rb"

describe Phonebook do

  before(:each) do
    @pb = Phonebook.new
  end

  it "should insert a contact into the database" do
    expect{@pb.add_contact("Trace", "8133803438")}.not_to raise_error
  end

  it "should get all contacts" do
    @pb.add_contact("Trace", "8133803438")
    expect(@pb.all_contacts).to eq([["Trace", "8133803438"]])
  end

  it "should get a contact by name" do
    @pb.add_contact("Trace", "8133803437")
    expect(@pb.get_contact("Trace")).to eq([["8133803437"]])
  end

  it "should get the first record" do
    @pb.add_contact("Trace", "8133803437")
    @pb.add_contact("Patrick", "5555555555")
    expect(@pb.first_contact).to eq(["Trace", "8133803437"])
  end

  it "should get the last record" do
    @pb.add_contact("Trace", "8133803437")
    @pb.add_contact("Patrick", "5555555555")
    expect(@pb.last_contact).to eq(["Patrick", "5555555555"])
  end

  it "should get rows in the database matching a given condition" do
    @pb.add_contact("Courtney", "8133803499")
    @pb.add_contact("Nestor", "1554555555")
    expect(@pb.select_contact("name", "Courtney")).to eq([["Courtney", "8133803499"]])
  end

    it "should get rows in the database matching a given condition" do
    @pb.add_contact("Courtney", "8133803499")
    @pb.add_contact("Nestor", "1554555555")
    expect(@pb.select_contact("phone_number", "8133803499")).to eq([["Courtney", "8133803499"]])
  end

end
