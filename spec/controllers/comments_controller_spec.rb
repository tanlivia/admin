require 'spec_helper'

describe CommentsController, :type => :controller do
  describe 'POST #create' do
    before :each do
      @post = FactoryGirl.create(:post)
      @comment = FactoryGirl.create(:comment, post: @post)
    end
    context "with valid attributes" do
      it "saves the new comment into the database" do
        expect {
          post :create, id: @comment, post_id: @post.id, comment: FactoryGirl.attributes_for(:comment)
        }.to change(Comment, :count).by(1)
      end

      it "redirects to comments#show" do
        post :create, id: @comment, post_id: @post.id, comment: FactoryGirl.attributes_for(:comment)
        expect(response).to redirect_to post_path(assigns[:post])
      end
    end

    context "with invalid attributes" do
      it "does not save the new comment into the database" do
        expect {
          post :create, id: @comment, post_id: @post.id, comment: FactoryGirl.attributes_for(:invalid_comment)
        }.to_not change(Comment, :count)
      end
    end
  end
end