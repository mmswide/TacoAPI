== Taco API

==== Create Taco
    POST: /api/v1/tacos/add_taco

    parameters accepted
      name:          String *required
      description:       String *required minimum 6

      curl \
     -F "name=test" \
     -F "description=test---description" \
     http://localhost:3000/api/v1/tacos/
      results:
      {"status":1,"data":{"name":"test","description":"test---description"}}

==== Get Taco API
    POST: /api/v1/tacos/1
    parameters:
      id:      String *required
    results:
      {"status":1,"data":{"name":"test","description":"test---description"}}

==== Update Taco API

    PATCH: /api/v1/tacos/

    parameters accepted
      'name'      String,      *required
      'description'   String,      *requried
    results:


==== Delete Taco
    DELETE: /api/v1/tacos/
    parameters:
      id:      String *required
    results:
      return
    curl -X \
      "DELETE" \
      http://localhost:3000/api/v1/tacos/1
