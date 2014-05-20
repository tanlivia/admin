require 'spec_helper'

describe UsersController, :type => :controller do

  describe 'GET #new' do
    it 'assigns a new user to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders the :new template' do
      get 'new'
      expect(response).to render_template("users/new")
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new user into the database" do
        expect {
          post :create, user: { username: "aaa", password: "bbb", locale: "en" }
        }.to change(User, :count).by(1)
      end

      it "redirects to source" do
        post :create, user: { username: "aaa", password: "bbb", locale: "en" }
        expect(response).to redirect_to '/source'
      end
    end

    context "with invalid attributes" do
      it "does not save the new user into the database" do
        expect {
          post :create, user: { username: "aaa", password: nil, locale: "en" }
        }.to_not change(User, :count)
      end

      it "re-renders the :new template" do
        post :create, user: { username: "aaa", password: nil, locale: "en" }
        expect(response).to render_template :new
      end
    end
  end
end