require 'spec_helper'

describe 'Contact' do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:contact)).to be_valid
  end

  it 'is valid with the first name, last name and email' do
    contact = build(:contact, first_name: 'Ethan', last_name: 'Le', email: 'ethan@viki.com')
    expect(contact).to be_valid
  end
  it 'is invalid without the first name' do
    expect(build(:contact, first_name: nil)).to have(1).errors_on(:first_name)
  end

  it 'is invalid without the last name' do
    expect(build(:contact, last_name: nil)).to have(1).errors_on(:last_name)
  end

  it 'is invalid without the email' do
    expect(build(:contact, email: nil)).to have(1).errors_on(:email)
  end

  it 'is invalid with duplicate email' do
    create(:contact, email: "ethan@viki.com")
    contact = build(:contact, email: "ethan@viki.com")
    expect(contact).to have(1).errors_on(:email)
  end
  describe "Contact and phone" do
    before do
      @contact1 = create(:contact, first_name: "Duc Toan", last_name: "Le", email: "ductoanle@gmail.com")
      @contact2 = create(:contact, first_name: "Ethan", last_name: "Le", email: "ethan@viki.com")
      @contact1.phones.create(phone_type: "home", phone: "91769749")
    end

    it "should allow two contacts to share the same phone number" do
      phone = @contact2.phones.build(phone_type: "home", phone: "91769749")
      expect(phone).to be_valid
    end
  end
  it "return contact's full name as a string" do
    contact = FactoryGirl.create(:contact)
    expect(contact.name).to eq 'Ethan Le'
  end

  describe "by_letter" do
    before do
      @ethan = create(:contact, first_name: "Ethan", last_name: "Le", email: "ethan@viki.com")
      @toan = Fcreate(:contact, first_name: "Duc Toan", last_name: "Le", email: "ductoanle@gmail.com")
      @envy = FactoryGirl.create(:contact, first_name: "Envy", last_name: "Homoculous", email: "envy@homoculous.com")
    end
    context "matching letter" do
      it "should return contact with first name started with letter e" do
        expect(Contact.by_letter('E')).to eq [@envy, @ethan]
      end
    end
    context "nonmatching letter" do
      it "should not return contact first name that not start with letter e" do
        expect(Contact.by_letter('E')).to_not include @toan
      end
    end
  end
end
