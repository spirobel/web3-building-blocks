# frozen_string_literal: true

# name: web3-building-blocks
# about: TODO
# version: 0.0.1
# authors: Discourse
# url: TODO
# required_version: 2.7.0
# transpile_js: true

enabled_site_setting :web3_building_blocks_enabled

after_initialize do
    module ::Web3BuildingBlocks
        PLUGIN_NAME ||= "web3_building_blocks"
    
        class Engine < ::Rails::Engine
          engine_name PLUGIN_NAME
          isolate_namespace Web3BuildingBlocks
        end
    
        class Error < StandardError; end
      end

      require_relative "app/controllers/editor_controller.rb"

    Web3BuildingBlocks::Engine.routes.draw do
      get '/logged_in' => 'editor#logged_in'
      get '/editor(/*all)' => 'editor#index'
    end

    Discourse::Application.routes.append do
      mount ::Web3BuildingBlocks::Engine, at: "/web3",  defaults: {format: "json"}
    end
end
