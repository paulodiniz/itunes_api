class AppController < ApplicationController
  def top
    top_apps = Itunes.new(category_id: params[:category_id], monetization: params[:monetization].to_sym).top_apps
    render json: top_apps, status: :ok
  end
end
