class CategoriesController < ApplicationController

  def top
    render json: itunes_api_client.top_apps, status: :ok
  end

  def rank
    render json: itunes_api_client.on_rank(params[:rank].to_i), status: :ok
  end

  def publishers
    render json: itunes_api_client.top_publishers, status: :ok
  end

  private
  def itunes_api_client
    Itunes.new({
      category_id:  params[:id], 
      monetization: params[:monetization].to_sym
    })
  end
end
