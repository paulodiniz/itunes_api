class CategoriesController < ApplicationController

  def top
    render json: itunes_api_client.top_apps, status: :ok
  end

  def rank
  end

  private
  def itunes_api_client
    Itunes.new({
      category_id:  params[:category_id], 
      monetization: params[:monetization].to_sym
    })
  end
end
