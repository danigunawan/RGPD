class StatsController < ApplicationController
  def show
    @stats = User.all
    @total = 0
  end
end
