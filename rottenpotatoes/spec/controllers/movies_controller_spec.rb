require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# # then, whenever you need to clean the DB
DatabaseCleaner.clean

RSpec.describe MoviesController, type: :controller do

    movie_1 = Movie.create(title: 'movie_1', director: 'director1')
    movie_2 = Movie.create(title: 'movie_2', director: 'director1')
    movie_3 = Movie.create(title: 'movie_3', director: 'director2')
    movie_4 = Movie.create(title: 'movie_4')
    describe "searches movies with same director" do
        it "finds movies with same director" do
            get :moviesBySameDirector, id: movie_1.id
            expect(assigns(:movies)).to eq [movie_1, movie_2]
        end
        it "finds only this movie" do
            get :moviesBySameDirector, id: movie_3.id
            expect(assigns(:movie)).to eq movie_3
        end
        it "has no director information" do
            get :moviesBySameDirector, id: movie_4.id
            expect(flash[:notice]).to eq "'movie_4' has no director info."
            expect(response).to redirect_to movies_path
        end

        it 'should render two movies' do
        get :index
        response.should render_template :index
        end

    describe 'preexisting method test in before(:each)' do
        it 'should call find model method' do
          Movie.should_receive(:find).with('1')
          get :show, :id => '1'
        end

        it 'should render page correctoy' do
          get :index                        # method
          response.should render_template :index
        end


        it 'should create movie and redirect' do
          post :create,
               {:movie => { :title => "title", :description => "description", :director => "director", :rating => "R", :release_date =>"09/09/2010"}}
          response.should redirect_to movies_path
          expect(flash[:notice]).to be_present

        end
  end

    end

end  