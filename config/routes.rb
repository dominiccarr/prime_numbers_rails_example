Rails.application.routes.draw do
  
  root 'primes#checkprime'
  
  get '/bounds' => 'primes#bounds'
   
  post '/validate', :controller=>'primes', :action=>'is_prime'
  
end
