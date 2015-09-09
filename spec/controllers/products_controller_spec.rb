require 'rails_helper'

RSpec.describe Api::ProductsController, type: :controller do

  describe "GET #index" do
    before(:each) do
      @product_one = create(:product)
      @product_two = create(:product)
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns json representation of products" do
      get :index
      resp = JSON.parse(response.body, symbolize_names: true)
      product_names = resp[:products].map { |pr| pr[:name] }
      expect(product_names).to match_array([@product_one.name, @product_two.name])
    end
  end

  describe "GET #show" do
    before(:each) do
      @product = create(:product)
    end

    it "returns http success" do
      get :show, alias_name: @product
      expect(response).to have_http_status(:success)
    end

    it "returns json representation of a product" do
      get :show, alias_name: @product
      pr = JSON.parse(response.body, symbolize_names: true)[:product]
      expect(pr[:name]).to eq(@product.name)
      expect(pr[:description]).to eq(@product.description)
      expect(pr[:alias_name]).to eq(@product.alias_name)
      expect(pr[:price]).to eq(@product.price.to_s)
    end
  end

end
