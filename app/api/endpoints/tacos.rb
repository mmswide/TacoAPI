module Endpoints
  class Tacos < Grape::API

    resource :tacos do

      # Tacos API test
      # /api/v1/tacos/ping
      # results  'huawan'
      get :ping do
        { :ping => 'lukas' }
      end

     # Get Taco
     # GET: /api/v1/tacos/1
     # parameters:
     #   id:          String *required

     # results:
     #   return taco of ID
     get '/:id' do
       taco = Taco.find_by(id: params[:id])
       if taco.present?
         {status: 1, data: taco.by_json}
       else
         {status: 0, data: {error: 'Cann\'t find your taco'}}
       end
     end



      # Add New Item
      # GET: /api/v1/tacos/add_taco
      # parameters:
      #   name:           String *required
      #   description:       String *required

      # results:
      #   return taco data

    #   curl \
    #  -F "name=test" \
    #  -F "description=test---description" \
    #  http://localhost:3000/api/v1/tacos/
    #
      post '/' do
        taco = Taco.new(name: params[:name], description: params[:description])

        if taco.save()
          {status: 1, data: taco.by_json}
        else
          {status: 0, data: {error: taco.errors.messages}}
        end
      end

      # Update Item
      # POST: /api/v1/tacos/
      # parameters:
      #   name:           String *required
      #   description         String *required

      # results:
      #   return taco data
      patch '/:id' do
        taco = Taco.find_by(id: params[:id])
        if taco.present?
          taco.update_attributes(name: params[:name], description: params[:description])
          {status: 1, data: taco.by_json}
        else
          {status: 0, data: {error: taco.errors.messages}}
        end
      end

      # curl -X \
      # "DELETE" \
      # http://localhost:3000/api/v1/tacos/1

      delete '/:id' do
        taco = Taco.find_by(id: params[:id])
        if taco.present?
          taco.destroy
          {status: 1, data: {message: "Deleted successfully"}}
        else
          {status: 0, data: {error: taco.errors.messages}}
        end

      end



    end
  end
end
