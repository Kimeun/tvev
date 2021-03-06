class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:upload, :create, :ev]

  def index
    @tvs = Tv.all
    @banner = @tvs.sample
  end

  def detail
    @tv = Tv.find(params[:id])
  end

  def upload
  end

  def create
  end

  def ev
    Comment.create(tv_id: params[:id], user_id: current_user.id, score: params[:rating].to_i, comment: params[:msg])
    redirect_to :back
  end
end
