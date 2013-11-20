require 'spec_helper'

describe 'Contact' do
  it 'is valid with the first name, last name and email' do
    contact = Contact.new(first_name: 'Ethan', last_name: 'Le', email: 'ethan@viki.com')
    expect(contact).to be_valid
  end
  it 'is invalid without the first name' do
    expect(Contact.new(first_name: nil)).to have(1).errors_on(:first_name)
  end

  it 'is invalid without the last name' do
    expect(Contact.new(last_name: nil)).to have(1).errors_on(:last_name)
  end

  it 'is invalid without the email' do
    expect(Contact.new(email: nil)).to have(1).errors_on(:email)
  end

  it 'is invalid with duplicate email' do
    Contact.create(first_name: "Duc Toan", last_name: "Le", email: "ethan@viki.com")
    contact = Contact.new(first_name: "Ethan", last_name: "Le", email: "ethan@viki.com")
    expect(contact).to have(1).errors_on(:email)
  end
  describe "Contact and phone" do
    before do
      @contact1 = Contact.create(first_name: "Duc Toan", last_name: "Le", email: "ductoanle@gmail.com")
      @contact2 = Contact.create(first_name: "Ethan", last_name: "Le", email: "ethan@viki.com")
      @contact1.phones.create(phone_type: "home", phone: "91769749")
    end
    #it 'should not allow duplicate phone number per contact' do
    #  phone = @contact1.phones.build(phone_type: "mobile", phone: "91769749")
    #  expect(phone).to have(1).errors_on(:phone)
    #end
    it "should allow two contacts to share the same phone number" do
      phone = @contact2.phones.build(phone_type: "home", phone: "91769749")
      expect(phone).to be_valid
    end
  end
  it "return contact's full name as a string" do
    contact = Contact.create(first_name: "Ethan", last_name: "Le", email: "ethan@viki.com")
    expect(contact.name).to eq 'Ethan Le'
  end

  describe "by_letter" do
    before do
      @ethan = Contact.create(first_name: "Ethan", last_name: "Le", email: "ethan@viki.com")
      @toan = Contact.create(first_name: "Duc Toan", last_name: "Le", email: "ductoanle@gmail.com")
      @envy = Contact.create(first_name: "Envy", last_name: "Homoculous", email: "envy@homoculous.com")
    end

    it "should return contact with first name started with letter e" do
      expect(Contact.by_letter('E')).to eq [@envy, @ethan]
    end
  end
end
