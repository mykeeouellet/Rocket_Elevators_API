class Quote < ApplicationRecord
   belongs_to :customer, optional: true

   # IBM Watson
   # You currently have XXX quotes awaiting processing
   # nb_quotes = Quote.all
   # request.body = JSON.dump({
   # "text" => "You currently have #{nb_quotes} quotes awaiting processing"})
end