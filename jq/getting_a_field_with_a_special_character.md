# Getting a Field with a Special Character as a Key

[jq](https://stedolan.github.io/jq/) is a very handy command line tool when it comes to processing JSON or debugging the JSON API etc.


Let's say this is the JSON

```json
{
  "postId": 1,
  "id": 4,
  "name": "alias odio sit",
  "email": "Lew@alysha.tv",
  "field.nested": "this is a nested field",
  "special$character": "this one got a $ sign",
  "body": "hello hi how are you"
}
```
If we want to get the keys `field.nested` or `special$character`, we have to quote the field name. e.g
```bash
λ ~/ echo '{
  "postId": 1,
  "id": 4,
  "name": "alias odio sit",
  "email": "Lew@alysha.tv",
  "field.nested": "this is a nested field",
  "special$character": "this one got a $ sign",
  "body": "hello hi how are you"
}' | jq '."field.nested"'
"this is a nested field"

λ ~/ echo '{
  "postId": 1,
  "id": 4,
  "name": "alias odio sit",
  "email": "Lew@alysha.tv",
  "field.nested": "this is a nested field",
  "special$character": "this one got a $ sign",
  "body": "hello hi how are you"
}' | jq '."special$character"'
"this one got a $ sign"
```

PS : This [jq kung fu](https://www.jqkungfu.com/) website is kind of neat!
