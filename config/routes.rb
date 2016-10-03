Rails.application.routes.draw do
    
    root 'statics#index'
    get '/statics', to: 'statics#index'

    get '/articles/what_is_clean_beauty', to: 'articles#what_is_clean_beauty'
    get '/articles/starter_kit', to: 'articles#starter_kit'

    get '/brands', to: 'brands#index'
    get '/brands/:id', to: 'brands#show', as: 'brands_show'	# show should go after create, new, edit if I add routes for those later

    get '/products', to: 'products#index'

    # what url bar will show | controller method to use | helper route to use
    get '/products/makup', to: 'products#makeup', as: 'products_makeup'
    get '/products/body-hair', to: 'products#body_hair', as: 'products_body_hair'
    get '/products/other', to: 'products#other', as: 'products_other'

    get '/products/:id', to: 'products#show', as: 'products_show'    

end

#                        Prefix Verb URI Pattern                              Controller#Action
#                          root GET  /                                        statics#index
#                       statics GET  /statics(.:format)                       statics#index
# articles_what_is_clean_beauty GET  /articles/what_is_clean_beauty(.:format) articles#what_is_clean_beauty
#          articles_starter_kit GET  /articles/starter_kit(.:format)          articles#starter_kit
#                        brands GET  /brands(.:format)                        brands#index
#                   brands_show GET  /brands/:id(.:format)                    brands#show
#                      products GET  /products(.:format)                      products#index
#               products_makeup GET  /products/makup(.:format)                products#makeup
#            products_body_hair GET  /products/body-hair(.:format)            products#body_hair
# 				 products_other GET  /products/other(.:format)                products#other
#                 products_show GET  /products/:id(.:format)                  products#show

# what do the parts of the routes mean?
# 	'/brands/:id is the URL to be matched.
# 	to: 'brands' refers to the authors_controller.rb
# 	   #show refers to the show method within brands_controller.rb
# 	as: 'brands_show' refers to how we are naming our route, it is an alias for the full path /brands/:id
#      we can use this prefix/alias followed by _path in the erb files to refer to the route