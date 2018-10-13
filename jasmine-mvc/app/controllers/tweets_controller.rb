class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order("created_at DESC")
  end

  def create
    @tweet = Tweet.new(content: params[:content], username: params[:username])
    if @tweet.save
      redirect_to root_url
    else
      render plain: "Error saving tweet", status: 422
    end
  end

end
