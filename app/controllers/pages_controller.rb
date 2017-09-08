class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @list = User.order("RANDOM()").first.list
  end

  def about
  end
end
