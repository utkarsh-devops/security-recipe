# security-recipe

.......................................

-node.json

{

  "run_list": [ "recipe[security]" ]
 }



.........................................

-solo.rb

cookbook_path "/root/test/cookbooks"

  json_attribs "/root/test/node.json"

