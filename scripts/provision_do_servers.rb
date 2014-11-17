require_relative 'provisioner_do'

students = [
    "Glen Egbert",
    "Ian Andersen",
    "Kavita Sachdeva",
    "Jim Sutton",
    "Aaron Paul Wortham",
    "Luke Aiken",
    "Sara Simon",
    "Rolando Navarrete",
    "Jessica Goulding"
  ]

pro = Provisioner::DO.new
students.each do |student|
  name = student.downcase.scan(/\w/).join
  droplet = pro.provision_server(name)
  puts "Provisioned #{name}: #{droplet.inspect}"
end
