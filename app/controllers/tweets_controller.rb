class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet =Tweet.new
  end
  
  def create
    Tweet.creat(tweets_params)
    redirect_to tweets_path, notice:"tweetを投稿しました"
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to tweets_path, notice:"tweetを編集しました"
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice:"tweetを削除しました"
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
  
end
