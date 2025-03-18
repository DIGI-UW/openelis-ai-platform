# openelis-ai-platform

### Run OpenELIS Global

    docker compose -f ./projects/openelis/docker-compose.yml  up -d

Access OpenELIS Global at https://localhost/  with  `admin: adminADMIN!`

### Run FHIR pipes and RAG app

    docker compose -f ./projects/fhirpipes/docker-compose.yaml  up -d

Access Pipeline Controller at  http://localhost:8090/

Access RAG app at  http://localhost:8282/

#### Connection to  to the spack DB
*  user name : hive 
* Port : 10001
* Passowrd : ""
* Databse : default


