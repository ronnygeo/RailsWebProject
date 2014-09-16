require 'mongo'
class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :except => :create

  include Mongo

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    #@s3_direct_post = S3_BUCKET.presigned_post(key: "client_logo/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
    @client = Client.new
    @social = @client.socials.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    mongo_client = MongoClient.new("localhost", 27017)
    db = mongo_client.db("MCAAnalytics")
    client_collection = db.collection("clients")
    if @client.need_analytics?
    items_params = params[:client][:items]
    items_hash = {}
    if items_params
    items_params.split(';').each do |i|
      items_hash[i] = 0
    end
    end

    doc = {name: @client.name, facebook:@client.facebook_id, twitter:@client.twitter_id, score: 0, items:items_hash, negative:{}, positive:{}}
    #puts doc
    client_collection.insert(doc)
    end


    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        mongo_client = MongoClient.new("localhost", 27017)
        db = mongo_client.db("MCAAnalytics")
        client_collection = db.collection("clients")
        mongo_doc = client_collection.find_one({name: @client.name})
        #puts mongo_doc
        items_hash = mongo_doc["items"]

        if @client.need_analytics?
          items_params = params[:client][:items]
          if items_params
            items_params.split(';').each do |i|
              if items_hash[i].nil?
              items_hash[i] = 0
              end
            end
          end

          doc = {name: @client.name, facebook:@client.facebook_id, twitter:@client.twitter_id, score: 0, items:items_hash, negative:{}, positive:{}}
          #puts doc
          client_collection.update(mongo_doc,doc)
        end
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name,  :logo, :description, :address, :phone, :category_id, :email, :items, :need_analytics, :contact_person, :website, :facebook_id, :twitter_id)
    end
end
