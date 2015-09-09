require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { build(:product) }

  it "has valid factory" do
    expect(product).to be_valid
  end

  it "is not valid without name" do
    product.name = nil
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it "is not valid without description" do
    product.description = nil
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end

  it "is not valid without alias_name" do
    product.alias_name = nil
    product.valid?
    expect(product.errors[:alias_name]).to include("can't be blank")
  end

  it "is not valid without price" do
    product.price = nil
    product.valid?
    expect(product.errors[:price]).to include("can't be blank")
  end

  it "is not valid with duplicate alias_name" do
    product.save
    new_product = build(:product, alias_name: product.alias_name)
    new_product.valid?
    expect(new_product.errors[:alias_name]).to include("has already been taken")
  end

  it "is not valid with nonnumerical price" do
    product.price = "hello world"
    product.valid?
    expect(product.errors[:price]).to include("is not a number")
  end
end
