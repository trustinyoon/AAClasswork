require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "renders the user index" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it 'brings up the form to make a user' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    before :each do
      allow(subject).to receive(:log_in!).and_return(true)
    end

    let(:valid_params) {{ user: { username: 'trustin', password: '123456'} }}
    let(:invalid_params) {{ user: { username: '', password: '123'} }}

    context 'with valid params' do
      it 'creates a new user' do
        post :create, params: valid_params
        expect(User.last.username).to eq('trustin')
      end

      it "redirects to user index" do
        post :create, params: valid_params
        expect(response).to redirect_to(users_url)
      end
    end

    context 'with invalid params' do
      it 'renders new template' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end
end