require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
    context 'User logged in' do 
        before(:each, :logged_in => true) do
            @request.env["devise.mapping"] = Devise.mappings[:user]
            user = FactoryBot.build(:user)
            sign_in user
        end

        it 'documents#index should return home page' do 
            get :index
            expect(response).to redirect_to new_user_session_path
        end 

        it 'documents#create should add new document ' do 
            post :create, params: { document: { 
                user_document: {} } 
            }, as: :json
            expect(response).to redirect_to root_path
        end 

        it 'documents#update should update is shared and redirect to homepage' do 
            patch :update, params: { id: 'asdadaasdqweq', document: {shared: "1"} }
            expect(response).to redirect_to root_path
        end 

        it 'documents#destroy should return login form' do 
            delete :destroy, params: { id: 'asdadaasdqweq' }
            expect(response).to redirect_to root_path
        end 
    end
end