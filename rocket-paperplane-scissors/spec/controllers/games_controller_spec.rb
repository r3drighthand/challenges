require 'rails_helper'

describe GamesController do
  let!(:game) { Game.create!(user_throw: Game::THROWS.sample) }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the recent games as @games" do
      get :index
      expect(assigns(:games)).to eq(Game.recent)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: game.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct game as @game" do
      get :show, { id: game.id }
      expect(assigns(:game)).to eq(game)
    end

    it "renders the :show template" do
      get :show, { id: game.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new game to @game" do
      get :new
      expect(assigns(:game)).to be_a_new Game
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when params are valid and the game is not a tie" do

      it "responds with status code 302" do
        allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")
        post :create, { game: {user_throw: "rock"} }
        expect(response).to have_http_status 302
      end

      it "creates a new game in the database" do
        game_count_before = Game.all.count
        allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")
        post :create, { game: {user_throw: "rock"} }
        game_count_after = Game.all.count
        expect(game_count_after).to eq game_count_before + 1
      end

      it "assigns the newly created game as @game" do
        allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")
        post :create, { game: {user_throw: "rock"} }
        new_game = Game.last
        expect(assigns(:game)).to be_a Game
        expect(assigns(:game)).to eq new_game
      end

      it "sets a notice that the game was successfully created" do
        allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")
        post :create, { game: {user_throw: "rock"} }
        expect(flash[:notice]).to eq 'Game was successfully created.'
      end

      it "redirects to the created game" do
        allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")
        post :create, { game: {user_throw: "rock"} }
        new_game = Game.last
        expect(response).to redirect_to(new_game)
      end
    end

    context "when the game is a tie" do
      it "does not create a new game in the database" do
        game_count_before = Game.all.count
        allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")
        post :create, { game: { user_throw: "paper", computer_throw: "paper" } }
        game_count_after = Game.all.count
        expect(game_count_after).to eq game_count_before
      end

      it "assigns the unsaved game as @game" do
        allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")
        post :create, { game: { user_throw: "paper", computer_throw: "paper" } }
        expect(assigns(:game)).to be_a_new Game
      end

      it "renders the :new template" do
        allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")
        post :create, { game: { user_throw: "paper" } }
        expect(response).to render_template("new")
      end

    end

    context "when invalid params are passed" do

      it "responds with status code 422: Unprocessable Entity" do
        post :create, { game: { user_throw: "pineapple" } }
        expect(response).to have_http_status 422
      end

      it "does not create a new game in the database" do
        game_count_before = Game.all.count
        post :create, { game: { user_throw: "pineapple" } }
        game_count_after = Game.all.count
        expect(game_count_after).to eq game_count_before
      end

      it "assigns the unsaved game as @game" do
        post :create, { game: { user_throw: "pineapple" } }
        expect(assigns(:game)).to be_a_new Game
      end

      it "renders the :new template" do
        post :create, { game: { user_throw: "pineapple" } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "responds with status code 302" do
      delete :destroy, { id: game.id }
      expect(response).to have_http_status 302
    end

    it "destroys the requested game" do
      expect { delete(:destroy, { id: game.id }) }.to change(Game, :count).by(-1)
    end

    it "sets a notice that the game was destroyed" do
      delete :destroy, { id: game.id }
      expect(flash[:notice]).to match "Game was successfully destroyed"
    end

    it "redirects to the games list" do
      delete :destroy, { id: game.id }
      expect(response).to redirect_to games_url
    end
  end
end
