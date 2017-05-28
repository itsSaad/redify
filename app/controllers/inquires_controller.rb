class InquiresController < ApplicationController
  # responds_to :json

  def health_status
    render json: {message: 'ALIVE'}, status: :ok
  end
  
  def find
    val = get_value key
    if val == -1 or val == -2 or !val.present?
      render json: {message: "No object found for #{key}"}, status: 404 and return
    end
    render json: {key: key, value: val}, status: 200
  end

  def create
    if set_value key, value
      render json: {message: "OK"}, status: 201
    end
  end

  private
  def key
    @key ||= params[:key]
  end
  def value
    @value ||= params[:value]
  end
end
