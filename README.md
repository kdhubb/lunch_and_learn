# README

## Lunch and Learn
This is an API that exposes endpoints for users to find recipes from a given country and learning/history videos about that same country. You can have lunch while you learn!

---

**Setup:**

* Ruby 3.2.2
* Rails 7.0.6
* Bcrypt for password encryption and authentication
* Lockbox for API key generation/encryption
* Necessary API keys: 
  - [Edamam](https://www.edamam.com/) 
  - [Unsplash](https://unsplash.com/developers)
  - [YouTube](https://developers.google.com/youtube/v3/docs)

To setup, fork and clone then run `bundle install`

---

**Enpoints and JSON Schema**

*Request recipes by country:*

GET /api/v1/recipes?country=thailand

Example response: 
```
{
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Sriracha",
                "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/."
            }
        },
        {...},
        {...},
        {...},
        {etc},
    ]
}
```

No results on this endpoint will yield the following response: 
```
{
  "data": []
}
```

This endpoint also has a random country option:

  GET /api/v1/recipes?choose_country_for_me=true

This will yeild the same response with a random country selected.

---

*Request Learning Resources by Country*

  GET /api/v1/learning_resources?country=laos

This reponse contains an educational video and image links related to the country given. 

Example response: 

```{
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "laos",
            "video": {
                "title": "A Super Quick History of Laos",
                "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
                {
                    "alt_tag": "standing statue and temples landmark during daytime",
                    "url": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                },
                {
                    "alt_tag": "five brown wooden boats",
                    "url": "https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwyfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                },
                {
                    "alt_tag": "orange temples during daytime",
                    "url": "https://images.unsplash.com/photo-1563492065599-3520f775eeed?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwzfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                },
                {...},
                {...},
                {...},
                {etc},
              ]
        }
    }
}
```

No results on this endpoint will yield the following response: 

```{
  "data": {
      "id": null,
      "type": "learning_resource",
      "attributes": {
          "country": "Nameofcountry", # this value is the value used to search for learning resources
          "video": {},
          "images": []
      }
  }
}
```

---

*User Registration Request*

POST /api/v1/users
Content-Type: application/json
Accept: application/json

```
{
  "name": "Odell",
  "email": "goodboy@ruffruff.com",
  "password": "treats4lyf",
  "password_confirmation": "treats4lyf"
}

```

This post request will create a new table entry in the users table and respond with the following: 

```
{
  "data": {
    "type": "user",
    "id": "1",
    "attributes": {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}

```

---

