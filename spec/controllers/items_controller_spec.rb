require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'Get #index' do

    it "responds successfully" do
      get :index
      expect(response).to be_success
    end

    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'can save' do
      it 'count up product' do
        expect do
          post :create, params: {item: FactoryBot.attributes_for(:item)}.to change(Item,:count).by(1)
        end
      end
    end

    context 'can not save' do
      it 'does not count up' do
        expect do
          post :create,params: {item: FactoryBot.attributes_for(:item,name: nil, price: nil)}
        end.not_to change(Item,:count)
      end
    end
  end
end
