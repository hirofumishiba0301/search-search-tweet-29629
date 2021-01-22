class Favorite < ApplicationRecord
  belongs_to :article, counter_cache: :favorite_counts
  belongs_to :user
end
