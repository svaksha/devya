using JSON

function makeJsonFile()
  people = [Dict("name"=>"CoolGuy", "company"=>"tech") for i=1:10]
  companies = [Dict("name"=>"CoolTech", "address"=>"Bay Area") for i=1:5]

  data = Dict("people"=>people, "companies"=>companies)
  json_string = JSON.json(data)
#  return json_string()
  print(json_string)

  open("divFoo.json","w") do f
    JSON.print(f, json_string)
  end
end
@time makeJsonFile()


using LazyJSON
function json2()
           v = LazyJSON.parse(json)
           v["shapes"]["scope"]["enum"][1]
       end
@time json2()
