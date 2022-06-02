module Web3BuildingBlocks
class EditorController < ::ApplicationController
    def index

        render file: File.expand_path('../../../public/editor/index.html', __FILE__), layout:false 
  
    end
  end
end