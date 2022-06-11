module Web3BuildingBlocks
class EditorController < ::ApplicationController
    def logged_in
      render json: CurrentUserSerializer.new(current_user, scope: guardian, root: false)
      
      #render_serialized(current_user, UserSerializer)
      #render json: { message: "removed" }
    end

    def index

        render file: File.expand_path('../../../public/editor/index.html', __FILE__), layout:false 
  
    end
  end
end