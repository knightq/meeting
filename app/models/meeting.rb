class Meeting < ActiveRecord::Base
  validates_presence_of :title, :body
  validates_uniqueness_of :title, :message => 'un''altro evento è presente con la stesso titolo.'
end
