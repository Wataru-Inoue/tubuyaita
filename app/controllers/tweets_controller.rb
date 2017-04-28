class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet =Tweet.new
  end
  
  def create
    Tweet.creat(tweets_params)
    redirect_to tweets_path
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to tweets_path
  end
  
  def destroy
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
  
end
