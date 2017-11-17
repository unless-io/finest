class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @list = User.order("RANDOM()").first.list
    @list = User.all.first(2).sample.list
  end

  def about
  end
end
