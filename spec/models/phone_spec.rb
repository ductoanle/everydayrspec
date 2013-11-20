require 'spec_helper'

describe 'Phone' do
  it 'is valid with type and phone number' do
    phone = Phone.new(phone_type: 'home', phone: "91769749")
    expect(phone).to be_valid
  end
  it 'is invalid without type' do
    expect(Phone.new(phone_type: nil)).to be_invalid
  end
  it 'is invalid without phone number' do
    expect(Phone.new(phone: nil)).to be_invalid
  end
end