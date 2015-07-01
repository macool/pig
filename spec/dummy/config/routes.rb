Rails.application.routes.draw do
  mount Pig::Engine, at: 'admin'
end
