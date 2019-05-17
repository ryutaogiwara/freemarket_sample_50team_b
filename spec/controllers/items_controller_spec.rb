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
end
