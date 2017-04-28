class TweetsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy ]
  
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet =Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
       redirect_to tweets_path, notice:"つぶやきました！"
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    @tweet.update(tweet_params)
    redirect_to tweets_path, notice:"つぶやきを編集しました！"
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice:"つぶやきを削除しました！"
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
  
end
