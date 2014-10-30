require 'bundler/setup'
require 'digitalocean'
#require '../gschool-1/projects/feed_engine'

Digitalocean.client_id  = ENV['digital_ocean_client_id']
Digitalocean.api_key    = ENV['digital_ocean_api_key']

unless Digitalocean.client_id && Digitalocean.api_key
  raise "Need keys defined in ENV"
end

def size
  @size ||= Digitalocean::Size.all.sizes.detect{|s| s.name == "4GB"}
end

def image
  @image ||= Digitalocean::Image.all.images.detect{|i| i.name == ("Ubuntu 14.04 x64")}
end

def region
  @region ||= Digitalocean::Region.all.regions.detect{|r| r.slug == "nyc1"}
end

def provision_server(name)
  Digitalocean::Droplet.create({:name => name,
                                :size_id => size.id,
                                :image_id => image.id,
                                :region_id => region.id})
end

# project.each do |group, data|
#   name = data[:project_name].downcase.gsub(" ", "")
#   droplet = provision_server(name)
#   puts "Provisioned #{name}: #{droplet.inspect}"
# end

def students
  [
    "Chad Brading",
    "Gustavo Villagrana",
    "Hilary Denton",
    "Corey Davis",
    "Marc Garreau",
    "Emily Davis",
    "Robert Gu",
    "Jonmichael Chambers",
    "Eric Fransen",
    "Alan Smith",
    "Andrew Watkins",
    "Allison Larson",
    "Horacio Chavez",
    "Tim Proctor",
    "Tan Doan",
    "Will Faurot",
    "Andy Mention",
  ]
end

students.each do |student|
  name = student.downcase.scan(/\w/).join
  droplet = provision_server(name)
  puts "Provisioned #{name}: #{droplet.inspect}"
end
