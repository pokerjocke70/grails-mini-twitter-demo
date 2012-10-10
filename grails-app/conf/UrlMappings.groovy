class UrlMappings {

	static mappings = {

        "/tweets/delete/$id"(controller: "tweet2", action: "delete")

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
