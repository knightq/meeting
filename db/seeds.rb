# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

[{:title => 'Presentazione Rails', 
  :body => 'Un''introduzione al framework di sviluppo applicazioni web Rails...', 
  :date => nil,
  :start_time => nil,
  :end_time => nil,
  :created_at => Date.today,
  :image_url => 'http://rubyonrails.org/images/rails.png'}
].each_with_index do |p, i|
  Meeting.find_or_create_by_title(p)
  puts %{
	  Creato evento #{i}:
	  Titolo: #{p[:title]}
	  Descrizione: #{p[:body]}
	  Data: #{p[:date]}
	}
end
