# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Create some starter projects
15.times do

  project = Project.create(:completion_date => Time.now + 5.days, :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas posuere metus non erat lacinia scelerisque. Donec pharetra, orci ut sollicitudin egestas, augue enim pharetra tellus, nec pretium metus est ac ante. Nulla varius lacinia tortor, ac dapibus elit vehicula non. Praesent bibendum quis est sed varius. Integer accumsan fringilla est, a elementum metus pulvinar nec. Nullam commodo malesuada tortor in tincidunt. Nullam vel facilisis augue, et ornare neque. Nunc vitae odio aliquet, pharetra ante in, vestibulum erat. Duis sed fringilla turpis, vitae tempor nisl. Praesent quis hendrerit massa, in pretium mauris. Nunc luctus ac lectus ut consectetur. Ut convallis mauris eget ante viverra, porttitor euismod erat tincidunt. Maecenas et varius sem. Aenean a elit non nibh ultricies volutpat at nec dui. Suspendisse lobortis purus vitae ipsum consectetur, vel feugiat erat vehicula. \n \n Aenean vel elementum nibh, imperdiet pretium orci. Ut ut gravida quam. Duis lectus felis, faucibus id placerat condimentum, venenatis et magna. Sed scelerisque ornare lectus, ut lacinia nisl ultricies quis. Morbi sed tempor sem. Donec tincidunt a arcu a dapibus. Etiam dignissim congue sem non lacinia. Ut vitae eros elit. Mauris mollis auctor nisl eget dapibus.", :name => "Duis lectus felis, faucibus id placerat condimentum, venenatis et magna.", :url => "http://google.com")

  Random.rand(10).times do
    project.tags.create( name: %w(development winner awesome proud happy first latest).sample)
  end

  Random.rand(10).times do
    project.tools.create( name: %w(ruby rails postgresql bootstrap jquery coffeescript).sample)
  end

  Random.rand(1..5).times do
    project.pictures.create(image: File.open(Dir["/Users/ben/Pictures/Stock\ Photos/wallpapers/*.jpg"].sample ))
  end
end
