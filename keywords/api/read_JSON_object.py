import  json

    def query_sku_json_object(self, j_object, filter_attribute):
        data = json.loads(j_object);
        print( data["data"] )
        return;
ob = """
{
	"name": "Guido van Rossum",
	"age": 65,
	"degree": ["mathematics", "computer science"],
	"retired": true,
	"carrer": {
		"google":{
			"from": 1999,
			"to": 2013
		},
		"dropbox": {
			"from": 2013,
			"to": 2019
		}
	}
}
"""
#data = json.loads(ob)
#print(data)
query_sku_json_object(ob,"a")

