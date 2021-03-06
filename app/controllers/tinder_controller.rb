class TinderController < ApplicationController
  include ApplicationHelper

  def index

    @game = Game.find(session[:id])
    @game.update_attributes(checked_tinder: true)
    @event_array = Event.tinder.where(seen?: false)
    if @event_array.empty?
      Event.reset_tinder
      @event_array = Event.tinder
    end
    @event = @event_array.sample
    @event.update_attributes(seen?: true)
    redirect_to tinder_path(@event)



    # @num = rand(50)
    # p @num
    # if @num >= 40
    #   @event = Event.find_by(name: "good-tinder")
    #   @attr_change = @event.attr_change
    #   gon.gametext = @event.text
    # elsif @num >= 20 && @num < 40
    #   @event = Event.find_by(name: "neutral-tinder")
    #   @attr_change = @event.attr_change
    #   gon.gametext = @event.text
    # else
    #   @event = Event.find_by(name: "bad-tinder")
    #   @attr_change = @event.attr_change
    #   gon.gametext = @event.text
    # end
    # gon.username = @game.username
    # gon.fomo = @game.fomo
    # gon.battery = @game.battery
    # gon.time = @game.time
    # gon.money = @game.money
    # gon.gameimage = "/assets/tinder.png"
  end

  def show
    @game = Game.find(session[:id])
    @event = Event.find(params[:id])
  end

  def update

  end

end