class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # GET Requests
  get "/messages" do
    messages = Message.all.order("created_at ASC")
    messages.to_json
  end

  # POST Requests
  post "/messages" do
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  # PATCH Requests
  patch "/messages/:id" do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  # DELETE Requests
  delete "/messages/:id" do
    message = Message.find(params[:id]).destroy
    message.to_json
  end
  
end
