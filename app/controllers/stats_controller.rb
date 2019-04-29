class StatsController < ApplicationController
  def show
    @stats = User.all
  end
end
