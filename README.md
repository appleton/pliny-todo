# Todos API - a Pliny sample app

An example of an API built with the [Pliny](https://github.com/interagent/pliny) gem.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## API

### Users

#### Create

```http
POST /users

HTTP/1.1 201 Created

{
  "created_at": "2015-07-17T13:22:12+00:00",
  "id": "a12b3cde-c7b1-4658-8a40-1e23b7d51287",
  "updated_at": "2015-07-17T13:22:12+00:00"
}
```

GET /users/~
Authorization: Bearer :user_id

HTTP/1.1 200 OK

{
  "created_at": "2015-07-17T13:22:12+00:00",
  "id": "a12b3cde-c7b1-4658-8a40-1e23b7d51287",
  "updated_at": "2015-07-17T13:22:12+00:00"
}
```

### Todos

All calls to `/todos` endpoints require a `Authorization: Bearer :user_id` header to be passed.

#### Create

```http
POST /todos
Authorization: Bearer :user_id

{"title": "shopping"}

HTTP/1.1 201 Created

{
  "completed": false,
  "created_at": "2015-07-17T13:22:39+00:00",
  "id": "6f7956f7-4ba5-402d-bc00-c22125f4972d",
  "links": {
    "user": "d12b2bae-c7b1-4658-8a40-1e23b7d51287"
  },
  "title": "shopping",
  "updated_at": "2015-07-17T13:22:39+00:00"
}
```

#### Update

```http
PATCH /todos
Authorization: Bearer :user_id

{"completed": true}

HTTP/1.1 200 OK

{
  "completed": true,
  "created_at": "2015-07-17T13:22:39+00:00",
  "id": "6f7956f7-4ba5-402d-bc00-c22125f4972d",
  "links": {
    "user": "d12b2bae-c7b1-4658-8a40-1e23b7d51287"
  },
  "title": "shopping",
  "updated_at": "2015-07-17T13:22:39+00:00"
}
```

#### List

```http
GET /todos
Authorization: Bearer :user_id

HTTP/1.1 200 OK

[
  {
    "completed": true,
    "created_at": "2015-07-17T13:22:39+00:00",
    "id": "6f7956f7-4ba5-402d-bc00-c22125f4972d",
    "links": {
      "user": "d12b2bae-c7b1-4658-8a40-1e23b7d51287"
    },
    "title": "shopping",
    "updated_at": "2015-07-17T13:22:39+00:00"
  }
]
```

#### Show

```http
GET /todos/:todo_id
Authorization: Bearer :user_id

HTTP/1.1 200 OK

{
  "completed": true,
  "created_at": "2015-07-17T13:22:39+00:00",
  "id": "6f7956f7-4ba5-402d-bc00-c22125f4972d",
  "links": {
    "user": "d12b2bae-c7b1-4658-8a40-1e23b7d51287"
  },
  "title": "shopping",
  "updated_at": "2015-07-17T13:22:39+00:00"
}
```
