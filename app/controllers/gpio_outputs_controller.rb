class GpioOutputsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gpio_outputs = GpioOutput.order(updated_at: :desc)
  end

  def show
    @gpio_output = GpioOutput.find(params[:id])
  end

end
