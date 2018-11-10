## command
- start
```
make setup
```

- login console
```
make console
```

- reset
```
make reset
```

## try graphql

```
{
  person(id:1){
    firstname,
    lastname
    emails {
      id
      email
    }
  }
}
```