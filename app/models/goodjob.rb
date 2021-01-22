class Goodjob < ApplicationRecord
  belongs_to :article, counter_cache: :goodjobs_counts
  belongs_to :user
end
