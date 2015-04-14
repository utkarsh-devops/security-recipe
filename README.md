# security-recipe
#node.json

{

  "run_list": [ "recipe[security]" ]
 }





#solo.rb

#file_cache_path "/home/ubuntu/chef"
cookbook_path "/root/test/cookbooks"

  json_attribs "/root/test/node.json"

