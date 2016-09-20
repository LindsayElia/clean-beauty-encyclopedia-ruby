Rails.application.routes.draw do
    
    root 'statics#index'
    get '/statics', to: 'statics#index'

    get '/brands', to: 'brands#index'
    get '/brands/:id', to: 'brands#show', as: 'brands_show'	# this should go after create, new, edit if I add routes for those later

    get '/products', to: 'products#index'
    get '/products/:id', to: 'products#show', as: 'products_show'	# same comment ^^

end

#        Prefix Verb URI Pattern             Controller#Action
#          root GET  /                       statics#index
#       statics GET  /statics(.:format)      statics#index
#        brands GET  /brands(.:format)       brands#index
#   brands_show GET  /brands/:id(.:format)   brands#show
#      products GET  /products(.:format)     products#index
# products_show GET  /products/:id(.:format) products#show

# what do the parts of the routes mean?
# 	'/brands/:id is the URL to be matched.
# 	to: 'brands' refers to the authors_controller.rb
# 	   #show refers to the show method within brands_controller.rb
# 	as: 'brands_show' refers to how we are naming our route, it is an alias for the full path /brands/:id
#      we can use this prefix/alias followed by _path in the erb files to refer to the route