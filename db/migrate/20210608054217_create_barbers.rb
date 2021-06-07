class CreateBarbers < ActiveRecord::Migration[6.1]
  def change
  	create_table :barbers do |t|
  		t.text :name

  		t.timestamps
  end

  Barber.create :name => 'Gus Frinken'
  Barber.create :name => 'Mishel Jar'
  Barber.create :name => 'Utkin Bro'
end
end
