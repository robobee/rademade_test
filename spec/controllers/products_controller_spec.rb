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

    it "returns metadata" do
      get :index
      resp = JSON.parse(response.body, symbolize_names: true)
      expect(resp[:meta][:total_products]).to eq 2
    end

  end

  describe "GET #index with pagination" do
    before(:each) do
      @p_1 = create(:product)
      @p_2 = create(:product)
      @p_3 = create(:product)
      @p_4 = create(:product)
      @p_5 = create(:product)
    end

    context "without page attribute" do
      it "returns first 3 products" do
        get :index, page: 1
        resp = JSON.parse(response.body, symbolize_names: true)
        product_names = resp[:products].map { |pr| pr[:name] }
        expect(product_names).to match_array([@p_1.name, @p_2.name, @p_3.name])
      end
    end

    context "with valid page attribute" do
      it "returns first 3 products" do
        get :index, page: 1
        resp = JSON.parse(response.body, symbolize_names: true)
        product_names = resp[:products].map { |pr| pr[:name] }
        expect(product_names).to match_array([@p_1.name, @p_2.name, @p_3.name])
      end

      it "returns next 2 products" do
        get :index, page: 2
        resp = JSON.parse(response.body, symbolize_names: true)
        product_names = resp[:products].map { |pr| pr[:name] }
        expect(product_names).to match_array([@p_4.name, @p_5.name])
      end
    end

    context "with invalid page attribute" do
      it "does not break" do
        get :index, page: 'hello world!'
        resp = JSON.parse(response.body, symbolize_names: true)
        product_names = resp[:products].map { |pr| pr[:name] }
        expect(product_names).to match_array([@p_1.name, @p_2.name, @p_3.name]  )
      end
    end
  end

  describe "GET #show" do
    before(:each) do
      @product = create(:product)
    end

    it "returns http success" do
      get :show, alias_name: @product.alias_name
      expect(response).to have_http_status(:success)
    end

    it "returns json representation of a product" do
      get :show, alias_name: @product.alias_name
      pr = JSON.parse(response.body, symbolize_names: true)[:product]
      expect(pr[:name]).to eq(@product.name)
      expect(pr[:description]).to eq(@product.description)
      expect(pr[:alias_name]).to eq(@product.alias_name)
      expect(pr[:price]).to eq(@product.price.to_s)
    end
  end

end
