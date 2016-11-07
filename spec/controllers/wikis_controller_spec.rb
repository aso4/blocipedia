require 'rails_helper'
require 'random_data'

RSpec.describe WikisController, type: :controller do
  let(:my_user) {
    user = User.create!(email: "user@bloccit.com", password: "password")
    user.confirm
    user
  }
  let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user) }
  before :each do
    sign_in my_user

  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: my_wiki.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, {id: my_wiki.id}
      expect(assigns(:wiki)).to eq(my_wiki)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @wiki" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Wiki by 1" do
      expect{post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Wiki,:count).by(1)
    end

    it "assigns the new wiki to @wiki" do
      post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user}
      expect(assigns(:wiki)).to eq Wiki.last
    end

    it "redirects to the new wiki" do
      post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user}
      expect(response).to redirect_to Wiki.last
    end
  end

#   describe "GET edit" do
#     it "returns http success" do
#       get :edit, {id: my_post.id}
#       expect(response).to have_http_status(:success)
#     end
#
#     it "renders the #edit view" do
#       get :edit, {id: my_post.id}
# # #1
#       expect(response).to render_template :edit
#     end
#
# # #2
#     it "assigns post to be updated to @post" do
#       get :edit, {id: my_post.id}
#
#       post_instance = assigns(:post)
#
#       expect(post_instance.id).to eq my_post.id
#       expect(post_instance.title).to eq my_post.title
#       expect(post_instance.body).to eq my_post.body
#     end
#   end

end
