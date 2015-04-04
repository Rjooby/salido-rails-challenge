require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do

  describe "GET call on index" do

    before(:each) do
      FactoryGirl.create :product, name: "Chungir Merlot"
      FactoryGirl.create :product, name: "Chizely Zinfandel"
      FactoryGirl.create :product, name: "Emmasel Pinot Noir"
    end

    it "returns entire list of products" do
      get :index, format: :json

      body = JSON.parse(response.body)
      products = body.map { |w| w["name"] }

      expect(products).to match_array(["Chungir Merlot", "Chizely Zinfandel", "Emmasel Cabernet"])
      expect(response.status).to eq 200

    end

  end

  describe "POST #create" do
    it "creates a new product" do

      product_params = {
        "product" => {
          "name" => "Erada Cabernet",
          # "price_min" : 5,
          # "price_max" : 10,
          # "price_retail" : 6.99
          # "wine_type" : "Red Wines"
          # "region" : "New Jersey"
        }
      }

        request_headers = {
          "Accept" => "application/json",
          "Content-Type" => "application/json"
        }

        post :create, product_params, request_headers

        expect(Product.first.name).to eq "Erada Cabernet"
        expect(response.status).to eq 201

    end
  end

  describe "PUT #update" do
    it "updates an existing product" do
      @test = FactoryGirl.create :product, name: "", price_min: 20

      product_params ={
          "price_min" => 17
        }

      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      put :update, :id => @test.id, :product => {:price_min => 17}
      @test.reload

      expect(response.status).to eq 302
      expect(@test.price_min).to eq 17


    end
  end


end
