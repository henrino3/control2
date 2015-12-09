class HomePagesController < ApplicationController


  def index
    if signed_in?
      render :layout => 'application'
    else
      render :layout => 'home_page'
    end
  end

end
