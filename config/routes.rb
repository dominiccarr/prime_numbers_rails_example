Rails.application.routes.draw do
  
  root 'primes#checkprime'
  
  #root :controller=>'primes', action => 'checkprime'

  post '/validate', :controller=>'primes', :action=>'is_prime'
  
  get '/bounds' => 'primes#bounds'
  
end
