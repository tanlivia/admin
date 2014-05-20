require 'spec_helper'

describe PostsController, :type => :controller do
  before do
    @post = FactoryGirl.create(:post)
  end
  subject {@post}

  describe 'GET #index' do
    it "populates an array of all posts" do
      post2 = FactoryGirl.create(:post, title: 'title2', body: 'body2')
      post3 = FactoryGirl.create(:post, title: 'title3', body: 'body3')
      get :index
      expect(assigns(:posts)).to match_array([@post, post2, post3])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns the requested post to @post" do
      get :show, id: @post
      expect(assigns(:post)).to eq @post
    end

    it "renders the :show template" do
      get :show, id: @post
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new post to @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'GET #edit' do
    it "assigns the requested post to @post" do
      get :edit, id: @post
      expect(assigns(:post)).to eq @post
    end

    it "renders the :edit template" do
      get :edit, id: @post
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new post into the database" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post, :count).by(1)
      end

      it "redirects to posts#show" do
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to post_path(assigns[:post])
      end
    end

    context "with invalid attributes" do
      it "does not save the new post into the database" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:invalid_post)
        }.to_not change(Post, :count)
      end

      it "re-renders the :new template" do
        post :create, post: FactoryGirl.attributes_for(:invalid_post)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    context "with valid attributes" do
      it "locates the requested @post" do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post)
        expect(assigns(:post)).to eq(@post)
      end

      it "changes @post's attributes" do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post, title: "newtitle", body: "newbody")
        @post.reload
        expect(@post.title).to eq("newtitle")
        expect(@post.body).to eq("newbody")
      end

      it "redirects to the updated post" do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to @post
      end
    end

    context "with invalid attributes" do
      it "does not change the post's attributes" do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post, title: "newtitle", body: nil)
        @post.reload
        expect(@post.title).to_not eq("newtitle")
        expect(@post.body).to_not eq("newbody")
      end

      it "redirects to the edit template" do
        put :update, id: @post, post: FactoryGirl.attributes_for(:invalid_post)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'delete the post' do
      expect {
        delete :destroy, id: @post
      }.to change(Post, :count).by(-1)
    end

    it 'redirects to posts#index' do
      delete :destroy, id: @post
      expect(response).to redirect_to posts_url
    end
  end

end