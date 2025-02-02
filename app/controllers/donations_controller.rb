class DonationsController < ApplicationController
  require 'json'
  require 'net/http'
  require 'uri'
  before_action :set_donation, only: %i[show edit update destroy ]

  def index
    @donations = Donation.all
  end

  def show
    
  end

  def new
    @donation = Donation.new
  end

  

  def create
    @donation = Donation.new(donation_params)
    @donation.status = "pending"
    payload = JSON.dump({
      payment:{
        amount: @donation.amount,
        message: @donation.message,
        title: @donation.title,
      }
    })

    url = URI("https://biz-sandbox.soymach.com/payments")

    http = Net::HTTP.new(url.host, url.port)
    #create request
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = ENV["mach_key"]
    
    #set body
    request.body = payload
    response = http.request(request)

    response_body = JSON.parse(response.body)
    @donation.code = response_body["token"]
    
    repond_to do |format|
      if @donation.save!
        format.html { redirect_to @donation, notice: "Donation was successfully created" }
      end
    end

  end  


  private
  def set_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(:amount, :title, :message)
  end

end
