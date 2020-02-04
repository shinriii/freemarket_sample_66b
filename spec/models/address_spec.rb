require 'rails_helper'

describe Address do
  describe '#create' do
    it "address_firstname,address_lastname,address_kana_firstname,address_kana_lastname,  zipcode, prefectures,  municipalities, address" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "is invalid without a address_firstname" do
      address = build(:address, address_firstname: nil)
      address.valid?
      expect(address.errors[:address_firstname]).to include("を入力してください")
    end

    it "is invalid without a address_lastname" do
      address = build(:address, address_lastname: nil)
      address.valid?
      expect(address.errors[:address_lastname]).to include("を入力してください")
    end

    it "is invalid without a address_kana_firstname" do
      address = build(:address, address_kana_firstname: nil)
      address.valid?
      expect(address.errors[:address_kana_firstname]).to include("を入力してください")
    end

    it "is invalid without a address_kana_firstname" do
      address = build(:address, address_kana_lastname: nil)
      address.valid?
      expect(address.errors[:address_kana_lastname]).to include("を入力してください")
    end

    it "is invalid without a zipcode" do
      address = build(:address, zipcode: nil)
      address.valid?
      expect(address.errors[:zipcode]).to include("を入力してください")
    end

    it "is invalid without a prefectures" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "is invalid without a municipalities" do
      address = build(:address, municipalities: nil)
      address.valid?
      expect(address.errors[:municipalities]).to include("を入力してください")
    end

    it "is invalid without a zipcode" do
      address = build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end
  end
end